#!/bin/sh

# MARK A: Netzwerk starten
echo "Netzwerk starten..."
install -m 755 ../userland/target/S41udhcpc $1/etc/init.d/

# MARK B: Zeit setzen
echo "Zeit setzen..."
install -m 755 ../userland/target/S52ntp $1/etc/init.d/

# MARK C: SD-Karte einhaengen
echo "SD-Karte einhaengen..."
mkdir -p $1/boot
mkdir -p $1/data
if ! grep "/dev/mmcblk0p" -q $1/etc/fstab; then
    echo "/dev/mmcblk0p1 /boot  vfat  defaults  0  0" >> $1/etc/fstab
    echo "/dev/mmcblk0p2 /data  ext4  defaults  0  0" >> $1/etc/fstab
fi

# MARK D: Webserver
echo "Webserver..."
mkdir -p $1/var/www/cgi-bin
install -m 755 ../userland/target/S51httpd $1/etc/init.d/
install ../userland/target/httpd.conf $1/etc/
install -D ../userland/target/index.html $1/var/www/
install -D -m 755 ../userland/target/ps.cgi $1/var/www/cgi-bin/
