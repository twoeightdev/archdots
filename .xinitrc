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

ssh-agent qtile start
