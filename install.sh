#!/bin/bash

DIR=`pwd`

### VIM & PATHOGEN CONFIG
mkdir -p .vim/autoload .vim/bundle .vim/config && \
touch .vim/config/dbextprofile.vim && \
curl -LSso .vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### GIT CLONE PLUGINS
cd .vim/bundle

# Search
git clone git://github.com/ctrlpvim/ctrlp.vim.git
git clone git://github.com/mhinz/vim-grepper.git

### External Async Processes
git clone git://github.com/skywind3000/asyncrun.vim
git clone git://github.com/w0rp/ale.git

### Editing & Completion
git clone git://github.com/tpope/vim-surround.git
git clone git://github.com/ervandew/supertab.git

# Git & Projects
git clone git://github.com/tpope/vim-fugitive.git
got clone git://github.com/airblade/vim-rooter.git

# Clojure & Common Lisp
git clone git://github.com/tpope/vim-fireplace.git
git clone git://github.com/guns/vim-clojure-static.git
git clone git://github.com/guns/vim-clojure-highlight.git
git clone git://github.com/kovisoft/slimv.git

# Python
git clone git://github.com/klen/python-mode.git
git clone git://github.com/davidhalter/jedi-vim.git

# SQL
git clone git://github.com/vim-scripts/dbext.vim.git

# Airline & Color Schemes
git clone git://github.com/w0ng/vim-hybrid.git
git clone git://github.com/vim-airline/vim-airline.git
git clone git://github.com/vim-airline/vim-airline-themes.git

### LINK
cd ~
ln -s $DIR/vimrc.vim ~/.vimrc
ln -s $DIR/.vim ~/.vim
