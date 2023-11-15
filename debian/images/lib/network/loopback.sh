cat <<EOF > /etc/network/interfaces.d/lo
auto lo
iface lo inet loopback
EOF