#!/bin/bash

DIR=`pwd`

### Vim & Plug Config
mkdir -p vim/autoload vim/config && \
touch vim/config/dbextprofile.vim && \
curl -LSso vim/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### Link .vimrc and .vim
cd ~
ln -s $DIR/vimrc.vim ~/.vimrc
ln -s $DIR/vim ~/.vim

### Install plugins
vim +PlugInstall +qall
# vim +'PlugInstall --sync' +qa
