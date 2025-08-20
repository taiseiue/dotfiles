#!/bin/sh

for file in $(find $DOTFILES_ROOT/darwin/aquaskk -type f); do
  rm -f ~/"Library/Application Support/AquaSKK/$(basename ${file})"
done

rm -f ~/.config/brewfile
