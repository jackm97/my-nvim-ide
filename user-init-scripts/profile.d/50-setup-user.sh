if [ ! -f ~/.container_user_is_init ]; then
  touch ~/.container_user_is_init
  touch ~/.bashrc

  bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/install_pixi.sh
  bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/install_cargo.sh
  bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/install_go.sh
  bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/install_modern_dev_tools.sh
  bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/install_nvim.sh
  bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/install_fish.sh
  bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/install_dotfiles.sh

  export PATH="/etc/user-init-scripts/bin:$PATH"
fi
