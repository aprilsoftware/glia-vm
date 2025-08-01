#!/bin/bash
#
# Copyright (C) 2024 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

KUBERNETES_VERSION=v1.31
PROJECT_PATH=stable:/v1.31

source ${LIB_PATH}/packages/kubernetes/install.sh

apt -y install socat
