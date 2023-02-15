#!/bin/bash

nc -q 10 10.123.0.10 3000 < binary &
nc -q 10 10.123.0.20 3000 < binary &
nc -q 10 10.123.0.30 3000 < binary &

mkdir log_files
cd log_files

nc -lnvp 4000 > log1.log &
nc -lnvp 4001 > log2.log &
nc -lnvp 4002 > log3.log &
