#/usr/bin/env zsh

pkgname="$1"

if [ -z "$pkgname" ]; then
  echo "Usage: $0 package-name"
  exit 1
fi

if [ -d "$pkgname" ]; then
  echo "Directory $pkgname/ already exists."
  exit 2
fi

mkdir -p "$pkgname"
cp PKGBUILD.example "$pkgname/PKGBUILD"
sed -i "s/pkgname=''/pkgname='$pkgname'/" "$pkgname/PKGBUILD"
cp example.install "$pkgname/$pkgname.install"
