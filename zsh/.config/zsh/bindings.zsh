bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

replace_command() {
  # Obtém o último comando do histórico
  local last_cmd=$history[$((HISTCMD-1))]
  
  # Verifica se o histórico não está vazio
  if [[ -n "$last_cmd" ]]; then
    # Remove a primeira palavra do comando anterior
    local rest="${last_cmd#* }"
    
    # Altera o buffer atual e move o cursor para o final
    BUFFER=" $rest"
    CURSOR=0
  fi
}

# Registra a função como um widget do ZLE
zle -N replace_command

# Define o atalho de teclado (exemplo: Ctrl + G)
bindkey '^g' replace_command
