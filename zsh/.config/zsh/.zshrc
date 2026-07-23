[[ -f ~/.secrets ]] && source ~/.secrets

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

# History Options
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive match

bindkey -e

zinit wait lucid for        \
  Valiev/almostontop        \
  kiurchv/asdf.plugin.zsh   \
  agkozak/zsh-z             \
  Tarrasch/zsh-bd           \
  reegnz/jq-zsh-plugin      \
  OMZP::colored-man-pages   \
  OMZP::fancy-ctrl-z        \
  OMZP::git-auto-fetch

zinit ice blockf atpull"zinit creinstall -q ."
zinit snippet "https://github.com/technomancy/leiningen/blob/master/zsh_completion.zsh"

zinit ice wait lucid atinit"zicompinit; zicdreplay" blockf atpull"zinit creinstall -q ."
zinit light zsh-users/zsh-completions

zinit ice wait lucid atinit"zicompinit; zicdreplay" blockf atpull"zinit creinstall -q ."
zinit light z-shell/fast-syntax-highlighting

zinit load zsh-users/zsh-history-substring-search

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit load trapd00r/LS_COLORS

zi ice has'eza' atinit'AUTOCD=1'
zi light z-shell/zsh-eza

zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice as"command" from"gh-r" atclone"./navi widget zsh > navi-widget.zsh" \
  atpull"%atclone" pick"navi" src"navi-widget.zsh"
zinit load denisidoro/navi

zinit ice as"program" pick"bin/git-dsf"
zinit light z-shell/zsh-diff-so-fancy

zinit ice from'gh-r' as'program'
zinit light decayofmind/zsh-fast-alias-tips

zinit light wintermi/zsh-mise
zinit load atuinsh/atuin

zinit cdreplay -q

### inits
#. "$HOME/.cargo/env"
FZF_CTRL_R_COMMAND= source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(~/.local/bin/mise activate zsh)"
[[ -f ~/.ifoodrc ]] && source ~/.ifoodrc

### Bindings
source "$ZDOTDIR/bindings.zsh"

### Aliases
source "$ZDOTDIR/aliases.zsh"

### FZF
source "$ZDOTDIR/fzf.zsh"


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/matheus.ashton/.opam/opam-init/init.zsh' ]] || source '/Users/matheus.ashton/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
