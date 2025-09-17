#!/bin/bash

# Toggle waybar visibility
if pgrep -x "waybar" > /dev/null; then
    # Kill all waybar instances
    pkill -x "waybar"
    echo "Waybar hidden"
else
    # Start waybar
    waybar
    echo "Waybar shown"
fi