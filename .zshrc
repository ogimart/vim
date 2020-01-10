# My .zshrc
# Append to ~/.zshrc

# COLOR SCHEME
export SCHEME=dark

# NEOVIM
alias vi='/usr/local/bin/nvim'
export PATH=~/.gem/ruby/2.3.0/bin:$PATH

# TERMINAL
export EDITOR=vi
export VISUAL=vi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# export TERM=xterm-256color

# EMACS
alias em='/usr/local/bin/emacs "$@"'
alias ec='/usr/local/bin/emacsclient "$@"'
alias en='/usr/local/bin/emacs -nw "$@"'

# JAVA
# export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export PATH=$JAVA_HOME/Contents/Home/bin:$PATH

# LISP
alias sbcl='rlwrap /usr/local/bin/sbcl "$@"'

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# GO
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# FZF
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
# export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules,vendor,target,build,out}/*"'
# "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
if [ "$SCHEME" = "dark" ]; then
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#e6d4a3,bg:#1d2021,hl:#7db669
  --color=fg+:#e6d4a3,bg+:#1d2021,hl+:#f7b125
  --color=info:#e6d4a3,prompt:#f73028,pointer:#f7b125
  --color=marker:#7db669,spinner:#f7b125,header:#719586'
else
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#3d3836,bg:#f9f5d7,hl:#7db669
  --color=fg+:#3d3836,bg+:#f9f5d7,hl+:#f7b125
  --color=info:#3d3836,prompt:#890009,pointer:#f7b125
  --color=marker:#7db669,spinner:#f7b125,header:#719586'
fi

# POSTGRESQL
export PATH="/usr/local/opt/postgresql/bin:$PATH"
# export PGDATA=/usr/local/var/postgres

# VMWARE
export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"

# ITERM2
# it2prof() { echo -ne "\033]50;SetProfile=$1\a" }

# FZF THEMES
  # Nord Theme
  # export FZF_DEFAULT_OPTS='
  # --color fg:#D8DEE9,bg:#2E3440,hl:#EBCB8B,fg+:#D8DEE9,bg+:#2E3340,hl+:#D08770
  # --color pointer:#D08770,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'
  # Ayu Dark Theme
  # export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  # --color=fg:#e6e1cf,bg:#0f1419,hl:#ffec88
  # --color=fg+:#ffffff,bg+:#0f1419,hl+:#36A3D9
  # --color=info:#c7c7c7,prompt:#fc6028,pointer:#ffee99
  # --color=marker:#cbe645,spinner:#c7c7c7,header:#c7c7c7'
  # Ayu Mirage Theme
  # export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  # --color=fg:#e6e1cf,bg:#212733,hl:#bae67e
  # --color=fg+:#ffffff,bg+:#212733,hl+:#ffcc66
  # --color=info:#c7c7c7,prompt:#f07178,pointer:#ffcc66
  # --color=marker:#bae67e,spinner:#c7c7c7,header:#c7c7c7'
  # Solarized Light
  # export FZF_DEFAULT_OPTS='
  # --color fg:#657B83,bg:#FDF6E3,hl:#268BD2,fg+:#586E75,bg+:#FDF6E3,hl+:#2AA198
  # --color info:#268BD2,prompt:#268BD2,pointer:166,marker:166,spinner:#268BD2'

