#!/bin/bash

. "$(dirname "$BASH_SOURCE")/../utils.sh"

nvm install node
nvm install --lts --latest-npm

title "Installing global packages"

packages=(
	eslint
	create-react-app
	create-react-native-app
	bash-language-server
	caniuse-cli
	fx
)

for package in "${packages[@]}"; do
  package_name=$(echo "$package" | awk '{print $1}')
  if test "$(which "$package_name" 2>/dev/null)"; then
    warn "$package_name already installed..."
  else
    progress "Installing $package_name"
    npm install -g "$package"
  fi
done

progress "Finished"
