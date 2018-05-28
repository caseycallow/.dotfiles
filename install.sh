#!/usr/bin/env bash

# go to home directory

cd ~

echo configuring dotfiles...

# symlink config files

ln -sf .dotfiles/.bash_profile ~/.bash_profile
echo .bash_profile symlinked

ln -sf .dotfiles/.tmux.conf ~/.tmux.conf
echo .tmux.conf symlinked

ln -sf .dotfiles/.vimrc ~/.vimrc
echo .vimrc symlinked

# set up Vundle

mkdir ~/.vim
cd .vim
mkdir bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo vim packages installed

echo Success! All dotfiles symlinked and configured.
