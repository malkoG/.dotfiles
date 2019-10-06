# Setting up pyenv
RC_PATH="~/.$(basename $SHELL)rc"

echo "Installing pyenv"
	
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

echo $(pyenv init -) >> $RC_PATH
source $RC_PATH

echo "Pyenv is successfully installed"
