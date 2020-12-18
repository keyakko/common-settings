#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
	tmux \
	zsh \
	zsh-syntax-highlighting \
	curl \
	tree \
	wget \
	tasksel \
	openssh-server \
	vim \
	python3-pip \
	network-manager 


#git clone https://github.com/keyakko/common-settings ~/git/common-settings
cp ~/git/common-settings/.* ~/


chsh -s /bin/zsh

sudo pip3 install git+git://github.com/powerline/powerline
pip3 install psutil
git clone https://github.com/powerline/fonts ~/git/powerline-fonts
~/git/powerline-fonts/install.sh

