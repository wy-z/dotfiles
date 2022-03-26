import shutil

# basic
$LANG = "en_US.UTF-8"

# trash
if $(which trash):
    aliases["rm"] = "trash"

# nvim
if $(which nvim):
    aliases["v"] = "nvim"

# vscode
if $(which code):
    aliases["c"] = "code"

# gpg
$GPG_TTY = $(tty).strip()

# go
if $(which go):
    $PATH.append($(go env GOPATH) + "/bin")
    $GOPROXY = "https://goproxy.cn,direct"

# bin paths
bin_paths = [p"~/.local/bin", p"/Users/weiyang/Library/Application Support/multipass/bin"]
for p in bin_paths:
    if p.exists():
        $PATH.append(p)

# jms
aliases["jms"] = "ssh -p 2222 jms.xsky.com"

# Vault
$VAULT_ADDR = "https://vault.xsky.com"
