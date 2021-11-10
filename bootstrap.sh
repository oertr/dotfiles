#!/usr/bin/env bash

## Install Scripts
curl -sLo ~/bin/z.sh --create-dirs \
  "https://raw.githubusercontent.com/rupa/z/master/z.sh"
curl -sLo ~/bin/git-prompt.sh --create-dirs \
  "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
curl -sLo ~/.vim/autoload/plug.vim --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

ln -fvs ~/dotfiles/.bashrc ~
ln -fvs ~/dotfiles/.bash_profile ~
ln -fvs ~/dotfiles/.gitconfig ~
ln -fvs ~/dotfiles/.inputrc ~
ln -fvs ~/dotfiles/.profile ~
ln -fvs ~/dotfiles/.vimrc ~
ln -fvs ~/dotfiles/.tmux.conf ~

## for vim
mkdir -p ~/.vim/cache
vim -E -s -u ~/.vimrc -c "PlugInstall --sync"  -c qall

