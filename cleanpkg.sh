#!/bin/zsh

set -e

for pkg in "$@"; do
  pushd .
  cd "$pkg"
  git clean -df .
  popd
done

