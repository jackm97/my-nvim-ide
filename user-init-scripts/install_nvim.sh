set -e 
set -x

pixi global install nvim nodejs git

cargo install ripgrep
cargo install bottom
go install github.com/jesseduffield/lazygit@latest
go install github.com/dundee/gdu/v5/cmd/gdu@latest

