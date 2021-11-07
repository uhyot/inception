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
RUN cp conf/server.crt conf/server.key /var/www/html/;

# add repository
RUN echo "deb http://ftp.jp.debian.org/debian/ buster main contrib non-free" >> /etc/apt/sources.list;

# install nginx, other packages
RUN apt update && apt-get install \
	openssl unzip wget git curl\
	nginx \
	-y;

COPY conf/wordpress.conf.tmpl /etc/nginx/sites-available/wordpress.conf.tmpl
COPY conf/default.tmpl /etc/nginx/sites-available/default.tmpl
RUN ln -s /etc/nginx/sites-available/wordpress.conf.tmpl /etc/nginx/sites-enabled/wordpress.conf
RUN chown -R www-data:www-data ./data

#Install Supervisor and config
RUN apt-get install -y supervisor
COPY conf/nginx.conf /etc/supervisor.d/

# expose ports
EXPOSE 443

# run services
ENTRYPOINT ["/bin/sh", "./tools/start_services.sh"]

