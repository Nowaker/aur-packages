These are my Arch Linux packages. [Browse on AUR](https://aur.archlinux.org/packages/?SeB=m&K=Nowaker)

# Oracle JDK

These Oracle JDK packages are intended for servers only. Don't install on desktops.
They don't conflict with each other - install as many JDK versions as you need.
Both 32-bit and 64-bit Java are provided system. You normally want 64-bit versions unless you have some specific needs.

Files go to `/usr/lib/jvm/oraclejdk$VER-$ARCH`, e.g. `/usr/lib/jvm/oraclejdk8-32`.

Source `/etc/conf.d/oracjejdk7-64` to get `$JAVA_HOME` variable pointing to a specific JDK.
In systemd service file source the config like this: `EnvironmentFile=/etc/conf.d/oraclejdk7-64`

It's encouraged to symlink `/usr/lib/jvm/default-java` to the prefered version of Java, e.g. `ln -s /usr/lib/jvm/oraclejdk7-64 /usr/lib/jvm/default-java`.

