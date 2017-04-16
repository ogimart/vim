#!/bin/bash

DIR=`pwd`

### VIM PATHOGEN
mkdir -p .vim/autoload .vim/bundle && \
curl -LSso .vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### GIT CLONE PLUGINS
cd .vim/bundle
# General
git clone git://github.com/ctrlpvim/ctrlp.vim.git
git clone git://github.com/tpope/vim-surround.git
git clone git://github.com/ervandew/supertab.git
git clone git://github.com/mhinz/vim-grepper.git
git clone git://github.com/skywind3000/asyncrun.vim
# Git
git clone git://github.com/tpope/vim-fugitive.git
# Common Lisp
git clone git://github.com/kovisoft/slimv.git
# Clojure
git clone git://github.com/tpope/vim-fireplace.git
git clone git://github.com/guns/vim-clojure-static.git
git clone git://github.com/guns/vim-clojure-highlight.git
# Python
git clone git://github.com/klen/python-mode.git
git clone git://github.com/davidhalter/jedi-vim.git
git clone git://github.com/w0rp/ale.git
# SQL
git clone git://github.com/vim-scripts/dbext.vim.git
# Airline & Color Schemes
git clone git://github.com/w0ng/vim-hybrid.git
git clone git://github.com/bling/vim-airline.git
git clone git://github.com/vim-airline/vim-airline-themes.git

### SQL Config file
mkdir -p .vim/config
touch .vim/config/dbextprofile.vim

### LINK
cd ~
ln -s $DIR/vimrc.vim ~/.vimrc
ln -s $DIR/.vim ~/.vim
