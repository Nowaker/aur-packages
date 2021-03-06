#!/bin/zsh

package="$1"

if [ -z "$package" ]; then
  echo "Usage: $0 package"
  exit 1
fi

wget -c "https://aur.archlinux.org/cgit/aur.git/snapshot/${package}.tar.gz"
tar -xf "$package.tar.gz"
rm "$package.tar.gz"
