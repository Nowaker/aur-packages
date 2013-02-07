#!/bin/zsh

loc='www@geozone.pl:/home/www/shur.atlashost.eu/html/XMJ7vybPdUiaVw3PETTvph4jVLgM3swxNdiw'
rsync -av --progress repo/* "$loc"