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

# MARK E: Firewall
echo "Firewall..."
install -m 755 ../userland/target/S45firewall $1/etc/init.d/
install -m 755 ../userland/target/fw_open.sh $1/usr/sbin/
install -m 755 ../userland/target/fw_up.sh $1/usr/sbin/

# MARK F: Usermanagement
echo "Usermanagement..."
../scripts/modifyshadow.sh root $1
../scripts/modifyshadow.sh default $1

# MARK G: Messagebox
echo "Display..."
install -m 755 ../userland/target/S53showip $1/etc/init.d/
install -m 755 ../userland/target/showtime $1/usr/bin/
install -D -m 755 ../userland/target/showmsg.php $1/var/www/cgi-bin/
echo "Modifying php.ini..."
sed -i "s/^;cgi.redirect_status_env =$/cgi.redirect_status_env = \"yes\"/g" \
    output/target/etc/php.ini
sed -i "s/^;cgi.force_redirect =/cgi.force_redirect = 0/g"\
    output/target/etc/php.ini
