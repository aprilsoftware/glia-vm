# Introduction
Scripts to create and deploy VM images for KVM.
The Debian images are equivalent to the ones created using [d-i](https://d-i.debian.org/doc/internals/). Behind the scene, the scripts use [debootstrap](https://wiki.debian.org/Debootstrap).

# Usage
## Build
```
debian/buildvm --path ~/halOS/img \
        --name net0.example \
        --release bookworm \
        --domain net0.aprilsoftware.com \
        --hostname example \
        --ip 192.168.0.110 \
        --gateway 192.168.0.1 \
        --nameserver 192.168.0.1 \
        --size 10G \
        --ask-root-password \
        --ask-glia-password
```

## Deploy
```
debian/deployvm --path ~/halOS/img \
        --name net0.example \
        --host glia@node1.local \
        --destination /mnt/gv0/vm \
        --vcpus 1 \
        --memory 2048 \
        --network br0 \
        --delete-image
```
