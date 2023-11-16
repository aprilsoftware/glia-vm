#!/bin/bash
# This program is free software: you can redistribute it and/or modify it under the terms
# of the GNU General Public License as published by the Free Software Foundation, 
# either version 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program. 
# If not, see <https://www.gnu.org/licenses/>.

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
