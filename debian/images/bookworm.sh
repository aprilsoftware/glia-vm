#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#
set -e

OS_RELEASE=bookworm

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

apt install linux-image-amd64 firmware-linux -y

source ${LIB_PATH}/fstab.sh
source ${LIB_PATH}/grub.sh

source ${LIB_PATH}/hostname.sh

source ${LIB_PATH}/network/loopback.sh
source ${LIB_PATH}/network/static-ip.sh
source ${LIB_PATH}/network/resolv.sh

source ${LIB_PATH}/packages.sh

source ${LIB_PATH}/users.sh

source ${LIB_PATH}/finish.sh
