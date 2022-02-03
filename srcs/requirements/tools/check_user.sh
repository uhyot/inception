#!/bin/bash
current_user=`whoami`
if [ ${current_user} != "root" ]; then
	echo "[ERROR] USER must be root, exit process."
	exit 1
fi
