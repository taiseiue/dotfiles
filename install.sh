#!/bin/sh

ln -s $(pwd)/brewfile ~/.config/brewfile
ln -s $(pwd)/git ~/.config/git

ln -s $(pwd)/zsh/.zshrc ~/.zshrc
ln -s $(pwd)/zsh/.zshenv ~/.zshenv

for file in $(pwd)/aquaskk/*; do
  ln -s "${file}" ~/"Library/Application Support/AquaSKK/$(basename ${file})"
done

git config --global core.excludesfile ~/.config/git/gitignore
