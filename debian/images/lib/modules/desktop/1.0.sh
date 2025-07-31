#!/bin/bash
#
# Copyright (C) 2025 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

DEBIAN_FRONTEND=noninteractive apt -y install gnome-core

apt -y install xrdp

adduser xrdp ssl-cert

apt -y install policykit-1

cat <<EOF > /etc/polkit-1/localauthority/50-local.d/color.pkla
[Allow colord for all users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF

sed -i 's/^max_bpp=24/max_bpp=16/' /etc/xrdp/xrdp.ini
sed -i 's/^xserverbpp=24/xserverbpp=16/' /etc/xrdp/xrdp.ini
