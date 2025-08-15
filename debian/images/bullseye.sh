#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#
set -e

OS_RELEASE=bullseye

LIB_PATH=$(dirname -- $0)/lib

source ${LIB_PATH}/args.sh

source ${LIB_PATH}/init.sh

cat <<EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian/ bullseye main
deb-src http://deb.debian.org/debian/ bullseye main

deb http://security.debian.org/debian-security bullseye-security main
deb-src http://security.debian.org/debian-security bullseye-security main

deb http://deb.debian.org/debian/ bullseye-updates main
deb-src http://deb.debian.org/debian/ bullseye-updates main
EOF

source ${LIB_PATH}/base.sh

apt install linux-image-amd64  sudo -y

source ${LIB_PATH}/fstab.sh
source ${LIB_PATH}/grub.sh

source ${LIB_PATH}/hostname.sh

source ${LIB_PATH}/network/loopback.sh
source ${LIB_PATH}/network/static-ip.sh
source ${LIB_PATH}/network/resolv.sh

source ${LIB_PATH}/packages.sh

source ${LIB_PATH}/users.sh

source ${LIB_PATH}/finish.sh
