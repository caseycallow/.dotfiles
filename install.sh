#!/usr/bin/env bash

# go to home directory
cd ~

# symlink config files
ln -sf .dotfiles/.bash_profile ~/.bash_profile
ln -sf .dotfiles/.tmux.conf ~/.tmux.conf
ln -sf .dotfiles/.vimrc ~/.vimrc

# set up Vundle
mkdir ~/.vim
cd .vim
mkdir bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# set up fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo Environment configured successfully ✔
