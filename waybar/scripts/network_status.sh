#!/bin/bash
set -euo pipefail

# Separate samples per output so multiple bars do not consume each other's data.
state_dir="${XDG_RUNTIME_DIR:-${TMPDIR:-/tmp}/waybar-$UID}/waybar"
state_file="$state_dir/network-${WAYBAR_OUTPUT_NAME:-default}"
mkdir -p "$state_dir"
interface=$(ip -j route show default | jq -r '.[0].dev // empty')

if [[ -z "$interface" || ! -r "/sys/class/net/$interface/operstate" ]] ||
    [[ $(< "/sys/class/net/$interface/operstate") != up ]]; then
    printf '%s\n' '{"text":"<b>󰌙</b> ▁","tooltip":"Disconnected","class":"disconnected"}'
    rm -f "$state_file"
    exit 0
fi

icon="󰌘"
[[ ! -d "/sys/class/net/$interface/wireless" ]] || icon="󰤨"
now=$(date +%s)
rx=$(< "/sys/class/net/$interface/statistics/rx_bytes")
tx=$(< "/sys/class/net/$interface/statistics/tx_bytes")
meter="▁"
tooltip="Interface: $interface"

# Ignore stale samples after an interface change or a counter reset.
if [[ -r "$state_file" ]] &&
    read -r previous_interface previous_time previous_rx previous_tx < "$state_file" &&
    [[ "$previous_interface" == "$interface" &&
       "$previous_time $previous_rx $previous_tx" =~ ^[0-9]+\ [0-9]+\ [0-9]+$ ]] &&
    (( now > previous_time && rx >= previous_rx && tx >= previous_tx )); then
    read -r down up level < <(awk -v rx="$((rx - previous_rx))" \
        -v tx="$((tx - previous_tx))" -v elapsed="$((now - previous_time))" '
        BEGIN {
            down = rx * 8 / elapsed / 1000000
            up = tx * 8 / elapsed / 1000000
            percent = int(down * 100 / 35)
            if (percent > 100) percent = 100
            printf "%.1f %.1f %d\n", down, up, int(percent * 8 / 101)
        }')
    blocks=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)
    meter="${blocks[level]}"
    tooltip+=$'\n'"↓ $down Mbps      ↑ $up Mbps"
fi

printf '%s %s %s %s\n' "$interface" "$now" "$rx" "$tx" > "$state_file"
jq -cn --arg text "<b>$icon</b> $meter" --arg tooltip "$tooltip" \
    '{text: $text, tooltip: $tooltip, class: "connected"}'
