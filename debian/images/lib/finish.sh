truncate -s 0 /etc/machine-id

apt-get autoclean

rm -rf /tmp/* ~/.bash_history

umount /proc

umount /sys

umount /dev/pts

export HISTSIZE=0