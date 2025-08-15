#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#
help()
{
    echo "Usage: chroot.sh [ -d | --domain ]
              [ -h | --hostname ]
              [ -i | --ip ]
              [ -g | --gateway ]
              [ -l | --nameserver ]
              [ -a | --root-password ]
              [ -b | --glia-password ]
              [ -p ] --packages ]
              [ -u ] --users ]
              [ -h | --help ]"
    exit 2
}

SHORT=d:,h:,i:,g:,n:,a::,b::,p::,u::,h
LONG=domain:,hostname:,ip:,gateway:,nameserver:,root-password::,glia-password::,packages::,users::,help
OPTS=$(getopt --alternative --name chroot.sh --options $SHORT --longoptions $LONG -- "$@") 

if [ $# -eq 0 ]; then
  help
fi

eval set -- "$OPTS"

while :
do
  case "$1" in
    -d | --domain )
      VM_DOMAIN="$2"
      shift 2
      ;;
    -h | --hostname )
      VM_HOSTNAME="$2"
      shift 2
      ;;
    -i | --ip )
      VM_IP="$2"
      shift 2
      ;;
    -g | --gateway )
      VM_GATEWAY="$2"
      shift 2
      ;;
    -l | --nameserver )
      VM_NAMESERVER="$2"
      shift 2
      ;;
    -a | --root-password )
      ROOT_PASSWORD="$2"
      shift 2
      ;;
    -b | --glia-password )
      GLIA_PASSWORD="$2"
      shift 2
      ;;
    -m | --packages )
      PACKAGES="$2"
      shift 2
      ;;
    -u | --users )
      USERS="$2"
      shift 2
      ;;
    -h | --help)
      help
      ;;
    --)
      shift;
      break
      ;;
    *)
      echo "Unexpected option: $1"
      help
      ;;
  esac
done
