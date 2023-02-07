#!/bin/bash

apt-get update
apt-get install clamav clamav-daemon -y
freshclam
