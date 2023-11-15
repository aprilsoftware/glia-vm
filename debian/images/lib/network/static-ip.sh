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

cat <<EOF > /etc/network/interfaces.d/enp1s0
auto enp1s0
iface enp1s0 inet static
	address ${VM_IP}
	netmask 255.255.255.0
	gateway ${VM_GATEWAY}
EOF

echo "${VM_IP}    ${VM_HOSTNAME}.${VM_DOMAIN} ${VM_HOSTNAME}" >> /etc/hosts