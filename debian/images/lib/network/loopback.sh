#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#
cat <<EOF > /etc/network/interfaces.d/lo
auto lo
iface lo inet loopback
EOF