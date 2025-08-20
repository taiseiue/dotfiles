#!/bin/sh

export DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "source $DOTFILES_ROOT/common/zsh/.zshrc" >> ~/.zshrc
echo "source $DOTFILES_ROOT/common/zsh/.zshenv" >> ~/.zshenv

ln -f -s "$DOTFILES_ROOT/common/git" ~/.config/git
git config --global core.excludesfile "$DOTFILES_ROOT/common/git/ignore"

# 環境ごとの設定を読み込む
if [ "$(uname)" = 'Darwin' ]; then
  source "$DOTFILES_ROOT/darwin/install.sh"
fi

# zshのコンパイル
source "$DOTFILES_ROOT/compile.zsh"

echo "Installation completed."
echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."
