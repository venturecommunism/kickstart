# 0) install elixir

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
udo apt-get install -y esl-erlang
sudo apt-get install -y elixir

# prelim
sudo apt update && apt upgrade

# install docker

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine

# alternate install sudo apt-get install -y docker.io

sudo systemctl status docker

# minio

sudo docker pull minio/minio
sudo docker run -p 9000:9000 minio/minio server /export

# so docker doesn't require sudo all the time

sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
newgrp docker

# core
sudo apt install -y git

# general purpose
sudo apt install -y vim pavucontrol vlc

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# standardjs CLI tool for javascript linting (cleanup)
npm install standard --global

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
