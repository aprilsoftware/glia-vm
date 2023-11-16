#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#
set -e

LIB_PATH=$(dirname -- $0)/lib

source ${LIB_PATH}/args.sh

source ${LIB_PATH}/init.sh

cat <<EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
EOF

source ${LIB_PATH}/base.sh

apt-get install linux-image-amd64 firmware-linux -y

source ${LIB_PATH}/fstab.sh
source ${LIB_PATH}/grub.sh

source ${LIB_PATH}/hostname.sh

source ${LIB_PATH}/network/loopback.sh
source ${LIB_PATH}/network/static-ip.sh
source ${LIB_PATH}/network/resolv.sh

source ${LIB_PATH}/finish.sh
