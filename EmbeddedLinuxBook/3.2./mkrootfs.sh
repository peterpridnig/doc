#!/bin/bash

MAINDIR=/home/quade/embedded

cd $MAINDIR/qemu/userland
dd if=/dev/zero of=rootfs.img bs=4k count=2k
mkfs.ext4 -i 1024 -F rootfs.img
sudo mount -o loop rootfs.img loop
rsync -a busybox-1.21.1/_install/ loop
mkdir loop/dev
mkdir loop/etc
mkdir loop/proc
mkdir loop/sys
sudo mknod loop/dev/console c 5 1
sudo mknod loop/dev/null c 1 3
sudo mknod loop/dev/tty0 c 4 0
sudo mknod loop/dev/tty1 c 4 1
sudo mknod loop/dev/tty2 c 4 2
sudo chown -R root.root loop
# MARK A
# MARK B
# MAKR C
# Aushaengen
sudo umount loop
