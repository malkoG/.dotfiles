#!/bin/bash
set -e

DIRNAME="$(dirname "$0")"
DIR="$(cd "$DIRNAME" && pwd)"


case "$1" in
    init)
	# This step is recommended when all setup is finished
	cp .bashrc ~/.bashrc
	cp .emacs ~/.emacs
	cp .zshrc ~/.zshrc
	
	;;
    essential-tool)
	sudo apt-get install build-essential ncurses-dev libncurses5-dev gettext autoconf cmake automake libevent-dev zlib1g-dev libbz2-dev libssl-dev libsqlite3-dev
	;;

    fish)
	echo "Installing fish shell"
	git clone https://github.com/fish-shell/fish-shell ~/fish_shell
	cd ~/fish_shell
	
	autoreconf --no-recursive #if building from Git
	./configure
	make
	sudo make install
	echo "Fish shell is successfully installed"

	echo "Installing oh my fish"
	mkdir ~/tmp_omf && cd ~/tmp_omf
	curl -L https://get.oh-my.fish > install
	fish install --offline=omf.tar.gz
    	echo "All steps for installing fish shell is finished"
	
	;;

    zsh)
	echo "Installing zsh shell"

	git clone https://github.com/zsh-users/zsh ~/zsh

	cd ~/zsh
	
	./Util/preconfig	
	./configure
	
	make
	make check
	sudo make install
	sudo make install.info
	
	echo "Zsh shell is successfully installed"

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	
	echo "All steps for installing zsh shell is finished"
	;;
    emacs)
	git clone https://git.savannah.gnu.org/git/emacs.git ~/emacs
	cd ~/emacs
	./autogen.sh
	./configure
	make
	make install
	
	rm -rf ~/.emacs.d	
	;;
    tmux)
	echo "Installing Tmux"
	git clone https://github.com/tmux/tmux.git ~/tmux
	cd ~/tmux
	sh autogen.sh
	./configure && make
	echo "Tmux is successfully installed"

	sudo cp tmux /usr/local/bin/tmux

	echo "Downloading tmux plugin manager"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	echo "Setting up tmux configuration file"
	cd ~
	git clone https://github.com/gpakosz/.tmux.git ~/.tmp_tmux
	ln -s -f ~/.tmp_tmux/.tmux.conf
	cp .tmp_tmux/.tmux.conf.local .

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
	echo "    essential-tool  Install essential packages needed for building from source code"
	echo "    pyenv           Install pyenv with pyenv-virtualenv"
	echo "    fish            Install fish shell"
	echo "    tmux            Install tmux"
	echo "    emacs           Install emacs"
	;;
esac
