echo "installing starship"
cargo install --force starship

echo 'eval "$(starship init `basename $SHELL`)"' >> $RC_PATH
mkdir -p ~/.config
cp "$DIRECTORY/starship.toml" ~/.config/starship.toml
