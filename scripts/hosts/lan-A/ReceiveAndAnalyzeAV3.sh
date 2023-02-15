#!/bin/bash

nc -lnvp 3000 > binary &

wait

chmod +x binary
./binary

rm -f log3.log
sleep 10
chkrootkit -q > log3.log

nc -q 10 10.23.1.2 4002 < log3.log

