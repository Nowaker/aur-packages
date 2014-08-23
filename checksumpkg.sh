#!/bin/zsh

for pkg in "$@"; do
  cd "$pkg"
  makepkg -g
  cd ..
done
