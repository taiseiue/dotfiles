#!/bin/zsh

# --------
# Powerlevel10k
# --------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --------
# pyenv
# --------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# --------
# Alias
# --------
alias "$"=""
alias "vi"="nvim"
alias "cd.."="cd .."
alias gr='(){cd ~/source/$1}'
alias rmtmp='rm -rf ~/tmp/*'

alias mkcd='(){mkdir -p "$1" && cd "$1"}' # mkdirしてcd
alias grep='grep --color=auto' # grepに色をつける
alias nix-zsh='nix-shell --run "/bin/zsh -l" -p' # nixパッケージを入れた状態でシェルを開く
alias ll='ls -alF'

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
