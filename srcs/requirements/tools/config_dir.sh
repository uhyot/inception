#!/bin/bash
dir=/home/suchida/data
name=$1
ls ${dir}/${name} >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "[INFO] create directory for ${name} volume"
	mkdir -p ${dir}/${name}
	if [ $? -ne 0 ]; then
		echo "[ERROR] error creating directory:${dir}/${name}"
		exit 1
	fi
	echo "[INFO] completed creating directory:${dir}/${name}."
else
	echo "[INFO] directory:${dir}/${name} already exists, skip process."
fi
