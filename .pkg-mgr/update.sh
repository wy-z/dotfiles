#!/usr/bin/env bash

set -e

# Environment setup
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$PATH"
export http_proxy="http://127.0.0.1:6152" https_proxy="$http_proxy"

# Setup logging
DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
LOG="$DIR/log"
mkdir -p "$LOG"

# Update all packages in parallel
brew upgrade --all --greedy >"$LOG/brew.log" 2>&1 &
nvim +AstroUpdate +qall >"$LOG/nvim.log" 2>&1 &
fish -c "fisher update" >"$LOG/fish.log" 2>&1 &

wait && echo "All packages updated"

# Auto-schedule updates (every 6 hours)
CRON="0 */6 * * * $DIR/update.sh"
crontab -l 2>/dev/null | grep -qF "$DIR/update.sh" || {
	(crontab -l 2>/dev/null; echo "$CRON") | crontab -
	echo "Crontab updated"
}
