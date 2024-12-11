#!/bin/bash
docker run --name mysql-container \
	-e MYSQL_ROOT_PASSWORD=foo\
	-d \
	-v vol-sql-demo:/var/lib/mysql \
	-p 3307:3306 \
	--network net-tp4 \
	mysql:latest

