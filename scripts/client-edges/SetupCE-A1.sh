#!/bin/bash

sysctl -w net.ipv4.ip_forward=1
ip link set enp0s3 up
ip link set enp0s8 up
ip addr add 100.1.12.2/30 dev enp0s3
ip addr add 10.23.0.1/24 dev enp0s8

ip route add default via 100.1.12.1