set -e 
set -x

# install fish shell and some nice-to-haves
pixi global install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | tee install_omf.fish
fish install_omf.fish --noninteractive
rm -f install_omf.fish
fish -c "omf install bass"
mkdir -p ~/.config/fish/completions/
pixi completion --shell fish | tee ~/.config/fish/completions/pixi.fish
cp /etc/user-init-scripts/config.fish ~/.config/fish/config.fish
$(which sudo) ln -s $(which fish) /usr/bin
