#!/bin/bash
set -e

FILEPATH=`realpath $0`
DIRECTORY=$(echo `dirname $FILEPATH`)
INCLUDE_PATH="$DIRECTORY/packages/$1.sh"

SHELL_NAME=`basename $SHELL`
RC_PATH="$HOME/.$SHELL_NAME""rc"

case "$1" in
	setup)
		case "$2" in
			ubuntu|centos|arch)
				SETUP_PATH="$DIRECTORY/setups/$2.sh"
				source $SETUP_PATH

				# This step is recommended when all setup is finished
				cp .bashrc ~/.bashrc
				cp .zshrc ~/.zshrc
				;;
			*)
				;;
		esac

		;;
   	vim|tmux|emacs|pyenv|zsh|fish|rust|starship)
		source $INCLUDE_PATH
		;;

	*)
		echo "usage: $(basename "$0") <command> <options>"
		echo ""
		echo "Available commands"
		echo "    essential-tool  Install essential packages needed for building from source code"
		echo "    pyenv           Install pyenv with pyenv-virtualenv"
		echo "    fish            Install fish shell"
		echo "    tmux            Install tmux"
		echo "    emacs           Install emacs"
		;;
esac
