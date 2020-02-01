case "$2" in 
	vundle)	
		mkdir -p $HOME/.vim/bundle
		git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
		cp "$DIRECTORY/.vimrc" "$HOME/.vimrc"
		vim +PluginInstall +qall
		
		pip install powerline-status
		POWERLINE_PATH=$(which powerline)

		mkdir -p $HOME/.local/bin
		ln -s $POWERLINE_PATH $HOME/.local/bin

		;;
	*)
		;;
esac
