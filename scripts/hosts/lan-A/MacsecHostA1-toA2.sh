#!/bin/bash

export MKA_CAK1=00112233445566778899aabbccddeeff
export MKA_CKN1=00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff

nmcli connection add type macsec \
con-name macsec-12 \
ifname macsec0 \
connection.autoconnect no \
macsec.parent enp0s3 \
macsec.mode psk \
macsec.mka-cak $MKA_CAK1 \
macsec.mka-cak-flags 0 \
macsec.mka-ckn $MKA_CKN1 \
ipv4.addresses 10.23.0.10/24

nmcli connection up macsec-12
