#!/bin/bash

ip link set eth0 up
ip addr add 10.23.1.2/24 dev eth0

ip route add default via 10.23.1.1