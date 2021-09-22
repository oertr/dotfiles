#!/usr/bin/env bash

## Install Scripts
mkdir -p ~/bin
cd ~/bin
curl -s -O "https://raw.githubusercontent.com/rupa/z/master/z.sh"
curl -s -O "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
cd -

ln -s ~/dotfiles/.bashrc ~
ln -s ~/dotfiles/.bash_profile ~
ln -s ~/dotfiles/.gitconfig ~
ln -s ~/dotfiles/.inputrc ~
ln -s ~/dotfiles/.profile ~
ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.zshrc ~

