#!/bin/bash

ip link set enp0s3 up
ip addr add 10.23.1.2/24 dev enp0s3

ip route add 10.23.0.0/24 via 10.23.1.1
ip route add 10.123.0.0/16 via 10.23.1.1

while true; do

nc -lnvp 50001 > /var/www/html/log_file/log1.log &
pid1=$!
nc -lnvp 50002 > /var/www/html/log_file/log2.log &
pid2=$!
nc -lnvp 50003 > /var/www/html/log_file/log3.log &
pid3=$!

wait pid1
wait pid2
wait pid3

echo "REPORT CLAMSCAN\n\n" > /var/www/html/log_file/report
cat /var/www/html/log_file/log1.log >> /var/www/html/log_file/report
echo "\n\nREPORT RKHUNTER\n\n" >> /var/www/html/log_file/report
cat /var/www/html/log_file/log2.log >> /var/www/html/log_file/report
echo "\n\nREPORT CHKROOTKIT\n\n" >> /var/www/html/log_file/report
cat /var/www/html/log_file/log3.log >> report 

done