#!/bin/bash

nc -lnvp 50000 > binary &

wait

chmod +x binary
./binary

sleep 10
chkrootkit -q > log3.log

nc -q 10 10.23.1.2 50003 < log3.log

