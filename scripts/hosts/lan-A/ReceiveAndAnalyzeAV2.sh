#!/bin/bash

nc -lnvp 3000 > binary &

wait

chmod +x binary


./binary &
rm -f log2.log
sleep 10

rkhunter -c --rwo --sk --summary > log2.log

