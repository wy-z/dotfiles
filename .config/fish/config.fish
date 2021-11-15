# alias
alias g=git

# homebrew
if test -d /opt/homebrew
    fish_add_path /opt/homebrew/bin
end

# autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

# direnv
if type -q direnv
    direnv hook fish | source
end

# starship
if type -q starship
    starship init fish | source
end

# source fishrc
set alias_file ~/.fishrc
if test -e {$alias_file}
    source {$alias_file}
end
