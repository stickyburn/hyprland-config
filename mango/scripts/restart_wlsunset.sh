#!/bin/bash
set -euo pipefail

# Remember only temperature. Night light is enabled manually, never at login.
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/swaync"
mkdir -p "$state_dir"
exec 9>"${XDG_RUNTIME_DIR:?}/swaync-nightlight.lock"
flock 9

temperature=3500
if [[ -r "$state_dir/nightlight-kelvin" ]] && read -r saved < "$state_dir/nightlight-kelvin" &&
    [[ "$saved" =~ ^[0-9]{4}$ ]] && (( 10#$saved >= 2000 && 10#$saved <= 6500 )); then
    temperature=$((10#$saved))
fi

running() { pgrep -u "$UID" -x wlsunset >/dev/null; }
stop() {
    pkill -u "$UID" -x wlsunset || true
    # Wait for the old process to release display gamma control before restarting.
    timeout 2s pidwait -u "$UID" -x wlsunset || [[ $? == 1 ]]
}
start() {
    # The high temperature must exceed the low one; 1 K is visually negligible.
    wlsunset -T "$((temperature + 1))" -t "$temperature" 9>&- </dev/null >/dev/null 2>&1 &
}

case "${1:-toggle}" in
    status)
        running && echo true || echo false
        ;;
    get)
        echo "$temperature"
        ;;
    set)
        if [[ ! "${2:-}" =~ ^[0-9]{4}$ ]] || (( 10#$2 < 2000 || 10#$2 > 6500 )); then
            echo 'Temperature must be between 2000 and 6500 K.' >&2
            exit 2
        fi
        temperature=$((10#$2))
        printf '%s\n' "$temperature" > "$state_dir/nightlight-kelvin"
        running || exit 0
        stop
        start
        ;;
    toggle)
        case "${SWAYNC_TOGGLE_STATE:-}" in
            true) running || start ;;
            false) stop ;;
            *) echo 'Set SWAYNC_TOGGLE_STATE to true or false.' >&2; exit 2 ;;
        esac
        ;;
    *)
        echo "Usage: $0 {status|get|set K|toggle}" >&2
        exit 2
        ;;
esac
