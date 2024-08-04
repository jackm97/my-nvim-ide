set -e 
set -x

# install go
pixi global install go
echo "export PATH=~/go/bin:\$PATH" | tee -a ~/.bashrc
