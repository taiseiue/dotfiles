#!/bin/sh

for file in $(find $DOTFILES_ROOT/darwin/aquaskk -type f); do
  ln -f -s "${file}" ~/"Library/Application Support/AquaSKK/$(basename ${file})"
done

ln -f -s $DOTFILES_ROOT/darwin/brewfile ~/.config/brewfile

echo -n "Would you like to import your .macos? [y/N]: "
read ANS

case $ANS in
  [Yy]* )
    source $DOTFILES_ROOT/.macos
    ;;
esac
