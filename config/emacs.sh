#!/bin/bash

DIR=`pwd`
mkdir -p ~/.emacs.d
mkdir -p ~/.emacs.d/eshell
cd ~
ln -s $DIR/.emacs.d/init.el ~/.emacs.d/init.el
ln -s $DIR/.emacs.d/alias ~/.emacs.d/eshell/alias
