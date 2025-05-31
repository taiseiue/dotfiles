#!/bin/sh

for file in $(find $DOTFILES_ROOT/darwin/aquaskk -type f); do
  ln -f -s "${file}" ~/"Library/Application Support/AquaSKK/$(basename ${file})"
done

ln -f -s $DOTFILES_ROOT/darwin/brewfile ~/.config/brewfile
