#!/bin/sh

cd $(dirname $0)

sudo mkdir -p /mnt/usbmem
sudo mount -t drvfs E: /mnt/usbmem
sudo mkdir -p /mnt/usbmem/EFI/BOOT
sudo cp $1 /mnt/usbmem/EFI/BOOT/BOOTX64.EFI
sudo umount /mnt/usbmem
