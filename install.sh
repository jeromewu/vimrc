#!/bin/bash

echo "Backup the existing .vimrc file and .vim folder"
mv ~/.vimrc ~/.vimrc.bak
mv ~/.vim ~/.vim.bak
echo "Install new version"
cp ./.vimrc ~/
mkdir ~/.vim
echo "Install vundle and other plugins"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall 2&> /dev/null
