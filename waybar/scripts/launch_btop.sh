#!/bin/bash

# Check if btop is already running
if pgrep -x "btop" > /dev/null; then
    # btop is running, do nothing or bring to front if desired
    exit 0
else
    # btop is not running, launch it in wezterm
    if command -v wezterm >/dev/null 2>&1; then
        wezterm start -- btop
    else
        # Fallback to just running btop directly
        btop
    fi
fi