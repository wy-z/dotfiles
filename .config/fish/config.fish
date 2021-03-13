# alias
alias g=git

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# direnv
direnv hook fish | source

# prompt
functions -c fish_prompt _old_fish_prompt
function fish_prompt
    if set -q VIRTUAL_ENV # python virtualenv
        echo -n -s "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
    _old_fish_prompt
end

# source fishrc
set alias_file ~/.fishrc
if test -e {$alias_file}
    source {$alias_file}
end
