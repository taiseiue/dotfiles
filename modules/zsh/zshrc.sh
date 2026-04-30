function mkcd() {
  mkdir -p "$1" && cd "$1"
}
function _ghq() {
  if [[ "$1" == "checkout" ]]; then
      local branch=$(git branch | sed 's/^[ \*]*//' | fzf --query "$2" --prompt "branch> ")
      if [[ -n "$branch" ]]; then
          git checkout "$branch"
      fi
  elif [[ "$1" == "clone" || "$1" == "list" || "$1" == "rm" || "$1" == "root" || "$1" == "create" ]]; then
      command ghq "$@"
  else
      local candidates=$(command ghq list | grep -i "${1:-}")
      local count=$(echo "$candidates" | grep -c .)
      if [[ "$count" -eq 1 ]]; then
          cd "$(command ghq root)/$candidates"
      elif [[ "$count" -gt 1 ]]; then
          local selected=$(echo "$candidates" | fzf --query "$1" --prompt "repo> ")
          if [[ -n "$selected" ]]; then
              cd "$(command ghq root)/$selected"
          fi
      else
          echo "No matching repository found."
      fi
  fi
}

bindkey -e
zle -N _ghq
bindkey "^g" _ghq

source <(fzf --zsh)

if [ -f "$HOME/.local.zshrc" ]; then
  source "$HOME/.local.zshrc"
fi
echo -e Welcome to "\033[1;31m`hostname`\033[0;39m", it\'s "\033[1;32m`date "+%Y/%m/%d"`\033[0;39m" 
