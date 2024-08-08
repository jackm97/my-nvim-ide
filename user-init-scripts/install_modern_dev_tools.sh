set -x -e

pixi global install \
  python \
  git \
  xclip \
  cmake \
  make \
  ninja

cargo install wl-clipboard-rs-tools
