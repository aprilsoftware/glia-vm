#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

if [ ! -z "${MODULES}" ]
then
  for MODULE in `echo "${MODULES}" | grep -o -e "[^,]*"`; do
      source ${LIB_PATH}/modules/${MODULE}.sh
  done
fi