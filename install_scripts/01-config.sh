#!/bin/bash

. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Configuring timezone"
timedatectl set-timezone Europe/London
progress "Done!"

title "Fixing max watches"
if [ ! -f /etc/sysctl.d/40-max-user-watches.conf ]; then
  echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
fi
progress "Finished!"
