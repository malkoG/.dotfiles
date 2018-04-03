#!/bin/bash
set -e

DIRNAME="$(dirname "$0")"
DIR="$(cd "$DIRNAME" && pwd)"


case "$1" in
    init)
	# This step is recommended when all setup is finished
	cp .bashrc ~/.bashrc
	
	;;
    essential-tool)
	sudo apt-get install build-essential ncurses-dev libncurses5-dev gettext autoconf cmake
	;;

    fish)
	echo "Installing fish shell"
	git clone https://github.com/fish-shell/fish-shell ~/fish_shell
	cd ~/fish_shell
	mkdir build && cd build
	cmake ..
	make
	sudo make install
	echo "Fish shell is successfully installed"

	echo "Installing oh my fish"
	git clone https://github.com/oh-my-fish/oh-my-fish ~/oh-my-fish
	cd ~/oh-my-fish
	bin/install --offline
	echo "All steps for installing fish shell is finished"
	
	;;
    emacs)
	
	
	
	cp ./.emacs ~/.emacs
	rm -rf ~/.emacs.d
	
	;;
    tmux)
	echo "Installing Tmux"
	git clone https://github.com/tmux/tmux.git ~/tmux
	cd ~/tmux
	sh autogen.sh
	./configure && make
	echo "Tmux is successfully installed"

	echo "Downloading tmux plugin manager"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	echo "Setting up tmux configuration file"
	cd ~
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f /.tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .

	echo "All steps for configuring tmux is finished"
	
	;;

    pyenv)	
	# Setting up pyenv
	echo "Installing pyenv"
	
	curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

	echo "Pyenv is successfully installed"
	;;
    *)
	echo "usage: $(basename "$0") <command>"
	echo ""
	echo "Available commands"
	echo "    essential-tools Install essential packages needed for building from source code"
	echo "    pyenv           Install pyenv with pyenv-virtualenv"
	echo "    fish            Install fish shell"
	echo "    tmux            Install tmux"
	echo "    emacs           Install emacs"
	;;
esac
