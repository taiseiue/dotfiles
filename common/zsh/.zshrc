#!/bin/zsh

# --------
# pyenv
# --------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  pyenv() {
    unset -f pyenv
    eval "$($PYENV_ROOT/bin/pyenv init -)"
    pyenv "$@"
  }
fi

# --------
# Alias
# --------
alias "$"=""
alias "vi"="nvim"
alias "cd.."="cd .."x
alias rmtmp='rm -rf ~/tmp/*'

alias mkcd='(){mkdir -p "$1" && cd "$1"}' # mkdirしてcd
alias grep='grep --color=auto' # grepに色をつける
alias nix-zsh='nix-shell --run "/bin/zsh -l" -p' # nixパッケージを入れた状態でシェルを開く
alias ll='ls -alF'

alias home-apply="home-manager switch --flake $(dirname $0)/../../home-manager/"
alias home-update="(){cd $(dirname $0)/../../home-manager && nix flake update --flake ./&& home-manager switch --flake ./}"
alias home-edit="nvim $(dirname $0)/../../home-manager/"
alias home-clean="nix-collect-garbage -d"

# --------
# Functions
# --------
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
alias ghq="_ghq"

# --------
# Zsh Options
# --------
setopt auto_cd              # ディレクトリ名を入力するだけでcdする
setopt extended_glob        # 拡張グロブを有効にする
setopt hist_ignore_dups     # ヒストリで重複するコマンドを無視する
setopt share_history        # ヒストリを共有する
setopt transient_rprompt    # 右側プロンプトをコピーしないようにする
setopt hist_ignore_space    # スペースで始まるコマンドをヒストリに保存しない

# 環境ごとの設定を読み込む
if [ "$(uname)" = 'Darwin' ]; then
  source "$DOTFILES_ROOT/darwin/zsh/.zshrc"
fi
