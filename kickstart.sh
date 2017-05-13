# prelim
sudo apt update && apt upgrade

# core
sudo apt install -y git

# general purpose
sudo apt install -y vim pavucontrol

# node version manager for nodejs and npm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# you get the following message
# => Close and reopen your terminal to start using nvm or run the following to use it now:
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cd ~
if [ ! -d "xmonad-ubuntu-conf" ]; then
  git clone https://github.com/venturecommunism/xmonad-ubuntu-conf
fi
if [ ! -d ".xmonad" ]; then
  mkdir .xmonad
fi
cp -r xmonad-ubuntu-conf/* .xmonad
~/.xmonad/install-xmonad
