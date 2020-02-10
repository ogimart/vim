# My .zshrc
# Append to ~/.zshrc

# NEOVIM
alias vi='/usr/local/bin/nvim'
export PATH=~/.gem/ruby/2.3.0/bin:$PATH

# TERMINAL
export EDITOR=vi
export VISUAL=vi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# EMACS
alias em='/usr/local/bin/emacs "$@"'
alias ec='/usr/local/bin/emacsclient "$@"'
alias en='/usr/local/bin/emacs -nw "$@"'

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

# PYTHON
export VIRTUAL_ENV_DISABLE_PROMPT=

# JAVA
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export PATH=$JAVA_HOME/Contents/Home/bin:$PATH

# PROLOG
export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH
export PATH=/Users/ogi/project/builds/XSB/bin:$PATH
alias ips='java -jar /Users/ogi/project/builds/prolog-studio/interPrologStudio.jar'

# FZF
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
# export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules,vendor,target,build,out}/*"'
# "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
# Nord
export FZF_DEFAULT_OPTS='
--color fg:#D8DEE9,bg:#2E3440,hl:#EBCB8B,fg+:#D8DEE9,bg+:#2E3340,hl+:#D08770
--color pointer:#D08770,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'
# Solarized Light
# export FZF_DEFAULT_OPTS='
# --color fg:240,bg:#FDF6E3,hl:33,fg+:241,bg+:#FDF6E3,hl+:33
# --color info:33,prompt:33,pointer:166,marker:166,spinner:33'

# POSTGRESQL
export PATH="/usr/local/opt/postgresql/bin:$PATH"
# export PGDATA=/usr/local/var/postgres

# VMWARE
export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"
