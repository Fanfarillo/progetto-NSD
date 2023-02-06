#!/bin/bash

sysctl -w net.ipv4.ip_forward=1
ip link set eth0 up
ip link set eth1 up
ip addr add 100.3.11.2/30 dev eth0
ip addr add 10.23.1.1/24 dev eth1

ip route add default via 100.3.11.1

#abilitare il forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward