set -e

# prelim
echo '*****'
echo '*****'
echo 'apt-get update && apt-get upgrade'
echo '*****'
echo '*****'
sudo apt update && sudo apt -y upgrade

# core
echo '*****'
echo '*****'
echo 'Install git'
echo '*****'
echo '*****'
sudo apt install -y git

# general purpose
echo '*****'
echo '*****'
echo 'Install vim, pavucontrol, vlc, curl, firefox'
echo '*****'
echo '*****'
sudo apt install -y vim pavucontrol vlc curl firefox

# install yarn
echo '*****'
echo '*****'
echo 'Add yarn key, add to sources list, update'
echo '*****'
echo '*****'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update

# node version manager for nodejs and npm
echo '*****'
echo '*****'
echo 'Install Node Version Manager, node v8.9.4, yarn'
echo '*****'
echo '*****'
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
# you get the following message
# => Close and reopen your terminal to start using nvm or run the following to use it now:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 8.9.4
nvm alias default 8.9.4
npm install -g yarn

# standardjs CLI tool for javascript linting (cleanup)
echo '*****'
echo '*****'
echo 'Install standard js linter'
echo '*****'
echo '*****'
npm install standard --global

cd ~
if [ ! -d "xmonad-ubuntu-conf" ]; then
  echo "Sleeping 5 seconds... Didn't find directory xmonad-ubuntu-conf"
  sleep 5
  git clone https://github.com/venturecommunism/xmonad-ubuntu-conf
fi
if [ ! -d ".xmonad" ]; then
  echo "Sleeping 5 seconds... Didn't find directory .xmonad"
  sleep 5
  cp -r xmonad-ubuntu-conf .xmonad
  ~/.xmonad/install-xmonad
fi

cd ~
if [ ! -d "apps" ]; then
  echo "Sleeping 5 seconds... Didn't find directory apps"
  sleep 5
  mkdir apps
fi
if [ ! -d "apps/react-app" ]; then
  echo "Sleeping 5 seconds... Didn't find directory apps/react-app"
  sleep 5
  cd ~/apps
  git clone https://github.com/venturecommunism/react-app
  cd ~
fi
if [ ! -d "apps/react-app/node_modules" ]; then
  echo "Sleeping 5 seconds... apps/react-app is not installed"
  sleep 5
  cd apps/react-app
  yarn
fi
if [ ! -f "apps/react-app/config/url.js" ] ; then
  echo "Sleeping 5 seconds... Didn't find file apps/react-app/config/url.js"
  sleep 5
  cp apps/react-app/config/example-url.js apps/react-app/config/url.js
fi

cd ~
if [ ! -d "/opt/camlistore" ]; then
  wget https://perkeep.org/dl/monthly/camlistore-20170505-linux.tar.gz
  sudo mkdir /opt/camlistore
  sudo tar xvf camlistore-20170505-linux.tar.gz -C /opt/camlistore
fi

# camget camput cammount camtool publisher camlistored

if [ ! -e "/usr/bin/camget" ]; then
  sudo ln -s /opt/camlistore/camget /usr/bin/camget
fi

if [ ! -e "/usr/bin/camput" ]; then
  sudo ln -s /opt/camlistore/camput /usr/bin/camput
fi

if [ ! -e "/usr/bin/cammount" ]; then
  sudo ln -s /opt/camlistore/cammount /usr/bin/cammount
fi

if [ ! -e "/usr/bin/camtool" ]; then
  sudo ln -s /opt/camlistore/camtool /usr/bin/camtool
fi

if [ ! -e "/usr/bin/publisher" ]; then
  sudo ln -s /opt/camlistore/publisher /usr/bin/publisher
fi

if [ ! -e "/usr/bin/camlistored" ]; then
  sudo ln -s /opt/camlistore/camlistored /usr/bin/camlistored
fi

# Error: Could not use secret ring file /home/fsociety/.config/camlistore/identity-secring.gpg: stat /home/fsociety/.config/camlistore/identity-secring.gpg: no such file or directory.
# A GPG key is required, please use 'camput init --newkey'.
# Or if you know what you're doing, you can set the global camput flag --secret-keyring, or the CAMLI_SECRET_RING env var, to use your own GPG ring. And --gpgkey=<pubid> or GPGKEY to select which key ID to use.

npm install -g react-native-cli
sudo apt-add-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

sudo apt-get install -y android-tools-adb

# install kalarm for timers / alarms
sudo apt-get install -y kalarm

# fixes a bug in timezones with kalarm
sudo apt-get install -y plasma-workspace

cd ~
if [ ! -f "android-studio-ide-171.4443003-linux.zip" ]; then
  #wget https://dl.google.com/dl/android/studio/ide-zips/2.3.3.0/android-studio-ide-162.4069837-linux.zip
  wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip
fi
if [ ! -d "/opt/android-studio" ]; then
  echo "Didn't find directory /opt/android-studio"
  sleep 10
  #sudo unzip android-studio-ide-162.4069837-linux.zip -d /opt
  sudo unzip android-studio-ide-171.4443003-linux.zip -d /opt
  cd /opt/android-studio/bin
  ./studio.sh
fi
