#!/bin/bash

DIR=`pwd`
mkdir -p ~/.emacs.d
mkdir -p ~/.emacs.d/eshell
cd ~
ln -s $DIR/init.el ~/.emacs.d/init.el
ln -s $DIR/eshell/alias ~/.emacs.d/eshell/alias
