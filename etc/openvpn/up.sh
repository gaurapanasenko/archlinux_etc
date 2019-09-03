#!/bin/sh

/etc/openvpn/down.sh "$@"

TABLE=7`echo $1 | sed 's/[^0-9]*//g'`
MARK=0xff75

ip rule add from all fwmark $MARK table $TABLE
ip route add default dev $1 table $TABLE
#ip route flush cache
#iptables -A OUTPUT -t mangle -p tcp -m multiport --dports 80,443 -m geoip --dst-cc RU -j MARK --set-mark $MARK
#iptables -A POSTROUTING -t nat -o $1 -j MASQUERADE
#iptables -A FORWARD -o $1 -j ACCEPT
exit 0
