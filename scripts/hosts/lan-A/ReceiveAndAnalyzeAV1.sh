#!/bin/bash

nc -lnvp 3000 > binary &

wait

chmod +x binary

./binary &
rm -f log1.log
sleep 10
clamscan -i --exclude-dir="^/sys" -r / > log1.log

