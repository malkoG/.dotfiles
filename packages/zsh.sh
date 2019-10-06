case "$2" in 
	init)
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
		;;

	oh-my-zsh)
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		;;

	plugins)
		;;

	*) 
		echo "This command is not available"
esac
