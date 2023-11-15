cat <<EOF > /etc/resolv.conf
domain ${VM_DOMAIN}
nameserver ${VM_NAMESERVER}
EOF