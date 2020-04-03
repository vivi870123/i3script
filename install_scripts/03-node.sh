#!/bin/bash

. "$(dirname "$BASH_SOURCE")/../utils.sh"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install node

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

progress "Finished!"
