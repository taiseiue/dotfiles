{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      "cd.." = "cd ..";
      vi = "nvim";
      ll = "ls -alF";
      grep = "grep --color=auto";
      g = "_ghq";
      ghq = "_ghq";
    };

    bashrcExtra = ''
      mkcd() {
        mkdir -p "$1" && cd "$1"
      }

      _ghq() {
        if [[ "$1" == "checkout" ]]; then
          local branch
          branch="$(git branch | sed 's/^[ \*]*//' | fzf --query "$2" --prompt "branch> ")"
          if [[ -n "$branch" ]]; then
            git checkout "$branch"
          fi
        elif [[ "$1" == "clone" || "$1" == "list" || "$1" == "rm" || "$1" == "root" || "$1" == "create" ]]; then
          command ghq "$@"
        else
          local selected
          selected="$(ghq list | fzf --query "$1" --prompt "repo> ")"
          if [[ -n "$selected" ]]; then
            cd "$(ghq root)/$selected"
          fi
        fi
      }
      if command -v fzf >/dev/null 2>&1; then
        source <(fzf --bash)
      fi
      if [ -f "$HOME/.local.bashrc" ]; then
        source "$HOME/.local.bashrc"
      fi

      echo -e Welcome to "\033[1;31m$(hostname)\033[0;39m", it\'s "\033[1;32m$(date "+%Y/%m/%d")\033[0;39m"
    '';
  };
}
