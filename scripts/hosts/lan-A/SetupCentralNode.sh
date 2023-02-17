#!/bin/bash

ip link set enp0s3 up
ip addr add 10.23.1.2/24 dev enp0s3

ip route add 10.23.0.0/24 via 10.23.1.1
ip route add 10.123.0.0/16 via 10.23.1.1

