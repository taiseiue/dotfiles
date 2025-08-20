#!/bin/sh

export DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"

sed -i '/source \$DOTFILES_ROOT\/common\/zsh\/\.zshrc/d' ~/.zshrc
sed -i '/source \$DOTFILES_ROOT\/common\/zsh\/\.zshenv/d' ~/.zshenv

rm -f ~/.config/git
git config --global --unset core.excludesfile

# 環境ごとの設定を読み込む
if [ "$(uname)" = 'Darwin' ]; then
  source "$DOTFILES_ROOT/darwin/uninstall.sh"
fi

echo "Uninstallation completed."
