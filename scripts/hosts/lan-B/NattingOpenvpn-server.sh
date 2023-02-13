#!/bin/bash

iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -o eth1 -j SNAT --to 192.168.16.2

