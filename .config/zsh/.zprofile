export XINITRC="$XDG_CONFIG_HOME/xorg/xinitrc"
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

# Last Modified: Sat, 11 Jan 2025 06:07:54 PM
