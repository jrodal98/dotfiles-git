#!/usr/bin/env bash
# www.jrodal.dev

sudo -u jrodal DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -t 10000 -i "/home/jrodal/.local/share/icons/dunst_icons/task64.png" "Taskell Reset" "Resetting Taskell in 10 seconds..."
sleep 10
killall taskell 2> /dev/null
python /home/jrodal/.config/taskell/taskell_reset.py move /home/jrodal/todo.md Done Backlog --clear
sudo -u jrodal DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -i "/home/jrodal/.local/share/icons/dunst_icons/task64.png" "Taskell Reset" "Reset Complete!"
