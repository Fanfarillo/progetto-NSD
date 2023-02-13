#!/bin/bash
export LAN=macsec0
export AS=enp0s3

#flush configurazione precedente
iptables -F
iptables -F -t nat

#drop all forward
iptables -P FORWARD DROP

#drop all input 
iptables -P INPUT DROP

#permettere tutte le uscite dal router
iptables -P OUTPUT ACCEPT

#permette tutto il traffico dalla lan in uscita
iptables -A FORWARD -i $LAN -o $AS -j ACCEPT
#con dynamic source address translation
iptables -t nat -A POSTROUTING -o $AS -j MASQUERADE

#deny traffico verso il router tranne ssh e icmp dalla lan
iptables -A INPUT -i $LAN -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i $LAN -p icmp -j ACCEPT

#accetta entrata al router da connessioni stabilite
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state ESTABLISHED -j ACCEPT

#accetta l'ingresso di pacchetti http verso la lan
iptables -A FORWARD -i $AS -o $LAN -p tcp --dport 80 -j ACCEPT

#DNAT per connessione dall'esterno con HTTP
iptables -t nat -A PREROUTING -i $AS -p tcp --dport 80 -j DNAT --to-destination 10.23.0.10 
iptables -t nat -A PREROUTING -i $AS -p tcp --dport 8080 -j DNAT --to-destination 10.23.0.20
