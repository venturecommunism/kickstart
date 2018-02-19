# prelim
sudo apt update && apt upgrade

# core
sudo apt install -y git

# general purpose
sudo apt install -y vim pavucontrol vlc

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update

# standardjs CLI tool for javascript linting (cleanup)
npm install standard --global

# node version manager for nodejs and npm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# you get the following message
# => Close and reopen your terminal to start using nvm or run the following to use it now:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 8.9.4
nvm alias default 8.9.4
npm install -g yarn

cd ~
if [ ! -d "xmonad-ubuntu-conf" ]; then
  git clone https://github.com/venturecommunism/xmonad-ubuntu-conf
fi
if [ ! -d ".xmonad" ]; then
  mkdir .xmonad
fi
cp -r xmonad-ubuntu-conf/* .xmonad
~/.xmonad/install-xmonad

cd ~
if [ ! -d "react-app" ]; then
  git clone https://github.com/venturecommunism/react-app
fi
if [ ! -d "react-app/node_modules" ]; then
  cd react-app
  yarn
fi
if [ ! -f "react-app/config/url.js" ] ; then
  cp react-app/config/example-url.js react-app/config/url.js
fi

npm install -g react-native-cli
sudo apt-add-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

if [ ! -d "/opt/android-studio" ]; then
  #wget https://dl.google.com/dl/android/studio/ide-zips/2.3.3.0/android-studio-ide-162.4069837-linux.zip
  wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip
  #sudo unzip android-studio-ide-162.4069837-linux.zip -d /opt
  sudo unzip android-studio-ide-171.44430003-linux.zip -d /opt
  cd /opt/android-studio/bin
  ./studio.sh
fi

sudo apt-get install -y android-tools-adb
