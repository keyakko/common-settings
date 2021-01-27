#!/usr/bin/env bash

brew install \
  zsh-completions \
  zsh-git-prompt \
  zsh-navigation-tools \
  zsh-syntax-highlighting \
  powerline-go

brew install --cask \
  font-dejavu-sans-mono-for-powerline

git clone https://github.com/lukechilds/zsh-better-npm-completion \
  --depth 1 /tmp/zsh-better-npm-completion
sudo mv /tmp/zsh-better-npm-completion \
  /usr/local/opt/zsh-better-npm-completion