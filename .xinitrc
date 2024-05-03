#!/bin/sh

remaps &
setbg &

autostart="picom dunst pipewire mpd"

for program in $autostart; do
    pidof -s "$program" || setsid -f "$program"
done >/dev/null 2>&1

dbus-update-activation-environment --all

ssh-agent qtile start
