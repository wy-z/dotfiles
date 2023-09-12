# path
export PATH=/opt/homebrew/bin:$PATH

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# fzf-tab
zinit wait lucid atinit="zpcompinit; zpcdreplay" light-mode for Aloxaf/fzf-tab

# plugins loaded without investigating.
zinit light-mode for \
    zsh-users/zsh-autosuggestions
zinit wait lucid light-mode for \
    zdharma-continuum/fast-syntax-highlighting \
    MichaelAquilina/zsh-autoswitch-virtualenv

# OMZ
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZP::ssh-agent
zinit ice svn
zinit snippet OMZP::shell-proxy

### End of Zinit's installer chunk

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
