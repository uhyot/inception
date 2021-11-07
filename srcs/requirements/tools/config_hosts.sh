#!/bin/bash
name=inception_review_`date '+%Y%m%d'`
ls /etc/hosts.$name >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "[INFO] change /etc/hosts for access login.42.fr"
	cp -pf /etc/hosts /etc/hosts.$name
	if [ $? -ne 0 ]; then
		echo "[ERROR] error occured while backing up hosts..."
		exit 1
	fi
	cp -pf ./srcs/requirements/tools/hosts /etc/hosts 
	if [ $? -ne 0 ]; then
		echo "[ERROR] error occured while placing hosts.."
		exit 1
	fi
	echo "[INFO] completed backing up hosts"
else
	echo "[INFO] backup file for /etc/hosts already exists, skip process."
fi
