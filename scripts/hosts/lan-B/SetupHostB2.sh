#!/bin/bash
ip link set eth0 up
ip addr add 192.168.16.2/24 dev eth0
ip route add default via 192.168.16.1