#!/bin/bash

echo "Backup the existing .vimrc file and .vim folder"
cp ~/.vimrc ~/.vimrc.bak
cp -r ~/.vim ~/.vim.bak
echo "Install new version"
cp ./.vimrc ~/
cp -r ./.vim ~/
