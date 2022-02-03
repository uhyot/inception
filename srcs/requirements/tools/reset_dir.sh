#!/bin/bash
dir=/home/suchida/data
name=$1
ls ${dir}/${name} >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "[INFO] directory not found, skip process."
else
	rm -rf ${dir}/${name}
	if [ $? -ne 0 ]; then
		echo "[ERROR] deleting directory:${dir}/${name}."
		exit 1
	else
		echo "[INFO] deleting directory:${dir}/${name} completed."
	fi
fi
