#!/bin/bash
set -euo pipefail

case "${1:-}" in
    window)
        # Waybar supplies the output name to each module's process.
        mmsg watch monitor "${WAYBAR_OUTPUT_NAME:?Waybar output name is required}" |
            jq --unbuffered -c '
                .active_client // {} |
                (.appid // "") as $app |
                {text: ({kitty: "Kitty", "vivaldi-stable": "Vivaldi", codium: "Code"}[$app] // $app),
                 tooltip: (.title // "")}
            '
        ;;
    sleep)
        mmsg get all-monitors | jq -r '.monitors[].name' |
            while IFS= read -r output; do
                mmsg dispatch "sleep_monitor,$output"
            done
        ;;
    *)
        echo "Usage: $0 {window|sleep}" >&2
        exit 2
        ;;
esac
