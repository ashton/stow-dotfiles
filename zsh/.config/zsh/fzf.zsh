# ============================
# FZF
# ===========================
#

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type file --hidden --strip-cwd-prefix'
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --color=always {}' --color=bg+:#212733,bg:#1f2430,spinner:#ffcc66,hl:#ffcc66,fg:#cbccc6,header:#ffcc66,info:#ffa759,pointer:#ffcc66,marker:#ffcc66,fg+:#ffcc66,prompt:#707a8c,hl+:#ffcc66"
