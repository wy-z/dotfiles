# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# misc
export CLICOLOR=1
alias g=git

# zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/git", from:oh-my-zsh
zplug load

# brew
export PATH=/opt/homebrew/bin:$PATH

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
if command -v go; then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPROXY=https://goproxy.cn,direct
fi

# rust
if command -v cargo; then
    source "$HOME/.cargo/env"
    export PATH=$PATH:~/.cargo/bin
fi

# personal zshrc
if [ -f ~/.zshrc-pers ]; then
    source ~/.zshrc-pers
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
