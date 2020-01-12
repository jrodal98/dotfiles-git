#!/usr/bin/env bash

# TODO: Implement rename; don't overwrite existing files in the saveas and rename #

function play_sound() {
    if ! $HOME/.config/scripts/do-not-disturb/dnd.sh state; then
        paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
    fi
}

function rename() {
    if zenity --entry \
        --title="Add new profile" \
        --text="Enter name of new profile:" \
        --entry-text "NewProfile"
        then
            FILENAME="$?"
            echo $FILENAME
        else echo "No name entered"
    fi
}
function saveas() {
    FILE=$(zenity --file-selection --title="Save screenshot as..." --save --filename="/home/jake/Pictures/screenshots/")
    case $? in
        0 )
            xclip -o -selection clipboard -t image/png > $FILE
            ;;
    esac
}
function delete() {
    if zenity --question \
        --text="Are you sure you want to delete the screenshot?"
        then
            rm $1
            dunstify -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot" "$1 has been deleted"
    fi
}


FILENAME="${3##* }" # gets the last word in the notification body, which is either the file path or clipboard
case $FILENAME in
    clipboard)
        ACTION=$(play_sound & dunstify -A "saveasAction,save as" -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot" "$3")
        ;;
    *)
        ACTION=$(play_sound & dunstify -A "renameAction,rename" -A "deleteAction,delete" -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot" "$3")
        ;;
esac

case "$ACTION" in
    "renameAction")
        rename $FILENAME
        ;;
    "saveasAction")
        saveas $FILENAME
        ;;
    "deleteAction")
        delete $FILENAME
        ;;
esac
