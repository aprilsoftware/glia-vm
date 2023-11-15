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

apt-get update

apt-get upgrade -y

apt-get install openssh-server -y

apt-get install sudo -y

apt-get install locales -y

sed '/en_GB.UTF-8 UTF-8/s/^# //' -i /etc/locale.gen

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

sed -i d /etc/motd

cat <<EOF > /usr/bin/l
#!/bin/bash
ls -l $@
EOF

if [ ! -z "${ROOT_PASSWORD}" ]
then
    echo "root:${ROOT_PASSWORD}" | chpasswd
fi

chmod 755 /usr/bin/l

mkdir -p /usr/local/glia

useradd -d /usr/local/glia -s /bin/bash glia

chown -R glia:glia /usr/local/glia

adduser glia sudo

if [ -z "${GLIA_PASSWORD}" ]
then
    echo "glia:glia" | chpasswd
else
    echo "glia:${GLIA_PASSWORD}" | chpasswd
fi
