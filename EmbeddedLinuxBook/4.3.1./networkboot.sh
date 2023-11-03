#!/bin/bash

cd $1/../images/
arm-linux-mkimage -A arm -O linux\
	-T ramdisk -C none -d rootfs.cpio.gz initramfs.uboot

sudo cp uImage /var/lib/tftpboot/uimage.uboot
sudo cp initramfs.uboot /var/lib/tftpboot/
