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
	python-pip


#git clone https://github.com/keyakko/common-settings ~/git/common-settings
cp ~/git/common-settings/.* ~/


chsh -s /bin/zsh


pip install --user git+git://github.com/powerline/powerline
pip install psutil
git clone https://github.com/powerline/fonts ~/git/powerline-fonts
~/git/powerline-fonts/install.sh

