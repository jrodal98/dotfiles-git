#!/bin/sh

connection_status() {
    connection=$(sudo wg show "$interface" 2>/dev/null | head -n 1 | awk '{print $NF }')

    if [ "$connection" = "$interface" ]; then
        echo "1"
    else
        echo "2"
    fi
}

interface="wg0"

case "$1" in
--toggle)
    if [ "$(connection_status)" = "1" ]; then
        sudo wg-quick down "$interface" 2>/dev/null
    else
        sudo wg-quick up "$interface" 2>/dev/null
    fi
    ;;
*)
    if [ "$(connection_status)" = "1" ]; then
        echo " VPN"
    else
        echo " VPN"
    fi
    ;;
esac
