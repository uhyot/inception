# template
FROM debian:buster

# workdir
WORKDIR /root/

# upload files
COPY ./tools ./tools
COPY ./conf ./conf
COPY ./data ./data
RUN chmod -R 755 ./tools/ ./conf/
RUN chmod -R 777 ./data/
RUN mkdir -p /var/www/html/wordpress && chmod 755 /var/www/html/wordpress

# add repository
RUN echo "deb http://ftp.jp.debian.org/debian/ buster main contrib non-free" >> /etc/apt/sources.list;

# install php, other packages
RUN apt update && apt-get install \
	openssl unzip wget git \
	mariadb-server mariadb-client \
	php-cgi php-common php-fpm php-pear php-mbstring \
	php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath \
	-y;

# install wordpress
RUN cp conf/www.conf /etc/php/7.3/fpm/pool.d/;
#RUN chown -R www-data:www-data /var/www/html/wordpress;
RUN mkdir -p /run/php;

#Install Supervisor and config
RUN apt-get install -y supervisor
COPY conf/php-fpm.conf /etc/supervisor.d/

# run services
#CMD /usr/bin/supervisord -c /etc/supervisor.d/php-fpm.conf
ENTRYPOINT ["/bin/sh", "./tools/start_services.sh"]

