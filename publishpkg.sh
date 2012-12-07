#!/bin/zsh

loc='www@geozone.pl:/home/www/shur.atlashost.eu/'
rsync -av --progress repo/*.tar* "$loc" && scp 'repo/shur.db.tar.xz' "$loc/shur.db"
