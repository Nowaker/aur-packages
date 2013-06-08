#!/bin/zsh

./importpkg.sh jdk6 || exit 6
./importpkg.sh jdk || exit 7

rm -rf oraclejdk6-32-aur oraclejdk7-32-aur
mv jdk6 oraclejdk6-32-aur
mv jdk oraclejdk7-32-aur

sed -i -e "s/conflicts=.*//" oraclejdk6-32-aur/PKGBUILD
sed -i -e "s/conflicts=.*//" oraclejdk7-32-aur/PKGBUILD

