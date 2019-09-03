#!/bin/sh

/etc/openvpn/update-resolv-conf "$@"

TABLE=7`echo $1 | sed 's/[^0-9]*//g'`
MARK=0xff$TABLE

ip rule del table $TABLE
ip route flush table $TABLE
#ip route flush cache
#iptables -D OUTPUT -t mangle -p tcp -m multiport --dports 80,443 -m geoip --dst-cc RU -j MARK --set-mark $MARK
#iptables -D POSTROUTING -t nat -o $1 -j MASQUERADE
#iptables -D FORWARD -o $1 -j ACCEPT
exit 0
