cat <<EOF > /etc/network/interfaces.d/enp1s0
auto enp1s0
iface enp1s0 inet static
	address ${VM_IP}
	netmask 255.255.255.0
	gateway ${VM_GATEWAY}
EOF

echo "${VM_IP}    ${VM_HOSTNAME}.${VM_DOMAIN} ${VM_HOSTNAME}" >> /etc/hosts