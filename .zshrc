# brew
export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH
# virtualenvwrapper
source /opt/homebrew/bin/virtualenvwrapper.sh

#
# Plugin
#

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/shell-proxy", from:oh-my-zsh
zplug "plugins/virtualenvwrapper", from:oh-my-zsh

# Fish-like autosuggestions for zsh
zplug "zsh-users/zsh-autosuggestions"
# ZSH port of Fish history search (up arrow)
zplug "zsh-users/zsh-history-substring-search"

# Feature-rich syntax highlighting for ZSH
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2

# Then, source plugins and add commands to $PATH
zplug load

#
# Config
#

# misc
export CLICOLOR=1
export LANG=en_US.UTF-8
export EDITOR=nvim
alias g=git


# starship
eval "$(starship init zsh)"

# atuin
eval "$(atuin init zsh)"

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


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/nomad nomad
