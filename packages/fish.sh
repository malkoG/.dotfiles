
case "$2" in 
	init)
		echo "Installing fish shell"
		git clone https://github.com/fish-shell/fish-shell ~/fish_shell
		cd ~/fish_shell
		
		autoreconf --no-recursive #if building from Git
		./configure
		make
		sudo make install
		echo "Fish shell is successfully installed"
		;;
	omf)	
		echo "Installing oh my fish"
		mkdir ~/tmp_omf && cd ~/tmp_omf
		curl -L https://get.oh-my.fish > install
		fish install --offline=omf.tar.gz

	    	echo "All steps for installing fish shell is finished"
		;;

	*)
		echo "This command is not available"
		;;
esac
