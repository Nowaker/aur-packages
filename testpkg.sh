#!/usr/bin/env zsh

if [[ $EUID -ne 0 ]]; then
  echo 'Must be run as root.'
  exit 1
fi

mkdir test
./arch-bootstrap.sh -a x86_64 -r 'http://mirror.chmuri.net/archmirror' test

cat << 'EOF' >> test/etc/pacman.conf
[multilib]
SigLevel = PackageRequired
Include = /etc/pacman.d/mirrorlist
  
[shur]
Server = https://shur.atlashost.eu/
EOF

mount -t proc none test/proc
mount -t sysfs none test/sys
mount -o bind /dev test/dev
mount -o bind /dev/pts test/dev/pts

chroot test pacman-key --init
chroot test pacman-key --populate archlinux
chroot test pacman -Sy
chroot test pacman -S base
if [ -n "$@" ]; then
  chroot test "$@"
fi
chroot test bash

umount test/dev/pts test/dev test/sys test/proc
rm -rf test
