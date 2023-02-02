#!/bin/bash
export MKA_CAK2=eeff00112233445566778899aabbccdd
export MKA_CKN2=eeff00112233445566778899aabbccddeeff00112233445566778899aabbccdd

nmcli connection add type macsec \
con-name macsec-13 \
ifname macsec1 \
connection.autoconnect no \
macsec.parent enp0s3 \
macsec.mode psk \
macsec.mka-cak $MKA_CAK2 \
macsec.mka-cak-flags 0 \
macsec.mka-ckn $MKA_CKN2 \
ipv4.addresses 10.23.0.10/24

nmcli connection up macsec-13