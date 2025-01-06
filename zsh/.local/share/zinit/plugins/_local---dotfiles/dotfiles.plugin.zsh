# -*- mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Copyright (c) 2025 Matheus Ashton

# According to the Zsh Plugin Standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */_dotfiles && -z ${fpath[(r)${0:h}]} ]] {
    fpath+=( "${0:h}" )
}

# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins
Plugins[DOTFILES_DIR]="${0:h}"


# Use alternate vim marks [[[ and ]]] as the original ones can
# confuse nested substitutions, e.g.: ${${${VAR}}}

# vim:ft=zsh:tw=80:sw=4:sts=4:et:foldmarker=[[[,]]]

__dotfiles_completion() {
  local context state state_descr line ret curcontext
  local -A opt_args
  ret=1
  curcontext="${curcontext}"

  local packages_dir=${DOT}

  _arguments -C \
    '1:cmds:->cmds' \
    '2:pkgs:->pkgs' \
    && ret=0

  case "${state}" in
    cmds)
      local subcommands
      subcommands=(
        'install:Creates symlinks for files defined in package'
        'rm:Removes symlinks for files defined in packages'
        'reload:Removes old symlinks and create them again syncing the files defined in package'
      )
      _describe 'command' subcommands \
        && ret=0
    ;;
    pkgs)
      _arguments '*:pkg_name:_available_packages' && ret=0
    ;;
esac

return "${ret}"
}

fn _available_packages() {
  _files -/ -W ${DOT}
}

compdef __dotfiles_completion dotfiles
export DOTFILES_EXEC="${0:A:h}/dotfiles"
alias dotfiles="$DOTFILES_EXEC"

