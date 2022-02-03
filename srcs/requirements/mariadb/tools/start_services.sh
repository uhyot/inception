#!/bin/bash
# config permission

# place data
cnt=`ls -l /home/mariadb-vol/ | wc -l`
if [ $cnt -eq 1 ]; then
	cp -pr ./data/* /home/mariadb-vol/
	if [ $? != 0 ]; then
		exit 1
	fi
fi

# change permission for ibtmp1
chmod -R 777 /home/mariadb-vol
if [ $? != 0 ]; then
	exit 1
fi

touch /var/lib/mysql/mysql.sock
chown mysql:mysql /var/lib/mysql/mysql.sock

# configure for wordpress
#mysql -u root <<EOS
#CREATE DATABASE wpdb;
#CREATE USER 'wpuser'@'some-wordpress.srcs_backend' identified by '$WPDB_PASS';
#GRANT ALL PRIVILEGES ON wpdb.* TO wpuser@'some-wordpress.srcs_backend';
#EOS
#if [ $? != 0 ]; then
#	exit 1
#fi

#mysqladmin password $WPDB_ROOT_PASS -u root
#mysql -u root <<EOS
#FLUSH PRIVILEGES;
#EOS
#if [ $? != 0 ]; then
#	exit 1
#fi

# start services↲
/usr/bin/supervisord -c /etc/supervisor.d/mysqld.conf
if [ $? != 0 ]; then
	exit 1
fi
