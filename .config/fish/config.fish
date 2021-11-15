# alias
alias g=git

# homebrew
fish_add_path /opt/homebrew/bin

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# direnv
direnv hook fish | source

# starship
starship init fish | source

# source fishrc
set alias_file ~/.fishrc
if test -e {$alias_file}
    source {$alias_file}
end
