#!/bin/sh

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

xinput set-prop "PNP0C50:0b 093A:0255 Touchpad" "libinput Tapping Enabled" 1

xwallpaper --stretch /usr/share/backgrounds/archlinux/sunset.jpg

startdwm-env init

printf '[START STARTDWM]\n' >> ~/.dwm.log
exec startdwm >/dev/null 2>&1
