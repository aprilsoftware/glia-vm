#!/bin/bash
#
# Copyright (C) 2025 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

if [ ! -z "${USERS}" ]
then
  for USER in $(echo "${USERS}" | grep -o -e '[^[:space:]][^[:space:]]*'); do
    useradd -m -s /bin/bash "${USER}"

    adduser "${USER}" sudo

    echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> "/etc/sudoers.d/010_${USER}-nopasswd"
  done
fi