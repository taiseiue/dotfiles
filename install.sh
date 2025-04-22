#!/bin/sh

ln -s $(pwd)/aquaskk ~/.config/aquaskk
ln -s $(pwd)/brewfile ~/.config/brewfile
ln -s $(pwd)/git ~/.config/git

ln -s $(pwd)/zsh/.zshrc ~/.zshrc
ln -s $(pwd)/zsh/.zshenv ~/.zshenv

git config --global core.excludesfile ~/.config/git/gitignore 
