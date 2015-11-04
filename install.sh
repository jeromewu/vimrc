#!/bin/bash

main(){
  timestamp=$(date +%s)
  basePluginDir=~/.vim/bundle

  echo "Backup the existing .vimrc file and .vim folder"
  mv ~/.vimrc ~/.vimrc.${timestamp}
  mv ~/.vim ~/.vim.${timestamp}

  echo "Copy new .vimrc"
  cp ./.vimrc ~/.vimrc

  echo "Install pathogen.vim"
  mkdir -p ~/.vim/autoload ${basePluginDir}
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  echo "Install plugins"
  git clone https://github.com/nanotech/jellybeans.vim ${basePluginDir}/jellybeans.vim
  git clone https://github.com/scrooloose/nerdtree ${basePluginDir}/nerdtree
  git clone https://github.com/scrooloose/syntastic ${basePluginDir}/syntastic
  git clone https://github.com/pangloss/vim-javascript ${basePluginDir}/vim-javascript
  git clone https://github.com/mxw/vim-jsx ${basePluginDir}/vim-jsx
  git clone https://github.com/Raimondi/delimitMate ${basePluginDir}/delimitMate
  git clone https://github.com/easymotion/vim-easymotion ${basePluginDir}/vim-easymotion
}

main "$@"

