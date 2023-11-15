#!/bin/bash
# This program is free software: you can redistribute it and/or modify it under the terms
# of the GNU General Public License as published by the Free Software Foundation, 
# either version 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program. 
# If not, see <https://www.gnu.org/licenses/>.

help()
{
    echo "Usage: chroot.sh [ -d | --domain ]
              [ -h | --hostname ]
              [ -i | --ip ]
              [ -g | --gateway ]
			        [ -l | --nameserver ]
              [ -a | --root-password ]
              [ -b | --glia-password ]"
    exit 2
}

SHORT=d:,h:,i:,g:,n:,a::,b::,h
LONG=domain:,hostname:,ip:,gateway:,nameserver:,root-password::,glia-password::,help
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
