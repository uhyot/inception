# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sho <sho@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/23 12:46:40 by suchida           #+#    #+#              #
#    Updated: 2021/07/02 22:55:17 by sho              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DC = docker-compose
FPATH = -f srcs/docker-compose.yml
CMD = ${DC} ${FPATH}
CHECK_USER = ./srcs/requirements/tools/check_user.sh
CFGHOSTS = ./srcs/requirements/tools/config_hosts.sh
RESETHOSTS = ./srcs/requirements/tools/reset_hosts.sh
CFGDIR_CMD = ./srcs/requirements/tools/config_dir.sh
RESETDIR_CMD = ./srcs/requirements/tools/reset_dir.sh

# for config os settings
config:
	${CHECK_USER}
	${CFGHOSTS}
	${CFGDIR_CMD} wordpress
	${CFGDIR_CMD} mariadb
reset:
	${CHECK_USER}
	${RESETHOSTS}
	${RESETDIR_CMD} wordpress
	${RESETDIR_CMD} mariadb

# for build container
up:
	@make config
	${CMD} up -d
build:
	@make config
	${CMD} build
install:
	@make config
	${CMD} up -d --build
reinstall:
	@make destroy
	@make install
rmi:
	${CHECK_USER}
	${CMD} down --rmi all
destroy:
	${CHECK_USER}
	${CMD} down --rmi all --volumes
	@make reset

# for operation
stop:
	${CMD} stop
restart:
	${CMD} down
	${CMD} up -d
down:
	${CMD} down
ps:
	${CMD} ps
status:
	${CMD} images
	${CMD} ps
con-web:
	${CMD} exec nginx bash
con-app:
	${CMD} exec wordpress bash
con-db:
	${CMD} exec mariadb bash
logs:
	${CMD} logs

.PHONY: config reset up build install reinstall rmi destroy stop restart down ps status con-web con-app con-db logs
