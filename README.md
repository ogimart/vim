# My Development Environment

## Description

Most of my development is done in Clojure, ClojureScript, Python, and Go on
MacOS, Debian, Alpine, and Amazon Linux. I occasionally use Emacs and JetBrain
products, but I find that combination of vim, tmux, zsh, and other unix command
line utilities is the most efficient for my workflow. This repository contains
my "dot files".

## Dependencies

  [tmux](https://github.com/tmux/tmux)  
  [fzf](https://github.com/junegunn/fzf)  
  [ripgrep](https://github.com/BurntSushi/ripgrep)

## Config

#### vim

Install vim plugins and link `~/.vimrc` to my `.vimrc`:

  ```bash
  ./config/vim.sh
  ```

#### tmux

Link `~/.tmux.conf` to my `.tmux.conf`:

  ```bash
  ./config/tmux.sh
  ```

#### zsh

Source my `.zshrc` in `~/.zshrc`:

  ```bash
  ./config/zsh.sh
  ```

## Fonts

[Source Code Pro](https://github.com/adobe-fonts/source-code-pro)

## Color Schemes

  [iTerm2 Nord](https://github.com/arcticicestudio/nord-iterm2)  
  [Vim Nord](https://github.com/arcticicestudio/nord-vim)  
