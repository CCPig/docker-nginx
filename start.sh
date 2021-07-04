#!/bin/bash
num=$(ps -ef|grep nginx|grep -v grep|wc -l)
if [ $num==0 ]
then
	/usr/sbin/nginx -c /etc/nginx/nginx.conf; 
else
	echo "nginx is running"
fi
