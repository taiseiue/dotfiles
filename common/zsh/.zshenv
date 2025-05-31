#!/bin/zsh

# dotfilesのルート
export DOTFILES_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

# 環境ごとの設定を読み込む
if [ "$(uname)" = 'Darwin' ]; then
  source "$DOTFILES_ROOT/darwin/zsh/.zshenv"
fi
