#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts

export HOME=/root
export LC_ALL=C