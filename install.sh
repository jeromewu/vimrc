#!/bin/bash

main(){
  timestamp=$(date +%s)
  basePluginDir=~/.vim/bundle

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

  echo "Copy other config files"
  cp ./.tern-project ~/.tern-project
  cp -r ./UltiSnips ~/.vim/

  echo "Install pathogen.vim"
  mkdir -p ~/.vim/autoload ${basePluginDir}
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  echo "Install plugins"
  git clone --depth 1 https://github.com/nanotech/jellybeans.vim ${basePluginDir}/jellybeans.vim
  git clone --depth 1 https://github.com/scrooloose/nerdtree ${basePluginDir}/nerdtree
  git clone --depth 1 https://github.com/scrooloose/syntastic ${basePluginDir}/syntastic
  git clone --depth 1 https://github.com/pangloss/vim-javascript ${basePluginDir}/vim-javascript
  git clone --depth 1 https://github.com/mxw/vim-jsx ${basePluginDir}/vim-jsx
  git clone --depth 1 https://github.com/heavenshell/vim-jsdoc ${basePluginDir}/vim-jsdoc
  git clone --depth 1 https://github.com/Valloric/YouCompleteMe ${basePluginDir}/YouCompleteMe
  git clone --depth 1 https://github.com/SirVer/ultisnips ${basePluginDir}/ultisnips
  git clone --depth 1 https://github.com/ludovicchabant/vim-gutentags ${basePluginDir}/vim-gutentags
  git clone --depth 1 https://github.com/vim-airline/vim-airline ${basePluginDir}/vim-airline

  echo "Install YouCompleteMe"
  cd ~/.vim/bundle/YouCompleteMe
  git submodule update --init --recursive
  ./install.py --tern-completer

}

main "$@"

