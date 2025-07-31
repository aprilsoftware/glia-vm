#!/bin/bash
#
# Copyright (C) 2025 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

KUBERNETES_VERSION=v1.32
PROJECT_PATH=stable:/v1.32

source ${LIB_PATH}/modules/kubernetes/install.sh

apt-get -y install socat
