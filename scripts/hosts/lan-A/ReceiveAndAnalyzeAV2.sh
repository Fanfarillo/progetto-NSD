#!/bin/bash

nc -lnvp 3000 > binary &

wait

chmod +x binary


./binary &
rm -f log2.log
sleep 10

rkhunter -c --rwo --sk --summary > log2.log

nc -q 10 10.23.1.2 4001 < log2.log

