#!/bin/bash

# Multi-city weather script for waybar
# Shows weather for currently selected city

CONFIG_FILE="$HOME/.config/waybar/scripts/cities_config.json"
UNITS="metric"  # metric/imperial
STATE_FILE="/tmp/waybar_city_state"
CACHE_DIR="/tmp/waybar_weather_cache"
CACHE_DURATION=1800

# Read cities from config file
if [ -f "$CONFIG_FILE" ] && command -v jq >/dev/null 2>&1; then
    # Use mapfile to properly handle spaces in city names
    mapfile -t CITIES < <(jq -r '.cities[].weather_name' "$CONFIG_FILE")
    mapfile -t LATITUDES < <(jq -r '.cities[].latitude' "$CONFIG_FILE")
    mapfile -t LONGITUDES < <(jq -r '.cities[].longitude' "$CONFIG_FILE")
    mapfile -t SHORT_CODES < <(jq -r '.cities[].short_code' "$CONFIG_FILE")
else
    # Fallback to hardcoded values if config file or jq is not available
    CITIES=("Ghaziabad, UP" "Greer, SC")
    LATITUDES=("28.67" "40.71")
    LONGITUDES=("77.42" "-74.01")
    SHORT_CODES=("IND" "NYC")
fi

# Ensure cache directory exists
mkdir -p "$CACHE_DIR"

# Get current city index from shared state
if [ -f "$STATE_FILE" ]; then
    CURRENT_INDEX=$(cat "$STATE_FILE")
else
    CURRENT_INDEX=0
    echo "$CURRENT_INDEX" > "$STATE_FILE"
fi

CURRENT_CITY="${CITIES[$CURRENT_INDEX]}"
CURRENT_SHORT_CODE="${SHORT_CODES[$CURRENT_INDEX]}"
CACHE_FILE="${CACHE_DIR}/weather_${CURRENT_CITY// /_}.json"

get_weather_data() {
    local city="$1"
    local cache_file="${CACHE_DIR}/weather_${city// /_}.json"
    
    if [ -f "$cache_file" ]; then
        CACHE_TIME=$(stat -c %Y "$cache_file" 2>/dev/null || echo 0)
        CURRENT_TIME=$(date +%s)
        if [ $((CURRENT_TIME - CACHE_TIME)) -lt $CACHE_DURATION ]; then
            cat "$cache_file"
            return 0
        fi
    fi

    # Get coordinates for the city from config arrays
    local lat lon
    for i in "${!CITIES[@]}"; do
        if [ "${CITIES[$i]}" = "$city" ]; then
            lat="${LATITUDES[$i]}"
            lon="${LONGITUDES[$i]}"
            break
        fi
    done
    
    # Default to first city if coordinates not found
    if [ -z "$lat" ] || [ -z "$lon" ]; then
        lat="${LATITUDES[0]}"
        lon="${LONGITUDES[0]}"
    fi

    URL="https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current=temperature_2m,relative_humidity_2m,apparent_temperature,pressure_msl,wind_speed_10m,weather_code&timezone=auto"
    WEATHER_DATA=$(curl -s "$URL" 2>/dev/null)
    
    if [ -n "$WEATHER_DATA" ] && echo "$WEATHER_DATA" | grep -q '"temperature_2m":'; then
        echo "$WEATHER_DATA" > "$cache_file"
        echo "$WEATHER_DATA"
        return 0
    else
        return 1
    fi
}

if WEATHER_DATA=$(get_weather_data "$CURRENT_CITY"); then
    # Parse Open-Meteo JSON data using jq if available, or fallback to grep
    if command -v jq >/dev/null 2>&1; then
        TEMP=$(echo "$WEATHER_DATA" | jq -r '.current.temperature_2m' | cut -d. -f1)
        FEELS_LIKE=$(echo "$WEATHER_DATA" | jq -r '.current.apparent_temperature' | cut -d. -f1)
        HUMIDITY=$(echo "$WEATHER_DATA" | jq -r '.current.relative_humidity_2m')
        WIND_SPEED=$(echo "$WEATHER_DATA" | jq -r '.current.wind_speed_10m')
        PRESSURE=$(echo "$WEATHER_DATA" | jq -r '.current.pressure_msl')
        WEATHER_CODE=$(echo "$WEATHER_DATA" | jq -r '.current.weather_code')
    else
        # Fallback to grep if jq is not available
        TEMP=$(echo "$WEATHER_DATA" | grep -o '"temperature_2m":[0-9.-]*' | cut -d: -f2 | cut -d. -f1)
        FEELS_LIKE=$(echo "$WEATHER_DATA" | grep -o '"apparent_temperature":[0-9.-]*' | cut -d: -f2 | cut -d. -f1)
        HUMIDITY=$(echo "$WEATHER_DATA" | grep -o '"relative_humidity_2m":[0-9]*' | cut -d: -f2)
        WIND_SPEED=$(echo "$WEATHER_DATA" | grep -o '"wind_speed_10m":[0-9.-]*' | cut -d: -f2)
        PRESSURE=$(echo "$WEATHER_DATA" | grep -o '"pressure_msl":[0-9.-]*' | cut -d: -f2 | cut -d. -f1)
        WEATHER_CODE=$(echo "$WEATHER_DATA" | grep -o '"weather_code":[0-9]*' | cut -d: -f2)
    fi
    
    # Map weather code to condition descriptions
    case "$WEATHER_CODE" in
        0) CONDITION="Clear"; DESCRIPTION="Clear sky" ;;
        1|2|3) CONDITION="Partly cloudy"; DESCRIPTION="Partly cloudy" ;;
        45|48) CONDITION="Fog"; DESCRIPTION="Fog" ;;
        51|53|55) CONDITION="Drizzle"; DESCRIPTION="Light drizzle" ;;
        61|63|65) CONDITION="Rain"; DESCRIPTION="Rain" ;;
        71|73|75) CONDITION="Snow"; DESCRIPTION="Snow" ;;
        80|81|82) CONDITION="Shower"; DESCRIPTION="Rain showers" ;;
        95|96|99) CONDITION="Thunderstorm"; DESCRIPTION="Thunderstorm" ;;
        *) CONDITION="Clear"; DESCRIPTION="Clear" ;;
    esac
    
    CITY_NAME="$CURRENT_CITY"
else
    TEMP="28"
    FEELS_LIKE="28"
    HUMIDITY="60"
    WIND_SPEED="2.5"
    PRESSURE="1013"
    CONDITION="Clear"
    DESCRIPTION="Clear"
    CITY_NAME="$CURRENT_CITY"
fi

case "${CONDITION,,}" in
    "clear"|"sunny") ICON="󰖨" ;;
    "partly cloudy"|"cloudy"|"overcast"|"broken clouds"|"few clouds"|"scattered clouds") ICON="" ;;
    "rain"|"light rain"|"shower"|"drizzle") ICON="" ;;
    "heavy rain"|"thunderstorm") ICON="" ;;
    "snow"|"light snow"|"heavy snow") ICON="" ;;
    "fog"|"mist") ICON="󱖆" ;;
    "haze") ICON="󱖆" ;;
    *) ICON="" ;;
esac

# Create detailed tooltip with city indicator
TOOLTIP="<b>$CITY_NAME</b>\\n$DESCRIPTION\\nTemperature: $TEMP°C\\nFeels like: $FEELS_LIKE°C\\nHumidity: $HUMIDITY%\\nWind: $WIND_SPEED m/s\\nPressure: $PRESSURE hPa"

# JSON output for waybar (no city code - only icon and temperature)
echo "{\"text\": \"$ICON $TEMP°C\", \"tooltip\": \"$TOOLTIP\", \"class\": \"multi-weather\"}"