{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    envExtra = ''
    if [ "$(uname)" = 'Darwin' ]; then
      export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
    fi
    '';

    initContent = ''
    alias "$"=""
    alias "vi"="nvim"
    alias "cd.."="cd .."x
    alias rmtmp='rm -rf ~/tmp/*'

    alias mkcd='(){mkdir -p "$1" && cd "$1"}' # mkdirしてcd
    alias grep='grep --color=auto' # grepに色をつける
    alias nix-zsh='nix-shell --run "/bin/zsh -l" -p' # nixパッケージを入れた状態でシェルを開く
    alias ll='ls -alF'

    alias home-apply="home-manager switch --flake ./"
    alias home-update="(){nix flake update --flake ./&& home-manager switch --flake ./}"
    alias home-clean="nix-collect-garbage -d"

    function _ghq() {
    if [[ "$1" == "checkout" ]]; then
        local branch=$(git branch | sed 's/^[ \*]*//' | peco --query "$2" --prompt "branch> ")
        if [[ -n "$branch" ]]; then
        git checkout "$branch"
        fi
    elif [[ "$1" == "clone" || "$1" == "list" || "$1" == "rm" || "$1" == "root" || "$1" == "create" ]]; then
        command ghq "$@"
    else
        local selected=$(ghq list | peco --query "$1" --prompt "repo> ")
        if [[ -n "$selected" ]]; then
        cd "$(ghq root)/$selected"
        fi
    fi
    }
    alias ghq="_ghq"
    echo -e Welcome to "\033[1;31m`hostname`\033[0;39m", it\'s "\033[1;32m`date "+%Y/%m/%d"`\033[0;39m" 
    '';
  };
}