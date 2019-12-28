#!/usr/bin/env bash
# Jacob Rodal (www.jrodal.dev)

# Handles multiple different screenshot modes and sends notifications

case $1 in

    1)
        if maim -u $HOME/Pictures/screenshots/img_$(date +%s).png
        then
            notify-send -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot" "Saved in $HOME/Pictures/screenshots"
        fi
        ;;
    2)
        tmp_file="$HOME/.config/i3/.tmp_scrot"
        maim -su > $tmp_file
        if [ -s $tmp_file ]
        then
            cat $tmp_file | xclip -selection clipboard -t image/png
            notify-send -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot" "Copied to clipboard"
        fi
        rm $tmp_file
        ;;
    3)
        if maim -su $HOME/Pictures/screenshots/img_$(date +%s).png
        then
            notify-send -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot" "Saved in $HOME/Pictures/screenshots"
        fi
        ;;
    *)
        notify-send -i $HOME/.local/share/icons/dunst_icons/icons8-high-importance-48.png "Error" "Invalid option passed to screenshot script"
        ;;
esac
