#!/usr/bin/env bash
# www.jrodal.dev

flameshot &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
redshift -l 38.0288319:-78.4896762 -t 5000:3000 &
mailspring -b &
signal-desktop --start-in-tray --use-tray-icon &
feh --bg-scale /home/jake/Pictures/wallpapers/blue-night-sky-wallpaper.jpg &
unclutter &
fix_xcursor &
compton -b &
xrdb ~/.Xresources &
