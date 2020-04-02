
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

# place file in /etc/default/tlp
WIFI_PWR_ON_BAT=off
