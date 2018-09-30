# antigen
source /usr/local/share/antigen/antigen.zsh

# oh-my-zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle autojump
antigen theme robbyrussell
# else
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle desyncr/auto-ls

antigen apply
# antigen end

# autols
AUTO_LS_COMMANDS=(ls)
AUTO_LS_NEWLINE=false
AUTO_LS_PATH=false

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source alias
alias_file="~/.zshrc_alias"
if [[ -f ${alias_file} ]]; then
    source ${alias_file}
fi

