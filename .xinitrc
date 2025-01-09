#!/bin/sh

xset s off -dpms &
remaps &
setbg &
# /usr/bin/emacs --daemon &
# emacs --daemon &

autostart="picom dunst unclutter mpd"

for program in $autostart; do
    pidof -s "$program" || setsid -f "$program"
done >/dev/null 2>&1

dbus-update-activation-environment --all

dbus-launch ssh-agent qtile start

# Last Modified: Mon, 06 Jan 2025 12:40:18 AM
