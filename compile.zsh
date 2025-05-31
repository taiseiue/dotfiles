#!/bin/zsh

pushd $(dirname $0) > /dev/null # カレントディレクトリをリポジトリのルートにする

for file in $(find ./*/zsh -type f -not -name '*zwc'); do
  echo "Compiling $file"
  zcompile "${file}"
done

popd > /dev/null
