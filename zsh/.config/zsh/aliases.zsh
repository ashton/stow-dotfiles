alias cat="bat"
alias grep="rg --color=auto"
alias vim="nvim"
alias v="vim"
alias df="df -h"
alias bundlepkg="brew bundle dump --force --file $DOT/homebrew/.config/homebrew/Brewfile --formulae --cask --taps"
alias sf="spf --config-file $XDG_CONFIG_HOME/superfile/config.toml --hotkey-file $XDG_CONFIG_HOME/superfile/hotkeys.toml"
alias hss="herdr server stop"
alias lg="lazygit"

# stow aliases
alias cfg-add="stow -vt ~"
alias cfg-rm="stow -vDt ~"
alias cfg-reload="stow -vRt ~"

# suffix aliases
alias -s zsh="$EDITOR"
alias -s toml="$EDITOR"
alias -s config="$EDITOR"
alias -s lua="$EDITOR"
alias -s rc="$EDITOR"
alias -s md="glow"
alias -s json="jless"
alias -s yml="bat -l yaml"
alias -s yaml="bat -l yaml"

# global aliases
alias -g JQ="| jq"
alias -g CP="| pbcopy"

# directory aliases
hash -d df=~/dev/dotfiles
hash -d cf=~/.config
hash -d nv=~/.config/nvim

# ls aliases
alias lla="eza --all --long --group-directories-first --icons=always"
alias ls="eza --grid --group-directories-first --icons=always"
alias ll="eza --long --group-directories-first --icons=always"
alias la="eza --all --grid --group-directories-first --icons=always"
alias tree="eza --all --tree --icons=always"
