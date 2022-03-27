# homebrew
HOMEBREW = p"/opt/homebrew"
if HOMEBREW.exists():
    $PATH.append(f"{HOMEBREW}/bin")

# XONSH WEBCONFIG START
$PROMPT = '{BOLD_INTENSE_RED}➜ {CYAN}{cwd_base} {gitstatus}{RESET} '
xontrib load ssh_agent vox jedi
# XONSH WEBCONFIG END

# starship
execx($(starship init xonsh))

# zoxide
execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')
aliases['j'] = "z"

# misc
aliases['g'] = "git"

# fig
if p"~/.fig/bin".exists():
    $PATH.append("~/.fig/bin")
