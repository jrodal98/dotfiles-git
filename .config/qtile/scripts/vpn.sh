#!/usr/bin/env bash
# www.jrodal.dev

# NOTE: user must have sudo access for surfshark-vpn and ufw

function on() {
    printf "1\n" | surfshark-vpn attack
    yes | ufw reset
    ufw default deny incoming
    ufw default deny outgoing
    ufw allow in on tun0 from any to any
    ufw allow out on tun0 from any to any
    # not completely safe, but I can't for the
    # life of me get a damn static ip address
    # of the server...
    ufw allow out to any proto udp port 1194
    ufw allow out to any proto udp port 53
    ufw enable
}

function off() {
    surfshark-vpn down
    ufw disable
}

function is_active() {
    NUM_LINES=$(surfshark-vpn status | wc -l)
    if [ $NUM_LINES -eq 1 ]; then
        echo 0
    else
        echo 1
    fi
}

function print_addr() {
    IS_ACTIVE=$(is_active)
    IP_ADDR=$(curl -s ifconfig.me)
    if [ $IS_ACTIVE -eq 1 ]; then
        echo "  $IP_ADDR"
    else
        echo "  $IP_ADDR"
    fi
}

function wrong_usage() {
    echo "ERR: Usage is as follows: sudo vpn <toggle|print-addr>"
}

case $1 in
    toggle)
        notify-send "Surfshark VPN" "Toggling VPN..."
        IS_ACTIVE=$(is_active)
        IP_ADDR=$(curl -s ifconfig.me)
        if [ $IS_ACTIVE -eq 1 ]; then
            sudo bash -c "$(declare -f off); off"
            notify-send "Surfshark VPN" "VPN is off"
        else
            sudo bash -c "$(declare -f on); on"
            notify-send "Surfshark VPN" "VPN is on"
        fi
        ;;
    print-addr)
        print_addr
        ;;
    *)
        wrong_usage
        ;;
esac
