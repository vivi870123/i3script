#!/bin/sh

confirm() {
	read -r -p "continue with $1 setup for $2 [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo "setup not possible!"
		echo "exiting."
		exit
	else
		./setup/$1.sh
	fi
}

COLUMNS=12

PS3="select an option: "

declare -a options=(
		"Manjaro Linux - Dotfiles"
		"Manjaro Linux - Packages"
		"Manjaro Linux - Config"
		"Quit"
)
select opt in "${options[@]}"
do
	case $opt in
		"Manjaro Linux - Dotfiles")
			confirm "dotfiles" "Manjaro Linux"
			break
			;;
		"Manjaro Linux - Packages")
			confirm "packages" "Manjaro Linux"
			break
			;;
		"Manjaro Linux - Config")
			confirm "config" "Manjaro Linux"
			break
			;;
		"Manjaro Linux - Config")
			confirm "config" "Manjaro Linux"
			break
			;;
		"Quit")
			echo "Quitting..."
			break
			;;
		*) echo "Invalid option: $REPLY";;
	esac
done
