git clone https://git.savannah.gnu.org/git/emacs.git ~/emacs
cd ~/emacs
./autogen.sh
./configure
make
make install	
rm -rf ~/.emacs.d	
