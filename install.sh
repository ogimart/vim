#!/bin/bash

DIR=`pwd`

### VIM & PLUG CONFIG
mkdir -p vim/autoload vim/config && \
touch vim/config/dbextprofile.vim && \
curl -LSso vim/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### LINK
cd ~
ln -s $DIR/vimrc.vim ~/.vimrc
ln -s $DIR/vim ~/.vim
