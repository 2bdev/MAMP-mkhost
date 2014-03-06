#!/bin/bash

MAMP='/Applications/MAMP'
HOST='/private/etc/hosts'
ARGC=2
USER='bborman'
GROUP='staff'

if [ $# -ne $ARGC ]; then
	echo "Usage: sudo bash ./mkhost.sh <domain name> <document root>"
	exit 0
fi

echo "Attempting to create subdomain $1 with document root of $2"

echo -e "\n..."
echo "BEGIN: Edit $HOST"
echo -e "127.0.0.1\t$1" >> $HOST
echo "DONE: Edit hosts file"

if [ ! -d $2 ]; then
	echo -e "\tCreating document root at $2"
	mkdir $2
	chown $USER:$GROUP $2
fi


echo -e "\n..."
echo "BEGIN: Edit httpd-vhosts.conf"
cat <<EOF>> $MAMP/conf/apache/extra/httpd-vhosts.conf

<VirtualHost *:80>
	DocumentRoot "$2"
	ServerName $1
</VirtualHost>
EOF
echo "DONE: Edit httpd-vhosts.conf"

echo -e "\n..."
echo "BEGIN: Restart Apache"
$MAMP/bin/apache2/bin/apachectl restart
echo "DONE: Restart Apache"
