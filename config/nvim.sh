#!/bin/bash

DIR=`pwd`

### NeoVim & Plug Config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### Link nvim
cd ~
ln -s $DIR/nvim ~/.config/nvim

### Install plugins
nvim +'silent! colorscheme' +'PlugInstall --sync' +qa
