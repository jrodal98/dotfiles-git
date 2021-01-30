#!/usr/bin/env bash
# www.jrodal.dev

flameshot &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
redshift -l 38.0288319:-78.4896762 -t 5000:3000 &
thunderbird-beta &
signal-desktop --start-in-tray --use-tray-icon &
feh --bg-scale /home/jrodal/Pictures/wallpapers/arch_windows_cursed.png &
unclutter &
fix_xcursor &
picom -b &
xrdb ~/.Xresources &
kdeconnect-indicator &
clipit &
