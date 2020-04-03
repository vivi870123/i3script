#!/bin/bash

. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Copying touchapad settings"

sudo rm /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp ./touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

progress "Finished!"
