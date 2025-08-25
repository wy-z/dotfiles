
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

# atuin
atuin init fish | source

# gpg
set -gx GPG_TTY (tty)

# local bin
set local_bin ~/.local/bin
if test -d $local_bin
    fish_add_path $local_bin
end

# go
if type -q go
    fish_add_path (go env GOPATH)/bin
end

# cargo
set cargo_bin ~/.cargo/bin
if test -d $cargo_bin
    fish_add_path $cargo_bin
end

# misc
alias g=git
set -x CLICOLOR 1
set -x LANG en_US.UTF-8
set -x EDITOR nvim
