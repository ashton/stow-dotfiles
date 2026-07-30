alias cat="bat"
alias grep="rg --color=auto"
alias vim="nvim"
alias v="vim"
alias df="df -h"
alias hc="hyprctl"
alias hr="herdr"
alias bundlepkg="yay -Qqe > $DOT/system-packages/.packages"
alias sf="spf --config-file $XDG_CONFIG_HOME/superfile/config.toml --hotkey-file $XDG_CONFIG_HOME/superfile/hotkeys.toml"
alias hss="herdr server stop"
alias lg="lazygit"

# yay aliases
alias ys="yay -Ss" # search for term
alias yi="yay -S" # install package
alias yr="yay -Rns" # remove package
alias yu="yay -Sua" # upgrade packages
alias yc="yay -Yc" # cleanup packages
alias ycc="yay -Scc" # clean cache
alias yh="yay -Ps" # system health


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
