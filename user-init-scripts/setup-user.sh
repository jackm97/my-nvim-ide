#!/bin/bash
set -x
set -e

export PATH="/usr/local/pixibin:$PATH"

if [ ! -d ~/.local/share/chezmoi ]; then
  curl -fsSL https://pixi.sh/install.sh | bash
  export PATH=~/.pixi/bin:"$PATH"
  pixi global install git
  git clone https://github.com/jackm97/dotfiles.git ~/.local/share/chezmoi 
  pixi run --manifest-path ~/.local/share/chezmoi/pixi.toml install-user-tools 

  /etc/user-init-scripts/bin/make-user-exe-global
fi

if [ ! -d /usr/local/pixibin ]; then
fi
