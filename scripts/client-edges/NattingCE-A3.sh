#!/bin/bash

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.23.1.2