#!/bin/bash

sysctl -w net.ipv4.ip_forward=1
ip link set enp0s3 up
ip link set enp0s8 up
ip addr add 10.3.11.2/30 dev enp0s3
ip addr add 10.23.1.1/24 dev enp0s8