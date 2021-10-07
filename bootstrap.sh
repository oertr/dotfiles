#!/usr/bin/env bash

## Install Scripts
if [ ! -d "bin" ]; then
	mkdir -p ~/bin
fi
cd ~/bin
curl -s -O "https://raw.githubusercontent.com/rupa/z/master/z.sh"
curl -s -O "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
cd -

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -fvs ~/dotfiles/.bashrc ~
ln -fvs ~/dotfiles/.bash_profile ~
ln -fvs ~/dotfiles/.gitconfig ~
ln -fvs ~/dotfiles/.inputrc ~
ln -fvs ~/dotfiles/.profile ~
ln -fvs ~/dotfiles/.vimrc ~
ln -fvs ~/dotfiles/.zshrc ~
ln -fvs ~/dotfiles/.tmux.conf

