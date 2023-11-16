#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#
cat <<EOF > /etc/resolv.conf
domain ${VM_DOMAIN}
nameserver ${VM_NAMESERVER}
EOF