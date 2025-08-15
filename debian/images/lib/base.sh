#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

export DEBIAN_FRONTEND=noninteractive

apt update

apt upgrade -y

apt install openssh-server -y

apt install python3 -y

apt install sudo -y

if [ "$OS_RELEASE" = "trixie" ]; then
    apt-get install -y ntpsec
else
    apt-get install -y ntp
fi

apt install locales -y

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

echo "glia ALL=(ALL) NOPASSWD: ALL"  >> /etc/sudoers.d/010_glia-nopasswd
