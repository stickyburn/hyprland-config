#!/bin/bash

# Shows icon + single vertical block character
# Speed details in tooltip.

STATE_FILE="/tmp/waybar_network_state"
INTERFACE=$(ip route show default 2>/dev/null | awk '{print $5}' | head -n1)
CURRENT_TIME=$(date +%s)

# Check if we have an active interface
if [ -z "$INTERFACE" ] || [ ! -d "/sys/class/net/$INTERFACE" ] || [ "$(cat /sys/class/net/$INTERFACE/operstate 2>/dev/null)" != "up" ]; then
  echo '{"text": "<b>󰌙</b> ▁", "tooltip": "Disconnected", "class": "disconnected"}'
  [ -f "$STATE_FILE" ] && rm -f "$STATE_FILE"
  exit 0
fi

# Determine icon based on interface type
if [ -d "/sys/class/net/$INTERFACE/wireless" ]; then
  ICON="󰤨"
else
  ICON="󰌘"
fi

# Set max speed for full bar: scaled for 2x sensitivity (full bar at 35 Mbps)
MAX_SPEED=35

# Read current RX/TX bytes from /proc/net/dev
STATS=$(awk -v iface="$INTERFACE:" '$1 == iface {print $2, $10}' /proc/net/dev)
read -r RX_BYTES TX_BYTES <<<"$STATS"

# Map percentage (0-100) to a vertical block character
# Characters fill from bottom to top: ▁ < ▂ < ▃ < ▄ < ▅ < ▆ < ▇ < █
vertical_meter() {
  local pct=$1
  if [ "$pct" -le 12 ]; then
    echo "▁"
  elif [ "$pct" -le 25 ]; then
    echo "▂"
  elif [ "$pct" -le 37 ]; then
    echo "▃"
  elif [ "$pct" -le 50 ]; then
    echo "▄"
  elif [ "$pct" -le 62 ]; then
    echo "▅"
  elif [ "$pct" -le 75 ]; then
    echo "▆"
  elif [ "$pct" -le 87 ]; then
    echo "▇"
  else
    echo "█"
  fi
}

# Calculate bar and tooltip
if [ -f "$STATE_FILE" ]; then
  read PREV_TIME PREV_RX PREV_TX <"$STATE_FILE"
  INTERVAL=$((CURRENT_TIME - PREV_TIME))
  [ "$INTERVAL" -le 0 ] && INTERVAL=1

  RX_DIFF=$((RX_BYTES - PREV_RX))
  TX_DIFF=$((TX_BYTES - PREV_TX))
  [ "$RX_DIFF" -lt 0 ] && RX_DIFF=0
  [ "$TX_DIFF" -lt 0 ] && TX_DIFF=0

  RX_SPEED=$((RX_DIFF / INTERVAL))
  TX_SPEED=$((TX_DIFF / INTERVAL))

  # Convert to Mbps (bytes/sec * 8 bits/byte / 1,000,000)
  RX_MBPS=$(awk -v s="$RX_SPEED" 'BEGIN {printf "%.1f", s * 8 / 1000000}')
  TX_MBPS=$(awk -v s="$TX_SPEED" 'BEGIN {printf "%.1f", s * 8 / 1000000}')

  # Calculate percentage of max interface speed
  RX_MBPS_INT=$(awk -v s="$RX_MBPS" 'BEGIN {printf "%.0f", s}')
  if [ "$MAX_SPEED" -gt 0 ]; then
    PCT=$((RX_MBPS_INT * 100 / MAX_SPEED))
    [ "$PCT" -gt 100 ] && PCT=100
  else
    PCT=0
  fi

  METER=$(vertical_meter $PCT)
  TEXT="<b>$ICON</b> $METER"
  TOOLTIP="Interface: $INTERFACE\n↓ $RX_MBPS Mbps      ↑ $TX_MBPS Mbps"
else
  # First run: no speed data yet
  TEXT="<b>$ICON</b> ▁"
  TOOLTIP="Interface: $INTERFACE"
fi

# Save current state for next run
echo "$CURRENT_TIME $RX_BYTES $TX_BYTES" >"$STATE_FILE"

# Output JSON for waybar
echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\", \"class\": \"connected\"}"
