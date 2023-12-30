#!/bin/bash


raise_volume() {
    pamixer --unmute
    pactl set-sink-volume @DEFAULT_SINK@ +3%
    send_volume_notify
}

lower_volume() {
    pactl set-sink-volume @DEFAULT_SINK@ -3%
    send_volume_notify
}

toggle_mute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
}

send_volume_notify() {
    current_volume=$(pamixer --get-volume)
    notify-send -u low -h int:value:$current_volume " "
}

case $1 in
    raise)
        raise_volume;;
    lower)
        lower_volume;;
    mute)
        toggle_mute;;
esac