set -e 
set -x

# install pixi
if [ ! -d ~/.pixi ]; then
  curl -fsSL https://pixi.sh/install.sh | bash
  mkdir -p ~/.local/share/bash-completion/
  ~/.pixi/bin/pixi completion --shell bash | tee ~/.local/share/bash-completion/pixi.sh
fi

