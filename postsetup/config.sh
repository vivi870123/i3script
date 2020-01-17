#!/bin/bash
setup_nvm_and_apps() {
	read -r -p "Setup NVM and install dependencies [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping NVM setup...\n"
	else
		echo -e "\nSetting up NVM and Packages..."
		nvm install node
		npm install -g intellephense bash-language-server neovim
	fi
}


setup_homestead() {
	read -r -p "Setup homestead for PHP [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping Homestead setup for PHP...\n"
	else
		echo -e "\nSetting up Homestead for PHP..."

		echo -e "\nInstalling laravel/installer via composer..."
		composer global require laravel/installer

		echo -e "\nInstalling homestead via git..."
		git clone https://github.com/laravel/homestead.git ~/.Homestead
		cd ~/.Homestead
			git checkout release
			bash init.sh

		echo -e "\nCopying Homestead.yaml to ~/.Homestead"
		cp $DOTFILE/mines/homestead/Homestead.yaml ~/.Homestead/

		echo -e "\nCopying aliases to ~/.Homestead"
		tee -a $HOME/$DOTFILE/mines/homestead/aliases ~/.Homestead/resources/aliases
		
		echo -e "\nCopying host file to /etc/hosts"
		sudo tee -a $HOME/$DOTFILE/mines/homestead/hosts /etc/hosts
	fi
}

install_python_apps() {
	read -r -p "Install python apps [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping python app installation...\n"
	else
		echo -e "\nSetting up python packages..."
		pip3 install --user vim-vint flake8 proselint yamllint neovim ipython pynvim
	fi
}

setup_homestead
setup_nvm_and_apps
setup_python_apps


echo -e "Configuration completed.\n"
