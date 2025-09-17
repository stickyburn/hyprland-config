#!/bin/bash

# City selector module for waybar
# Handles city cycling and updates shared state

CONFIG_FILE="$HOME/.config/waybar/scripts/cities_config.json"
STATE_FILE="/tmp/waybar_city_state"

# Read cities from config file
if [ -f "$CONFIG_FILE" ] && command -v jq >/dev/null 2>&1; then
    mapfile -t DISPLAY_NAMES < <(jq -r '.cities[].display_name' "$CONFIG_FILE")
    mapfile -t SHORT_CODES < <(jq -r '.cities[].short_code' "$CONFIG_FILE")
else
    # Fallback to hardcoded values
    DISPLAY_NAMES=("India" "New York")
    SHORT_CODES=("IND" "NYC")
fi

# Get current city index
if [ -f "$STATE_FILE" ]; then
    CURRENT_INDEX=$(cat "$STATE_FILE")
else
    CURRENT_INDEX=0
    echo "$CURRENT_INDEX" > "$STATE_FILE"
fi

# Handle click events - cycle to next city
if [ "$1" = "next" ]; then
    CURRENT_INDEX=$(( (CURRENT_INDEX + 1) % ${#DISPLAY_NAMES[@]} ))
    echo "$CURRENT_INDEX" > "$STATE_FILE"
    # Refresh all modules
    pkill -RTMIN+10 waybar
    # Exit after handling click (no output needed)
    exit 0
fi

# Output the current city short code for display
CURRENT_DISPLAY_NAME="${DISPLAY_NAMES[$CURRENT_INDEX]}"
CURRENT_SHORT_CODE="${SHORT_CODES[$CURRENT_INDEX]}"

# Create tooltip with full city name
TOOLTIP="<b>$CURRENT_DISPLAY_NAME</b>\\nClick to change city"

# JSON output for waybar
echo "{\"text\": \"$CURRENT_SHORT_CODE\", \"tooltip\": \"$TOOLTIP\", \"class\": \"city-selector\"}"