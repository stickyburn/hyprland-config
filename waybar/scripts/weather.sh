#!/bin/bash

# Simple weather script for waybar using wttr.in
# No API key required, just curl

# Configuration
CITY="Crossing+Republic+Ghaziabad"  # Change to your city
UNITS="m"       # m for metric (Celsius), u for US (Fahrenheit)
FORMAT="%C+%t"  # Format: weather condition + temperature

# Get weather data from wttr.in
WEATHER_DATA=$(curl -s "wttr.in/${CITY}?format=${FORMAT}&${UNITS}" 2>/dev/null)

# If curl fails, use fallback
if [ -z "$WEATHER_DATA" ] || [ "$WEATHER_DATA" = "???" ]; then
    CONDITION="Clear"
    TEMP="28"
else
    # Parse the weather data (format from wttr.in is like "Partly cloudy +22")
    CONDITION=$(echo "$WEATHER_DATA" | sed 's/ \+[0-9+-]*.*//')
    TEMP=$(echo "$WEATHER_DATA" | sed 's/.*+\([0-9+-]*\).*/\1/')
fi

# Map weather conditions to Nerd Font icons
case "${CONDITION,,}" in
    "clear"|"sunny") ICON="☀️" ;;
    "partly cloudy") ICON="⛅" ;;
    "cloudy"|"overcast") ICON="☁️" ;;
    "rain"|"light rain"|"shower") ICON="🌧️" ;;
    "heavy rain") ICON="⛈️" ;;
    "thunderstorm") ICON="🌩️" ;;
    "snow"|"light snow") ICON="❄️" ;;
    "heavy snow") ICON="🌨️" ;;
    "haze"|"mist") ICON="" ;;
    "fog") ICON="🌁" ;;
    "drizzle") ICON="🌦️" ;;
    "sleet") ICON="🧊" ;;
    *) ICON="🌡️" ;;  # Default icon
esac

# Simple text output with Nerd Font icons
echo "$ICON $TEMP°C"