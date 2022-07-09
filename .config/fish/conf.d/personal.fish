# alias
if type -q trash
    alias rm=trash
end
if type -q nvim
    alias v=nvim
    alias vv="neovide"
end
if type -q code
    alias c=code
end
if type -q emacsclient
    alias e="emacsclient -c -q -n -a nvim"
end
if type -q remote
    alias r=remote
end

# basic
set LANG en_US.UTF-8

# proxy
set proxy_url http://127.0.0.1:1087
set envars http_proxy HTTP_PROXY https_proxy HTTPS_PROXY ftp_proxy FTP_PROXY all_proxy ALL_PROXY
function proxy -a op
    for envar in $envars
        if test "$op" = off
            set -e $envar
        else
            set -xg $envar $proxy_url
        end
    end
end

# local bin
set local_bin ~/.local/bin
if test -d $local_bin
    set -x PATH $PATH $local_bin
end

# go
if type -q go
    set -x PATH $PATH (go env GOPATH)/bin
    set -x GOPROXY https://goproxy.cn,direct
end

# cargo
set cargo_bin ~/.cargo/bin
if test -d $cargo_bin
    set -x PATH $PATH $cargo_bin
end

# jms
alias jms="ssh -p 2222 jms.xsky.com"

# Vault
set -x VAULT_ADDR https://vault.xsky.com

# Multipass
set multipass_bin "/Users/weiyang/Library/Application Support/multipass/bin"
if test -d $multipass_bin
    set -x PATH $PATH $multipass_bin
end
