#!/bin/zsh

if type brew &>/dev/null; then
  BREW_PREFIX=$(brew --prefix)
  # --------
  # Completions and autosuggestions
  # --------
  FPATH=${BREW_PREFIX}/share/zsh-completions:$FPATH
  source ${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit

  # --------
  # Brewfile
  # --------
  # if [ -f ${BREW_PREFIX}/etc/brew-wrap ];then
  #   source ${BREW_PREFIX}/etc/brew-wrap
  # fi
fi

# --------
# iTerm2 integration
# --------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
