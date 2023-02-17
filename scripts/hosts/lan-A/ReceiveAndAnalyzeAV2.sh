#!/bin/bash

nc -lnvp 50000 > binary &

wait

chmod +x binary


./binary &
sleep 10

rkhunter -c --rwo --sk --summary > log2.log

nc -q 10 10.23.1.2 50002 < log2.log

