# Introduction
Scripts to create and deploy VM images for [QEMU](https://www.qemu.org/) / [KVM](https://linux-kvm.org/page/Main_Page) ([qcow2](https://en.wikipedia.org/wiki/Qcow)]).
The Debian images are equivalent to the ones created using [d-i](https://d-i.debian.org/doc/internals/). Behind the scene, the scripts use [debootstrap](https://wiki.debian.org/Debootstrap).

# Usage
## Build

```
mkdir -p ~/img
```

```
debian/buildvm --path ~/img \
        --name server1 \
        --release bookworm \
        --domain example.com \
        --hostname server1 \
        --ip 192.168.0.110 \
        --gateway 192.168.0.1 \
        --nameserver 192.168.0.1 \
        --size 10G \
        --ask-root-password \
        --ask-glia-password
```

## Deploy
```
debian/deployvm --path ~/img \
        --name server1 \
        --host glia@node1.local \
        --destination /mnt/gv0/vm \
        --vcpus 1 \
        --memory 2048 \
        --network br0 \
        --delete-image
```