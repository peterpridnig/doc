#!/bin/bash
# usage: modifyshadow.sh username targetdir
# $1 = username
# $2 = targetdir

USERNAME=$1
TARGETDIR=$2

# read in password; don't show it on the commandline
stty -echo
read -p "Password for $1: " passw; echo
stty echo

salt=`< /dev/urandom tr -dc A-Za-z0-9 | head -c8;echo;`
passwordhash=`mkpasswd -m sha-512 $passw $salt`

sed -i -e "s#^$USERNAME:[^:]*:#$USERNAME:$passwordhash:#" $TARGETDIR/etc/shadow
