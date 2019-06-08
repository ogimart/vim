#!/bin/bash

DIR=`pwd`

cd ~
ln -s $DIR/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
