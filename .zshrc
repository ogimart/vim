# My .zshrc
# Append to ~/.zshrc

# NEOVIM
# alias vi='/usr/local/bin/nvim'
# export PATH=~/.gem/ruby/2.3.0/bin:$PATH

# VSCODE
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# VMWARE
export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"

# EMACS
alias em='/usr/local/bin/emacs "$@"'
alias ec='/usr/local/bin/emacsclient "$@"'
alias en='/usr/local/bin/emacs -nw "$@"'

# COMMON LISP
alias swank='sbcl --load /Users/ogi/.local/share/nvim/plugged/slimv/slime/start-swank.lisp'
alias sbcl='rlwrap sbcl'

# GAMBIT & GERBIL SCHEME
export PATH=/usr/local/opt/gambit-scheme/current/bin:$PATH
export GERBIL_HOME=/usr/local/opt/gerbil-scheme/libexec

# GO
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# RUST
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# PYTHON
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
# eval "$(pyenv virtualenv-init -)"
# export PROJECT_HOME=~/project
# export WORKON_HOME=~/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh
# pyenv shell 3.6.7 2.7.15

# JAVA
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk11.0.2.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export PATH=$JAVA_HOME/Contents/Home/bin:$PATH

# GRAAL
# export GRAALVM_HOME=~/project/builds/graavm-ce-1.0.0-rc5/Contents/Home
# export PATH=~/project/builds/graalvm-ce-1.0.0-rc5/Contents/Home/bin:$PATH

# POSTGRESQL
export PATH="/usr/local/opt/postgresql/bin:$PATH"
# export PGDATA=/usr/local/var/postgres

# TERMINAL
export EDITOR=vim
export VISUAL=vim

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# export TERM=xterm-256color

# FZF
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
# export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules,vendor,target,build,out}/*"'
# "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
# solarized dark
export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:#002B36,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:196,marker:235'


# CTAGS
alias ctags="`brew --prefix`/bin/ctags"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
