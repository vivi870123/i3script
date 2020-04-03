#!/bin/bash

. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Configuring fstab to make windows partiion mount automatically"

# create media folder
sudo mkdir /media

# give permission to user
sudo chown $USER /media

# create folder where the windows partition shold mount to
mkdir /media/mydisk

# mount partition
sudo mount /dev/sda4 /media/mydisk

# mount partition on boot
su -
echo "UUID=$(lsblk -no UUID /dev/sda4) /media/mydisk $(lsblk -no FSTYPE /dev/sda4) defaults,noatime 0 2" >> /etc/fstab
mount -a

progress "Finished!"
