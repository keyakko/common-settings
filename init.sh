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

sudo chsh -s /bin/zsh $USER 

sudo pip3 install git+git://github.com/powerline/powerline
sudo pip3 install powerline-shell

#cp -r /usr/local/lib/python3.8/dist-packages/powerline/config_files ~/.config/powerline
#pip3 install psutil

git clone https://github.com/lukechilds/zsh-better-npm-completion /tmp/zsh-better-npm-completion --depth 1
sudo mkdir -p /usr/local/lib/zsh
sudo mv /tmp/zsh-better-npm-completion /usr/local/lib/zsh/zsh-better-npm-completion

git clone https://github.com/powerline/fonts ~/git/powerline-fonts --depth 1
~/git/powerline-fonts/install.sh

cp ~/git/common-settings/.* ~/
mkdir ~/.config/
cp -R ~/git/common-settings/.config/powerline ~/.config/powerline
