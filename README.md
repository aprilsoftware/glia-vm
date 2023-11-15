# Introduction
Scripts to create and deploy VM images for KVM (libvirt).
The Debian images are equivalent to the ones created using [d-i](https://d-i.debian.org/doc/internals/). Behind the scene, the scripts use [debootstrap](https://wiki.debian.org/Debootstrap).

# Usage
## Build & Deploy
```
mkdir -p ~/img
```

```
BUILD_PATH=~/img
VM_NAME=server1
OS_RELEASE=bookworm
VM_DOMAIN=example.com
VM_HOSTNAME=server1
VM_IP=192.168.0.182
VM_GATEWAY=192.168.0.1
VM_NAMESERVER=192.168.0.1
VM_SIZE=8G

KVM_HOST=glia@node1.local
VM_DESTINATION=/mnt/gv0/vm
VM_VCPUS=1
VM_MEMORY=2048
VM_NETWORK=br0

../debian/buildvm --path ${BUILD_PATH} \
        --name ${VM_NAME} \
        --release ${OS_RELEASE} \
        --domain ${VM_DOMAIN} \
        --hostname ${VM_HOSTNAME} \
        --ip ${VM_IP} \
        --gateway ${VM_GATEWAY} \
        --nameserver ${VM_NAMESERVER} \
        --size ${VM_SIZE} \
        --ask-root-password \
        --ask-glia-password

../debian/deployvm --path ${BUILD_PATH} \
        --name ${VM_NAME} \
        --host ${KVM_HOST} \
        --destination ${VM_DESTINATION} \
        --vcpus ${VM_VCPUS} \
        --memory ${VM_MEMORY} \
        --network ${VM_NETWORK} \
        --delete-image
```
