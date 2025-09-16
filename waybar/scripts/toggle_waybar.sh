#!/bin/bash

# Simple waybar toggle script

if [ "$1" = "status" ]; then
    # Check if waybar is running and print status
    if pgrep -x "waybar" > /dev/null; then
        echo "running"
    else
        echo "stopped"
    fi
else
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
fi