alias cat="bat"
alias grep="rg --color=auto"
alias vim="nvim"
alias v="vim"
alias df="df -h"
alias hc="hyprctl"
alias hr="herdr"
alias bundlepkg="sudo dnf repoquery --userinstalled --qf \"%{NAME}\" > $DOT/system-packages/.packages"
alias sf="spf --config-file $XDG_CONFIG_HOME/superfile/config.toml --hotkey-file $XDG_CONFIG_HOME/superfile/hotkeys.toml"
alias hss="herdr server stop"
alias lg="lazygit"

# DNF aliases
alias dni="sudo dnf install"
alias dnin="sudo dnf info"
alias dnl="sudo dnf list --installed"
alias dnr="sudo dnf remove"
alias dnu="sudo dnf upgrade"
alias dns="sudo dnf search"

# stow aliases
alias cfadd="stow -vt $HOME"
alias cfrem="stow -vDt $HOME"
alias cfrel="stow -vRt $HOME"

# suffix aliases
alias -s zsh="$EDITOR"
alias -s toml="$EDITOR"
alias -s config="$EDITOR"
alias -s lua="$EDITOR"
alias -s rc="$EDITOR"
alias -s json="jless"
alias -s md="glow"
alias -s yml="bat -l yaml"
alias -s yaml="bat -l yaml"

# global aliases
alias -g JQ="| jq"
alias -g CP="| wl-copy"

# directory aliases
hash -d df=~/dev/dotfiles
hash -d cf=~/.config
hash -d nv=~/.config/nvim
hash -d z=~/.config/zsh

# ls aliases
alias lla="eza --all --long --group-directories-first --icons=always"
alias ls="eza --grid --group-directories-first --icons=always"
alias ll="eza --long --group-directories-first --icons=always"
alias la="eza --all --grid --group-directories-first --icons=always"

# ssh connections
alias vpc="TERM=xterm-256color ssh vpc"
alias hvpc="herdr --remote vpc"
