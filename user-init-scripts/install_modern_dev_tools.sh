set -e 
set -x

pixi global install python git

$(which sudo) mkdir -p /etc/pixi-manifests/cmake-project
$(which sudo) chown -R $USER:$USER /etc/pixi-manifests
cd /etc/pixi-manifests/cmake-project
pixi init
pixi add --no-lockfile-update \
cmake \
clang-format \
cmake-format \
clang-tools \
ninja \
make \
clangdev \
c-compiler \
cxx-compiler \
gcc \
gxx \
clang \
clangxx \
python \
unzip \
doxygen \
cppcheck \
codespell 

pixi add --pypi cmake-init

pixi task add cmake-init cmake-init 

$(which sudo) ln -sf /etc/user-init-scripts/init-cmake-project /usr/bin/init-cmake-project

