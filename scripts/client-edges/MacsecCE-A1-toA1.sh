#!/bin/bash

export MKA_CAK1=44556677889911223344556600112233
export MKA_CKN1=4455667788991122334455660011223344556677889911223344556600112233

nmcli connection add type macsec \
con-name macsec-13 \
ifname macsec0 \
connection.autoconnect no \
macsec.parent enp0s3 \
macsec.mode psk \
macsec.mka-cak $MKA_CAK1 \
macsec.mka-cak-flags 0 \
macsec.mka-ckn $MKA_CKN1 \
ipv4.addresses 10.23.0.1/24

nmcli connection up macsec-13