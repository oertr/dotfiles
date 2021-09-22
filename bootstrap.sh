#!/usr/bin/env bash

## Install Scripts
mkdir -p ~/bin
cd ~/bin
curl -s -O "https://raw.githubusercontent.com/rupa/z/master/z.sh"
curl -s -O "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
cd -

ln -s ./.bashrc ~/.bashrc
ln -s ./.bash_profile ~/.bash_profile
ln -s ./.gitconfig ~/.gitconfig
ln -s ./.inputrc ~/.inputrc
ln -s ./.profile ~/.profile
ln -s ./.vimrc ~/.vimrc
ln -s ./.zshrc ~/.zshrc

