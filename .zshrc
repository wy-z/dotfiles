# brew
export PATH=/opt/homebrew/bin:$PATH

#
# Plugin
#

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/shell-proxy", from:oh-my-zsh

# Fish-like autosuggestions for zsh
zplug "zsh-users/zsh-autosuggestions"

# Feature-rich syntax highlighting for ZSH
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2

# 🐍 ZSH plugin to automatically switch python virtualenvs (including pipenv and poetry) as you move between directories
zplug "MichaelAquilina/zsh-autoswitch-virtualenv", defer:3

# Then, source plugins and add commands to $PATH
zplug load

#
# Config
#

# misc
export CLICOLOR=1
export LANG=en_US.UTF-8
alias g=git

# starship
eval "$(starship init zsh)"

# atuin
eval "$(atuin init zsh --disable-up-arrow)"

# zoxide
eval "$(zoxide init zsh)"
alias j=z

# direnv
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# go
if command -v go &> /dev/null; then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPROXY=https://goproxy.cn,direct
fi

# rust
if command -v cargo &> /dev/null; then
    source "$HOME/.cargo/env"
    export PATH=$PATH:~/.cargo/bin
fi

# personal zshrc
export PATH=~/.local/bin:$PATH
if [ -f ~/.zshrc-pers ]; then
    source ~/.zshrc-pers
fi

