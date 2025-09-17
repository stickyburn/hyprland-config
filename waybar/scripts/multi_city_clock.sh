#!/bin/bash

# Multi-city clock script for waybar
# Reads from shared city state and shows time for selected city

CONFIG_FILE="$HOME/.config/waybar/scripts/cities_config.json"
STATE_FILE="/tmp/waybar_city_state"

# Read cities from config file
if [ -f "$CONFIG_FILE" ] && command -v jq >/dev/null 2>&1; then
    mapfile -t TIMEZONES < <(jq -r '.cities[].timezone' "$CONFIG_FILE")
    mapfile -t SHORT_CODES < <(jq -r '.cities[].short_code' "$CONFIG_FILE")
else
    # Fallback to hardcoded values
    TIMEZONES=("Asia/Kolkata" "America/New_York")
    SHORT_CODES=("IND" "NYC")
fi

# Get current city index from shared state
if [ -f "$STATE_FILE" ]; then
    CURRENT_INDEX=$(cat "$STATE_FILE")
else
    CURRENT_INDEX=0
    echo "$CURRENT_INDEX" > "$STATE_FILE"
fi

CURRENT_TIMEZONE="${TIMEZONES[$CURRENT_INDEX]}"
CURRENT_SHORT_CODE="${SHORT_CODES[$CURRENT_INDEX]}"

# Get current time for the selected timezone
CURRENT_TIME=$(TZ="$CURRENT_TIMEZONE" date "+%H:%M")
CURRENT_DAY=$(TZ="$CURRENT_TIMEZONE" date "+%a")

# Get local time for tooltip
LOCAL_TIME=$(date "+%H:%M")
LOCAL_DAY=$(date "+%a")
LOCAL_DATE=$(date "+%d %b")

# Create tooltip showing both local and selected city time
TOOLTIP="<b>$CURRENT_TIMEZONE</b>\\n$LOCAL_DAY, $LOCAL_DATE $LOCAL_TIME"

# JSON output for waybar (time only - city code handled by selector)
echo "{\"text\": \"$CURRENT_DAY $CURRENT_TIME\", \"tooltip\": \"$TOOLTIP\", \"class\": \"multi-clock\"}"