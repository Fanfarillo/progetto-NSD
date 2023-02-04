#!/bin/bash

sysctl -w net.ipv4.ip_forward=1
ip link set eth0 up
ip link set eth1 up
ip addr add 100.2.13.2/30 dev eth0
ip addr add 10.123.0.1/16 dev eth1

ip route add default via 100.2.13.1