# Introduction
Scripts to create and deploy VM images for [QEMU](https://www.qemu.org/) / [KVM](https://linux-kvm.org/page/Main_Page) ([qcow2](https://en.wikipedia.org/wiki/Qcow) / raw).
The Debian images are equivalent to the ones created using [d-i](https://d-i.debian.org/doc/internals/). Behind the scene, the scripts use [debootstrap](https://wiki.debian.org/Debootstrap).

# Usage
## Dependencies

```
sudo apt install qemu-utils parted debootstrap packagekit
```

## Build

```
mkdir -p ~/img
```

```
debian/buildvm --path ~/img \
        --name server1 \
        --release trixie \
        --domain example.com \
        --hostname server1 \
        --ip 192.168.0.110 \
        --gateway 192.168.0.1 \
        --nameserver 192.168.0.1 \
        --size 10G \
        --disk-format qcow2 \
        --ask-root-password \
        --ask-glia-password \
        --packages="kubernetes/1.32 desktop" \
        --users="me"
```

## Deploy
```
debian/deployvm --path ~/img \
        --name server1 \
        --host glia@node1.local \
        --pool vm \
        --vcpus 1 \
        --memory 2048 \
        --network br0 \
        --delete-image
```