#!/bin/bash
set -x
set -e

sudocmd="sudo"
if [ "root" = "$(whoami)" ]; then
  sudocmd=""
fi

if [ ! -d /usr/local/pixibin ]; then
  $sudocmd ln -sf ~/.pixi/bin /usr/local/pixibin 
fi

export PATH="/usr/local/pixibin:$PATH"

if [ ! -d ~/.local/share/chezmoi ]; then
  /etc/user-init-scripts/install_pixi.sh
  pixi global install git
  git clone https://github.com/jackm97/dotfiles.git ~/.local/share/chezmoi 
  pixi run --manifest-path ~/.local/share/chezmoi/pixi.toml install-user-tools
fi
