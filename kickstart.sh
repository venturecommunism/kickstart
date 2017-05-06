# core
sudo apt install -y git

# general purpose
sudo apt install -y vim

cd ~
if [ ! -d "xmonad-ubuntu-conf" ]; then
  git clone https://github.com/venturecommunism/xmonad-ubuntu-conf
fi
if [ ! -d ".xmonad" ]; then
  mkdir .xmonad
fi
cp -r xmonad-ubuntu-conf/* .xmonad
~/.xmonad/install-xmonad
