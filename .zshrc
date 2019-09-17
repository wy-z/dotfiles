# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# oh-my-zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
# else
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "desyncr/auto-ls"
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

# source plugins and add commands to $PATH
zplug load
# zplug end

# autols
AUTO_LS_COMMANDS=(ls)
AUTO_LS_NEWLINE=false
AUTO_LS_PATH=false

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source alias
alias_file=~/.zshrc_alias
if [[ -f ${alias_file} ]]; then
    source ${alias_file}
fi

# direnv
eval "$(direnv hook zsh)"
