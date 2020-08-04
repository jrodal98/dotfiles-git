#!/usr/bin/env bash
# www.jrodal.dev

case $(echo -e "l\ns\nr\nS" | dmenu -p "(l)ock, (s)uspend, (r)eboot, (Shift+s)hutdown") in
    l)
        i3exit lock
        ;;
    s)
        i3exit suspend
        ;;
    S)
        i3exit shutdown
        ;;
    r)
        i3exit reboot
        ;;
esac
