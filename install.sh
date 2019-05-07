#!/bin/bash

main(){
  timestamp=$(date +%s)
  
  echo "Check dependencies"
  for cmd in git cmake python node
  do
    command -v $cmd > /dev/null 2>&1 || { echo >&2 "$cmd is required for this script. Aborting"; exit 1; }
  done

  echo "Backup the existing .vimrc file and .vim folder"
  mv ~/.vimrc ~/.vimrc.${timestamp}
  mv ~/.vim ~/.vim.${timestamp}

  echo "Copy new .vimrc"
  cp ./.vimrc ~/.vimrc

  echo "Copy config files"
  cp -r ./UltiSnips ~/.vim/

  echo "Install plug.vim"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Install plugins"
  vim +PlugInstall +qall
}

main "$@"

