#!/bin/bash

MYSQL_ROOT_PASSWORD="mysql_root_password"

mkdir -p ./mysql

sudo docker exec -i mysql mysqldump -u root -pmysql_root_password wordpress > ./mysql/database.sql

sudo chown -R $USER ./mysql
