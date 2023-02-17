#!/bin/bash

echo "file non ancora pronto, aggiornare più tardi" > log_file/report
rm -rf log1.log
rm -rf log2.log
rm -rf log3.log
nc -lnvp 50001 > /var/www/html/log_file/log1.log &
pid1=$!
nc -lnvp 50002 > /var/www/html/log_file/log2.log &
pid2=$!
nc -lnvp 50003 > /var/www/html/log_file/log3.log &
pid3=$!

nc -q 10 10.123.0.10 50000 < uploads/binary &
nc -q 10 10.123.0.20 50000 < uploads/binary &
nc -q 10 10.123.0.30 50000 < uploads/binary &

wait $pid1
wait $pid2
wait $pid3

echo "REPORT CLAMSCAN" > /var/www/html/log_file/report
echo "" >> /var/www/html/log_file/report
cat /var/www/html/log_file/log1.log >> /var/www/html/log_file/report
echo "" >> /var/www/html/log_file/report
echo "REPORT RKHUNTER" >> /var/www/html/log_file/report
echo "" >> /var/www/html/log_file/report
cat /var/www/html/log_file/log2.log >> /var/www/html/log_file/report
echo "" >> /var/www/html/log_file/report
echo "REPORT CHKROOTKIT" >> /var/www/html/log_file/report
echo "Care: LKM Rootkit signeled by this antivirus is a well known possible false positive!" >> /var/www/html/log_file/report
echo "" >> /var/www/html/log_file/report
cat /var/www/html/log_file/log3.log >> /var/www/html/log_file/report
