# XDG base variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export MANPAGER="bat -plman"
export EDITOR="nvim"
export VISUAL="nvim"
export GPG_TTY=$(tty)
export PATH="$PATH:$HOME/.dotnet/tools:$HOME/.config/emacs/bin/:$GOPATH/bin:$HOME/.local/bin"

export GOPATH="$HOME/go"
export NVM_DIR="$HOME/.nvm"
#export FZF_DEFAULT_COMMAND='rg'
export DOT="$HOME/dev/dotfiles"
export STOW_DIR=$DOT
