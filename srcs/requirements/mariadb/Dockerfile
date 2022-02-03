# template
FROM debian:buster

# workdir
WORKDIR /root/

# upload files
COPY ./tools ./tools
COPY ./conf ./conf
COPY ./data ./data
RUN mkdir /home/mariadb-vol && chmod 777 /home/mariadb-vol
RUN chmod -R 755 ./tools/ ./conf/ ./data/

# add repository
RUN echo "deb http://ftp.jp.debian.org/debian/ buster main contrib non-free" >> /etc/apt/sources.list;

# install maria-db, other packages
RUN apt update && apt-get install openssl mariadb-server mariadb-client unzip wget git -y;

# setup wordpress
RUN chown -R mysql:mysql ./data
RUN cp conf/50-server.cnf /etc/mysql/mariadb.conf.d/;
RUN mv /var/lib/mysql /var/lib/mysql.bk;
RUN ln -s /home/mariadb-vol /var/lib/mysql;

#Install Supervisor and config
RUN apt-get install -y supervisor
COPY conf/mysqld.conf /etc/supervisor.d/

# run services
ENTRYPOINT ["/bin/sh", "./tools/start_services.sh"]

