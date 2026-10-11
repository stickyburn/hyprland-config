#!/bin/bash

# GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

# system light/dark preference (New Delhi sunrise/sunset)
darkman run >/dev/null 2>&1 &

# xdg portal (manual start, no systemd)
/usr/lib/xdg-desktop-portal-wlr >/dev/null 2>&1 &
/usr/lib/xdg-desktop-portal-gtk >/dev/null 2>&1 &

# audio
pipewire >/dev/null 2>&1 &
pipewire-pulse >/dev/null 2>&1 &
wireplumber >/dev/null 2>&1 &

# notification daemon
swaync >/dev/null 2>&1 &

# wallpaper
swaybg -i ~/Pictures/wallpapers/japanese_hypercar.png -m fill >/dev/null 2>&1 &

# top bar
waybar &

# bluetooth
blueman-applet >/dev/null 2>&1 &

# network
nm-applet >/dev/null 2>&1 &

# permission authentication (polkit agent)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 &
