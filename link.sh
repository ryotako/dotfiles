#!/bin/bash

path="$(cd $(dirname $0) && pwd)"
for file in $(find "$path" -maxdepth 1 -type f -name '.*' ! -name '.' )
do
  file=$(basename $file)
  echo "ln -sf $path/$file $HOME/$file"
  ln -sf "$path/$file" "$HOME/$file"
done

