#!/bin/bash

#flush configurazione 
iptables -F

#butta tutto, router impenetrabile
iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP

#permette comunicazione tra site2 e central node, e viceversa
iptables -A FORWARD -s 10.23.1.2 -d 10.123.0.0/16 -j ACCEPT
iptables -A FORWARD -s 10.123.0.0/16 -d 10.23.1.2 -j ACCEPT

#permette comunicazione tra gli spoke
iptables -A FORWARD -s 10.23.1.0/24 -d 10.23.0.0/24 -j ACCEPT
iptables -A FORWARD -s 10.23.0.0/24 -d 10.23.1.0/24 -j ACCEPT

#natting
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.123.0.10
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.123.0.20
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.123.0.30
