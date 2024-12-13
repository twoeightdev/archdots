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

# Last Modified: Sat, 14 Dec 2024 05:16:50 AM
