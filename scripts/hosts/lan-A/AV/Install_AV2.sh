#!/bin/bash

cd /tmp
wget http://downloads.sourceforge.net/project/rkhunter/rkhunter/1.4.6/rkhunter-1.4.6.tar.gz
tar -xvf rkhunter-1.4.6.tar.gz
cd rkhunter-1.4.6
./installer.sh –install
rkhunter –update
rkhunter –propupd