#!/bin/zsh

URL = "http://localhost:9889/

while true
do
	curl -s -o /dev/null -w "%{http_code}\n" $URL
	sleep 10
done
