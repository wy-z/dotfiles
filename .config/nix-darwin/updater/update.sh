#!/usr/bin/env bash

set -e

HOMEBREW_BIN="/opt/homebrew/bin"
export PATH=$PATH:$HOMEBREW_BIN:$HOME/.local/bin

THIS_DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
PARENT_DIR=$(dirname "${THIS_DIR}")
LOG_DIR="$THIS_DIR/log"
mkdir -p "${LOG_DIR}"

http_proxy() {
	proxy="http://127.0.0.1:6152"
	export http_proxy=$proxy
	export https_proxy=$proxy
}

#
# Pip
#

PIP_PKGS=$(cat "$PARENT_DIR/pip.pkg")
PIP_LOG="$LOG_DIR/pip.log"
PIP_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple"

update_pip_pkgs() {
	export PIP_BREAK_SYSTEM_PACKAGES=1
	pip install pipdeptree -i ${PIP_MIRROR}
	# uninstall packages not in pip.pkg
	pipdeptree --json-tree | jq ".[] | .package_name" |
		xargs -I{} bash -c "echo 'pip wheel ${PIP_PKGS}' | grep -w -q {} || pipdeptree -p {} -fj | jq '.[] | .package.key' | xargs -I{} pip uninstall -y {}"
	# install/update packages
	echo "${PIP_PKGS}" | xargs -I{} pip install {} -i ${PIP_MIRROR}
}
update_pip_pkgs >"$PIP_LOG" 2>&1 &

#
# Npm
#

NPM_PKGS=$(cat "$PARENT_DIR/npm.pkg")
NPM_LOG="$LOG_DIR/npm.log"

update_npm_pkgs() {
	http_proxy
	npm list -g --json |
		jq '.dependencies | keys | .[]' |
		xargs -I{} bash -c "echo 'npm ${NPM_PKGS}' | grep -w -q {} || npm uninstall -g {}"
	echo "${NPM_PKGS}" | xargs -I{} npm install -g {}
	npm upgrade -g
}
update_npm_pkgs >"$NPM_LOG" 2>&1 &

#
# Homebrew
#

BREW_LOG="$LOG_DIR/brew.log"
update_brew_pkgs() {
	http_proxy
	brew upgrade && brew upgrade --greedy --cask
}
update_brew_pkgs >"$BREW_LOG" 2>&1 &

#
# Nvim
#

NVIM_LOG="$LOG_DIR/nvim.log"
update_nvim_pkgs() {
	lvim +LvimUpdate +qall
}
update_nvim_pkgs >"$NVIM_LOG" 2>&1 &

#
# Zsh
#

ZSH_LOG="$LOG_DIR/zsh.log"
update_zsh_pkgs() {
	http_proxy
	zsh -c "source $HOME/.zshrc && zplug update"
}
update_zsh_pkgs >"$ZSH_LOG" 2>&1 &

# wait
wait $(jobs -p)
echo "All packages updated"

# write crontab
UPDATE_SH=$THIS_DIR/update.sh
if ! crontab -l 2>/dev/null | grep -q "$UPDATE_SH"; then
	crontab -l 2>/dev/null | {
		cat
		echo "0 */6 * * * \"$THIS_DIR/update.sh\""
	} | crontab -
	echo "Crontab has written"
fi
