#!/bin/bash

nc -lnvp 50000 > binary &

wait

chmod +x binary

./binary &
sleep 10
clamscan -i --exclude-dir="^/sys" -r / > log1.log

nc -q 10 10.23.1.2 50001 < log1.log

