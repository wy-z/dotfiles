# homebrew
if test -d /opt/homebrew
    fish_add_path /opt/homebrew/bin
end

# zoxide
zoxide init fish | source
alias j=z

# direnv
if type -q direnv
    direnv hook fish | source
end

# starship
if type -q starship
    starship init fish | source
end

# ssh agent
if status is-login
    ssh-add
end

# gpg
set -gx GPG_TTY (tty)

# misc
alias g=git
