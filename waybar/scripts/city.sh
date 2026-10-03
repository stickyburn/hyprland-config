#!/bin/bash
set -euo pipefail

config="$HOME/.config/waybar/scripts/cities_config.json"
state_dir="${XDG_RUNTIME_DIR:-${TMPDIR:-/tmp}/waybar-$UID}"
state_file="$state_dir/waybar-city"
mkdir -p "$state_dir"

index=0
if [[ -r "$state_file" ]]; then
    read -r index < "$state_file" || index=0
fi
[[ "$index" =~ ^(0|[1-9][0-9]*)$ ]] || index=0

selection=$(jq -er --argjson index "$index" '
    .cities | select(length > 0) | length as $count |
    ($index % $count) as $index | .[$index] |
    [$count, $index, .display_name, .short_code, .timezone,
     .weather_name, .latitude, .longitude] | @tsv
' "$config")
IFS=$'\t' read -r count index city short_code timezone weather_name lat lon <<< "$selection"

case "${1:-selector}" in
    next)
        printf '%s\n' "$(((index + 1) % count))" > "$state_file"
        pkill -RTMIN+10 -x waybar || true
        exit
        ;;
    selector)
        text="$short_code"
        tooltip="$city"$'\nClick to change city'
        class="city-selector"
        ;;
    clock)
        IFS='|' read -r text date_text < <(TZ="$timezone" date '+%a %I:%M%p|%a, %d %b %I:%M%p')
        tooltip="$timezone"$'\n'"$date_text"
        class="multi-clock"
        ;;
    weather)
        cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/waybar/weather"
        cache_file="$cache_dir/${lat}_${lon}.json"
        mkdir -p "$cache_dir"

        # Parse once, rejecting responses without a real temperature and weather code.
        weather_values() {
            jq -er '
                select(.current.temperature_2m | type == "number") |
                select(.current.weather_code | type == "number") |
                [.current.temperature_2m | trunc] +
                [.current.apparent_temperature // "—", .current.relative_humidity_2m // "—",
                 .current.wind_speed_10m // "—", .current.pressure_msl // "—",
                 .current.weather_code, .current_units.wind_speed_10m // "km/h"] | @tsv
            ' 2>/dev/null
        }

        values=""
        fetched=0
        if [[ -r "$cache_file" ]]; then
            values=$(weather_values < "$cache_file") || values=""
            fetched=$(stat -c %Y "$cache_file")
        fi

        class="multi-weather"
        if [[ -z "$values" ]] || (( $(date +%s) - fetched >= 1800 )); then
            url="https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,relative_humidity_2m,apparent_temperature,pressure_msl,wind_speed_10m,weather_code&wind_speed_unit=ms&timezone=auto"
            if fresh=$(curl --fail --silent --connect-timeout 2 --max-time 5 "$url") &&
                new_values=$(weather_values <<< "$fresh"); then
                values="$new_values"
                cache_tmp=$(mktemp "$cache_file.XXXXXX")
                trap 'rm -f "$cache_tmp"' EXIT
                printf '%s\n' "$fresh" > "$cache_tmp"
                mv -- "$cache_tmp" "$cache_file"
            else
                class="multi-weather stale"
            fi
        fi

        if [[ -z "$values" ]]; then
            text="󰖐   N/A"
            tooltip="$weather_name"$'\nWeather unavailable: request failed or timed out.'
            class="multi-weather unavailable"
        else
            IFS=$'\t' read -r temp feels_like humidity wind pressure code wind_unit <<< "$values"
            case "$code" in
                0) icon="󰖨"; condition="Clear sky" ;;
                1|2) icon=""; condition="Partly cloudy" ;;
                3) icon=""; condition="Overcast" ;;
                45|48) icon="󱖆"; condition="Fog" ;;
                51|53|55) icon=""; condition="Drizzle" ;;
                56|57) icon=""; condition="Freezing drizzle" ;;
                61|63|65) icon=""; condition="Rain" ;;
                66|67) icon=""; condition="Freezing rain" ;;
                71|73|75|77|85|86) icon="󰖘"; condition="Snow" ;;
                80|81|82) icon=""; condition="Rain showers" ;;
                95|96|99) icon=""; condition="Thunderstorm" ;;
                *) icon=""; condition="Unknown conditions" ;;
            esac
            text="$icon   $temp°C"
            tooltip="$weather_name"$'\n'"$condition"$'\n'"Temperature: $temp°C"$'\n'"Feels like: $feels_like°C"$'\n'"Humidity: $humidity%"$'\n'"Wind: $wind $wind_unit"$'\n'"Pressure: $pressure hPa"
            if [[ "$class" == *stale ]]; then
                text+="*"
                tooltip+=$'\n\n'"Stale data — last fetched $(date -d "@$fetched" '+%a %d %b %H:%M')."
            fi
        fi
        ;;
    *)
        echo "Usage: $0 {selector|next|clock|weather}" >&2
        exit 2
        ;;
esac

jq -cn --arg text "$text" --arg tooltip "$tooltip" --arg class "$class" \
    '{text: ($text | @html), tooltip: ($tooltip | @html), class: ($class | split(" "))}'
