#!/bin/bash
name=inception_review_`date '+%Y%m%d'`
ls /etc/hosts.$name >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "[INFO] backup file for /etc/hosts not found. see current hosts:"
	cat /etc/hosts
else
	mv -f /etc/hosts.$name /etc/hosts
	if [ $? -ne 0 ]; then
		echo "[ERROR] reset /etc/hosts failed. see files below: /etc/hosts*"
		ls -l /etc/hosts*
		exit 1
	else
		echo "[INFO] reset /etc/hosts completed."
	fi
fi
