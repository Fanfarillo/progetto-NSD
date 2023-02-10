#!/bin/bash

ip link set enp0s3 up
ip addr add 10.23.1.2/24 dev enp0s3

ip route add default via 10.23.1.1