### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit wait'!' lucid for \
    OMZL::git.zsh \
    OMZL::theme-and-appearance.zsh \
    OMZT::robbyrussell
zinit wait lucid for \
    OMZL::history.zsh \
    OMZP::autojump \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-history-substring-search \
    MichaelAquilina/zsh-autoswitch-virtualenv \
    atinit"zicompinit; zicdreplay"  \
        zdharma/fast-syntax-highlighting \
    atload"zicompinit; zicdreplay" blockf zsh-users/zsh-completions

# alias
alias g=git
alias ls="ls -G"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f'
fi

# source alias
alias_file=~/.zshrc_alias
if [[ -f ${alias_file} ]]; then
    source ${alias_file}
fi
