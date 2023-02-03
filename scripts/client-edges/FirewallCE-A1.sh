export LAN=enp0s8
export AS=enp0s3


#abilitare il forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

#flush configurazione precedente
iptables -F
#drop all forward
iptables -P FORWARD DROP
#drop all input 
iptables -P INPUT DROP
#permettere tutte le uscite dal router
iptables -P OUTPUT ACCEPT

#permette tutto il traffico dalla lan in uscita
iptables -A FORWARD -i $LAN -o $AS -j ACCEPT
#con dynamic source address translation
iptables -t nat -A POSTROUTING -i $LAN -o $AS -j MASQUERADE

#deny traffico verso il router tranne ssh e icmp dalla lan
iptables -A INPUT -i $LAN -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i $LAN -p icmp -j ACCEPT

#accetta entrata al router da connessioni stabilite
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT

#accetta entrata verso la lan se http con dnat
iptables -A FORWARD -i $AS -o $LAN -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -i $AS -o $LAN -j DNAT --to-destination 10.23.0.10 
iptables -t nat -A PREROUTING -i $AS -o $LAN -j DNAT --to-destination 10.23.0.20
