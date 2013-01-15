#!/bin/zsh

root=`pwd`
repo="`pwd`/repo"
mkdir -p "$repo"
pkgext=""

for pkg in "$@"; do
  dir="$root/$pkg"
  [ -d "$dir" ] || continue
  cd "$dir"

  makepkg -cf && {    
    mv *.tar* "$repo"
    find . -name PKGBUILD -o -name '*.install' -prune -o -exec rm {} \;
    repo-add -f "$repo/shur.db.tar.xz" "$repo"/*.tar*
  }
done
