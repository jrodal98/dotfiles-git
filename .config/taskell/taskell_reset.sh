#!/usr/bin/env bash
# www.jrodal.dev

sudo -u jake DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify -r 138376 -u critical -i "/home/jake/.local/share/icons/dunst_icons/task64.png" "Taskell Reset" "Resetting Taskell in 10 seconds..."
sleep 10
killall taskell
python /home/jake/.config/taskell/taskell_reset.py move /home/jake/todo.md Done Backlog --clear
sudo -u jake DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify -r 138376 -u normal -i "/home/jake/.local/share/icons/dunst_icons/task64.png" "Taskell Reset" "Reset Complete!"
