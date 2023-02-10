#!/bin/bash

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.17.2