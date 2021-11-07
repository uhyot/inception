#!/bin/bash
# place wordpress file
cnt=`ls -l /var/www/html/wordpress/ | wc -l`
if [ $cnt -eq 1 ]; then
	cp -pr ./data/* /var/www/html/wordpress/
	if [ $? != 0 ]; then
		exit 1
	fi
fi

# start services
/usr/bin/supervisord -c /etc/supervisor.d/nginx.conf
if [ $? != 0 ]; then
	exit 1
fi
