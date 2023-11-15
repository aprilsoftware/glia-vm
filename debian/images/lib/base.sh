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
