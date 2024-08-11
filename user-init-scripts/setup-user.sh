#!/bin/bash


if [ ! -d ~/.local/share/chezmoi ]; then
  set -x
  set -e

  curl -fsSL https://pixi.sh/install.sh | bash
  export PATH=~/.pixi/bin:"$PATH"
  pixi global install git
  git clone https://github.com/jackm97/dotfiles.git ~/.local/share/chezmoi 
  pixi run --manifest-path ~/.local/share/chezmoi/pixi.toml install-user-tools 

  /etc/user-init-scripts/bin/make-user-exe-global
fi
