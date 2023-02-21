#!/bin/bash

sysctl -w net.ipv4.ip_forward=1
ip link set enp0s3 up
ip addr add 100.1.12.2/30 dev enp0s3

ip route add default via 100.1.12.1

#abilitare il forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward