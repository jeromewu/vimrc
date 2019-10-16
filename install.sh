#!/bin/bash

set -e -o pipefail

main(){
  timestamp=$(date +%s)

  echo "Check dependencies"
  for cmd in git cmake python node ctags
  do
    command -v $cmd > /dev/null 2>&1 || { echo >&2 "$cmd is required for this script. Aborting"; exit 1; }
  done

  echo "Backup existing .vimrc file and .vim folder"
  mv ~/.vimrc ~/.vimrc.${timestamp}
  mv ~/.vim ~/.vim.${timestamp}

  echo "Copy .vimrc"
  cp ./.vimrc ~/.vimrc

  echo "Copy .vim"
  cp -r ./.vim ~/.vim/

  echo "Copy .tern-project"
  cp -r ./.tern-project ~/.tern-project

  echo "Install plug.vim"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Install plugins"
  vim +PlugInstall +qall
}

main "$@"

