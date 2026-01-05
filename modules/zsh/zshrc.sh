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
      local selected=$(ghq list | fzf --query "$1" --prompt "repo> ")
      if [[ -n "$selected" ]]; then
      cd "$(ghq root)/$selected"
      fi
  fi
}

bindkey "^g" _ghq

source <(fzf --zsh)

if [ -f "$HOME/.local.zshrc" ]; then
  source "$HOME/.local.zshrc"
fi
echo -e Welcome to "\033[1;31m`hostname`\033[0;39m", it\'s "\033[1;32m`date "+%Y/%m/%d"`\033[0;39m" 
