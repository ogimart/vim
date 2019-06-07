#!/bin/bash

DIR=`pwd`

### Vim & Plug Config
mkdir -p ~/.vim/autoload ~/.vim/config && \
curl -LSso ~/.vim/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### Link .vimrc
cd ~
ln -s $DIR/.vimrc ~/.vimrc

### Install plugins
vim +PlugInstall +qall
# vim +'PlugInstall --sync' +qa
