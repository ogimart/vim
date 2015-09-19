#!/bin/bash

DIR=`pwd`

### VIM PATHOGEN
mkdir -p .vim/autoload .vim/bundle && \
curl -LSso .vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


### GIT CLONE PLUGINS
cd .vim/bundle

# General
git clone git://github.com/ctrlpvim/ctrlp.vim.git
git clone git://github.com/bling/vim-airline.git
git clone git://github.com/tpope/vim-surround.git
git clone git://github.com/ervandew/supertab.git
git clone git://github.com/rking/ag.vim.git

# Git
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/airblade/vim-gitgutter.git

# Clojure
git clone git://github.com/tpope/vim-fireplace.git
git clone git://github.com/guns/vim-clojure-static.git
git clone git://github.com/guns/vim-clojure-highlight.git

# Python
git clone git://github.com/klen/python-mode.git
git clone git://github.com/davidhalter/jedi-vim.git

# SQL
git clone git://github.com/vim-scripts/dbext.vim.git

# Color Schemes
git clone git://github.com/w0ng/vim-hybrid.git

### LINK
cd ~
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.vim ~/.vim
