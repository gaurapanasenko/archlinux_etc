#!/bin/sh
 
IF=$1
STATUS=$2
 
if [ "$IF" == "wlp3s0" ]
then
    case "$2" in
        up)
        systemctl restart openvpn-client@elfiny4
        systemctl restart openvpn-client@elfiny5
        systemctl restart openvpn-client@elfiny6
        ;;
        down)
        systemctl stop openvpn-client@elfiny4
        systemctl stop openvpn-client@elfiny5
        systemctl stop openvpn-client@elfiny6
        ;;
    esac
fi