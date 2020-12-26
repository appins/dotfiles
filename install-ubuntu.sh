#!/bin/bash

# Script by Alex Anderson 2020, email: alexandersonone@gmail.com

# This script is released under the MIT license. There is NO WARRANTEE.
# See LICENSE for more details

sudo apt update

# Install easy deps
sudo apt install --yes git xorg i3-wm rofi lightdm light-locker notify-osd unifont \
	rxvt-unicode x11-utils neofetch neovim htop arandr pavucontrol curl \
	lxappearance fonts-powerline arc-theme feh


# Install Siji font
git clone https://github.com/stark/siji && cd siji
./install.sh -d ~/.fonts
cd ..
rm -rf siji

# Install other fonts (powerline)
sudo apt-get install fonts-powerline
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts


# Install Polybar (Thank you to kuznero on GitHub)
# https://gist.github.com/kuznero/f4e983c708cd2bdcadc97be695baacf8) 
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
	libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev \
	libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm \
	libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev \
	libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2
git clone https://github.com/jaagr/polybar.git
cd polybar
git checkout 3.4.3
./build.sh
cd ..
rm -rf polybar

# Move the files
cp -r ./Documents/* ~/Documents/
cp -r ./.colors/ ~
cp -r ./.config/* ~/.config/
cp .Xresources .bash_profile .bashrc ~

# Add the .Xresources to the database
xrdb -merge ~/.Xresources

# Install vim plug (https://github.com/junegunn/vim-plug)
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Done..."
echo "Please install https://github.com/haikarainen/light if you so choose"


