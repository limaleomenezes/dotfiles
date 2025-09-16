#!/bin/sh

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

# xwallpaper --stretch /usr/share/backgrounds/archlinux/sunset.jpg

startdwm-env >/dev/null 2>&1

exec startdwm >/dev/null 2>&1
