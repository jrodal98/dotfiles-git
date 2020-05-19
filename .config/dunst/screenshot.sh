#!/usr/bin/env bash
# www.jrodal.dev

function play_sound() {
    paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

function rename() {
    FILE=$(zenity --file-selection --file-filter=*.png --confirm-overwrite --title="Save screenshot as..." --save --filename="$1")
    case $? in
        0 )
            mv $1 $FILE
            ;;
    esac
}
function saveas() {
    FILE=$(zenity --file-selection --file-filter=*.png --confirm-overwrite --title="Save screenshot as..." --save --filename="/home/jake/Pictures/screenshots/")
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
            dunstify -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot has been deleted"
    fi
}

function ocr() {
    xclip -o -selection clipboard -t image/png | tesseract stdin stdout | xclip -sel clip
    dunstify -i $HOME/.local/share/icons/dunst_icons/icons8-general-ocr-48.png "Text copied to clipboard"

}


FILENAME="${3##* }" # gets the last word in the notification body, which is either the file path or clipboard
case $FILENAME in
    clipboard)
        ACTION=$(play_sound & dunstify -A "saveasAction,save as" -A "ocrAction,ocr" -i $HOME/.local/share/icons/dunst_icons/icons8-camera-100.png "Screenshot" "$3")
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
    "ocrAction")
        ocr $FILENAME
        ;;

esac
