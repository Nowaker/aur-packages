#!/bin/zsh

loc='www@geozone.pl:/home/www/shur.atlashost.eu/html'
rsync -av --progress repo/* "$loc"