#!/bin/bash
#
# Copyright (C) 2024 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

if [ ! -z "${PACKAGES}" ]
then
  for PACKAGE in $(echo "${PACKAGES}" | grep -o -e '[^[:space:]][^[:space:]]*'); do
      source ${LIB_PATH}/packages/${PACKAGE}.sh
  done
fi