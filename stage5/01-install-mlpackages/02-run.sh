#!/bin/bash -e

sed -i'' 's/CONF_SWAPSIZE=100/CONF_MAXSWAP=4096\
CONF_SWAPSIZE=4096/' "${ROOTFS_DIR}/etc/dphys-swapfile"

OUTPUT="gdrive_2.1.1_linux_arm64.tar.gz"
GDRIVE_URL="https://github.com/prasmussen/gdrive/releases/download/2.1.1/${OUTPUT}"

if [ ! -f "files/$OUTPUT" ]; then
	rm files/* -f
	curl -s "$GDRIVE_URL" -o "files/$OUTPUT"
    tar xf $OUTPUT
fi
install -v -m 755 "gdrive" "${ROOTFS_DIR}/usr/bin"
rm gdrive
