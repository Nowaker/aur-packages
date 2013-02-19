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
  makepkg -cf && {    
    mv *.pkg.tar* "$repo"
    repo-add -f "$repo/shur.db.tar.xz" "$repo"/*.pkg.tar*
  }
  git clean -df
done
