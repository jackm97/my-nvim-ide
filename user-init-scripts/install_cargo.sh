set +x
set +e

# install cargo
pixi global install rust
echo "export PATH=~/.cargo/bin:\$PATH" >> ~/.bashrc
