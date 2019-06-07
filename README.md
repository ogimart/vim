# .vimrc

My Vim 8.1 Configuration

## Description

  vim, tmux, fzf, ripgrep
  Clojure, ClojueScript, Python, Go

## Dependencies

[tmux](https://github.com/tmux/tmux)
[fzf](https://github.com/junegunn/fzf)
[ripgrep](https://github.com/BurntSushi/ripgrep)

## Config

#### zsh

Add my `zshrc.sh` to `~/.zshrc`:

  ```bash
  source ~/path-to-devenv/zshrc.sh
  ```

#### tmux

Link `~/.tmux.conf` to my `tmux.conf`:

  ```bash
  ./config-tmux.sh
  ```

#### vim

Install vim plugins and link `~/.vimrc` to my `vimrc.vim`:

  ```bash
  ./config-vim.sh
  ```

## Fonts

[Source Code Pro](https://github.com/adobe-fonts/source-code-pro)

## Color Schemes

[iTerm2 Nord](https://github.com/arcticicestudio/nord-iterm2)
[Vim Nord](https://github.com/arcticicestudio/nord-vim)
