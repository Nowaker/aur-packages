#!/bin/zsh

root=`pwd`
repo="`pwd`/repo"
mkdir -p "$repo"
pkgext=""

for pkg in "$@"; do
  dir="$root/$pkg"
  [ -d "$dir" ] || continue
  cd "$dir"

  git add .
  makepkg -cfS && {    
    burp *.tar*
  }
  git clean -df
done
