# if [ -z "$SKIP_USER_SETUP" ]; then
#   export SKIP_USER_SETUP=1
#   /usr/bin/bash --rcfile ~/.bashrc --noprofile -i /etc/user-init-scripts/setup-user.sh
#   unset SKIP_USER_SETUP 
# fi

export PATH="/usr/local/pixibin:$PATH"
export PATH="/etc/user-init-scripts/bin:$PATH"
