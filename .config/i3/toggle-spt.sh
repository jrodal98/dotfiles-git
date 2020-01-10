#!/usr/bin/env bash
if  [ "_$(xdotool search --classname "dropdown_spt" | head -1)"  = "_" ]; then
    st -n dropdown_spt -e spt &
    sleep .1
    i3-msg "[instance="dropdown_spt"] move position center"
else
    i3-msg "[instance="dropdown_spt"] scratchpad show; [instance="dropdown_spt"] move position center"
fi
