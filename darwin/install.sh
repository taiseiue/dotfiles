#!/bin/sh

for file in $(find $DOTFILES_ROOT/darwin/aquaskk -type f); do
  ln -s "${file}" ~/"Library/Application Support/AquaSKK/$(basename ${file})"
done

ln -s $DOTFILES_ROOT/darwin/brewfile ~/.config/brewfile
