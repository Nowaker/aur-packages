#!/bin/zsh

root=`pwd`
repo="`pwd`/repo"
mkdir -p "$repo"
pkgext=""

for pkg in "$@"; do
  dir="$root/$pkg"
  [ -d "$dir" ] || continue
  cd "$dir"

  makepkg -c && {    
    mv *.tar* "$repo"
    find . -name PKGBUILD -prune -o -exec rm {} \;
  }
done

repo-add -f "$repo/shur.db.tar.xz" "$repo"/*.tar*
