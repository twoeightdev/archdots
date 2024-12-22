#!/bin/sh

xset s off -dpms &
remaps &
setbg &
# /usr/bin/emacs --daemon &
# emacs --daemon &

autostart="picom dunst pipewire unclutter mpd"

for program in $autostart; do
    pidof -s "$program" || setsid -f "$program"
done >/dev/null 2>&1

dbus-update-activation-environment --all

dbus-launch ssh-agent qtile start

# Last Modified: Mon, 23 Dec 2024 04:25:25 AM
