#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

read -rn 1 -p "Update Mirrors? [y/N] " umirrors
echo

if [[ $umirrors =~ ^([Yy])$ ]]; then
  title "Update Mirrors"
  sudo pacman-mirrors --country Germany,France,United_Kingdom
fi

read -rn 1 -p "Sync Mirrors? [y/N] " sync
echo
if [[ $sync =~ ^([Yy])$ ]]; then
  title "Sync Mirrors"
  yay -Syu --noconfirm
fi

remove=(
  compton
  epdfview
  palemoon-bin
	xfburn
	xcompmgr
	xterm
	deluge
	manjaro-hello
)

# title "Installing dev packages..."

# for pkg in "${dev[@]}"; do
#   pkg_name=$(echo "$pkg" | awk '{print $1}')
#   progress "Installing $pkg_name"
#   sudo pacman -S "$pkg" --noconfirm
# done

# if test ! "$(yay --version)"; then
#   title "Installing yay"
#   mkdir -p /tmp/yay
#   git clone https://aur.archlinux.org/yay.git /tmp/yay
#   cd /tmp/yay || exit
#   makepkg -si
# fi

# allpackages=("${desktop[@]}" "${apps[@]}")

title "Removing unecessary packages..."

for aur in "${remove[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
	progress "Installing $aur_name"
	yay -R "$aur" --noconfirm
done

title "Clean the nonneeded packages..."
yay -Yc
