set -e 
set -x

ROOT_FLAG=""
if [ "$(whoami)" == "root" ]; then ROOT_FLAG="--root"; fi

git clone https://github.com/jackm97/dotfiles.git ~/dotfiles
pixi run --manifest-path ~/dotfiles/pixi.toml restore --force $ROOT_FLAG
