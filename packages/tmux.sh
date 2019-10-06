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
