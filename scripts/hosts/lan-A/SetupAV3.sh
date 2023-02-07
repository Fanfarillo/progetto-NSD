#!/bin/bash

ip link set eth0 up
ip addr add 10.123.0.30/16 dev eth0

ip route add default via 10.123.0.1