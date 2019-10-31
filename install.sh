#!/bin/bash

set -e -o pipefail

main(){
  timestamp=$(date +%s)

  # Must use exuberant-ctags or universal-ctags
  echo "Check dependencies"
  for cmd in git cmake python node ctags go
  do
    command -v $cmd > /dev/null 2>&1 || { echo >&2 "$cmd is required for this script. Aborting"; exit 1; }
  done

  echo "Backup existing .vimrc file and .vim folder"
  mv ~/.vimrc ~/.vimrc.${timestamp} || true
  mv ~/.vim ~/.vim.${timestamp} || true

  echo "Copy .vimrc"
  cp ./.vimrc ~/.vimrc

  echo "Copy .vim"
  cp -r ./.vim ~/.vim/

  echo "Copy .ctags"
  cp ./.ctags ~/.ctags

  echo "Install plug.vim"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Install plugins"
  vim +'PlugInstall --sync' +qall &> /dev/null < /dev/tty
}

main "$@"

