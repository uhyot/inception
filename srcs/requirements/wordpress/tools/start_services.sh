#!/bin/bash
chown -R www-data:www-data /var/www/html/wordpress
chown -R www-data:www-data ./data

# config permission
cnt=`ls -l /var/www/html/wordpress/ | wc -l`
if [ $cnt -eq 1 ]; then
	cp -pr ./data/* /var/www/html/wordpress/
fi
if [ $? != 0 ]; then
	exit 1
fi

# start services
/usr/bin/supervisord -c /etc/supervisor.d/php-fpm.conf
if [ $? != 0 ]; then
	exit 1
fi
