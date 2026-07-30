alias cfg="dotbare"
alias cfgs="dotbare fstat"
alias cat="bat"
alias vim="nvim"
alias v="vim"
alias hc="hyprctl"
alias bundlepkg="yay -Qqe > $DOT/system-packages/.packages"

# yay aliases
alias ys="yay" # search for term
alias yi="yay -S" # install package
alias yr="yay -Rns" # remove package
alias yu="yay -Sua" # upgrade packages
alias yc="yay -Yc" # cleanup packages


# stow aliases
alias cfad="stow -vt ~"
alias cfrm="stow -vDt ~"
alias cfre="stow -vRt ~"

# suffix aliases
alias -s json="jless"
alias -s md="glow"

# global aliases
alias -g JQ="| jq"
alias -g CP="| wl-copy"

# directory aliases
hash -d df=~/dev/dotfiles
hash -d nv=~/.config/nvim

# ls aliases
alias lla="eza --all --long --group-directories-first --icons=always"
alias ls="eza --grid --group-directories-first --icons=always"
alias ll="eza --long --group-directories-first --icons=always"
alias la="eza --all --grid --group-directories-first --icons=always"

# ssh connections
alias vpc="TERM=xterm-256color ssh john@matheusashton.cloud"
