#!/bin/zsh

loc='www@geozone.pl:/home/www/shur.atlashost.eu/'
for pkg in "$@"; do
  scp "$pkg" "$loc"
done && scp 'repo/shur.db.tar.xz' "$loc/shur.db"
