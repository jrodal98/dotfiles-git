#!/usr/bin/env zsh
source ~/.zshrc
case $1 in
    spt)
        if  [ "_$(xdotool search --classname "dropdown_spt" | head -1)"  = "_" ]; then
            $TERMINAL --class dropdown_spt -e spt &
            sleep .1
            i3-msg "[instance="dropdown_spt"] move position center"
        else
            i3-msg "[instance="dropdown_spt"] scratchpad show; [instance="dropdown_spt"] move position center"
        fi
        ;;
    terminal)
        if  [ "_$(xdotool search --classname "dropdown_term" | head -1)"  = "_" ]; then
            $TERMINAL --class dropdown_term &
            sleep .1
            i3-msg "[instance="dropdown_term"] move position center"
        else
            i3-msg "[instance="dropdown_term"] scratchpad show; [instance="dropdown_term"] move position center"
        fi
        ;;
    notepad)
        if  [ "_$(xdotool search --classname "dropdown_notepad" | head -1)"  = "_" ]; then
            $TERMINAL --class dropdown_notepad -e ~/.config/i3/run-notepad &
            sleep .1
            i3-msg "[instance="dropdown_notepad"] move position center"
        else
            i3-msg "[instance="dropdown_notepad"] scratchpad show; [instance="dropdown_notepad"] move position center"
        fi
        ;;
    *)
        notify-send -i $HOME/.local/share/icons/dunst_icons/icons8-high-importance-48.png "Error" "Invalid option passed to toggle-dropdowns script."
        ;;
esac




