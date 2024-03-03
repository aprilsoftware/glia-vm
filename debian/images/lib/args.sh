#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
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
              [ -m ] --modules ]
              [ -h | --help ]"
    exit 2
}

SHORT=d:,h:,i:,g:,n:,a::,b::,m::,h
LONG=domain:,hostname:,ip:,gateway:,nameserver:,root-password::,glia-password::,modules::,help
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
    -m | --modules )
      MODULES="$2"
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
