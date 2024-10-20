#!/bin/bash

MYSQL_ROOT_PASSWORD="mysql_root_password"

sudo docker cp ./mysql/database.sql mysql:/tmp/database.sql

sudo docker exec -it mysql bash -c "mysql -u root -p$MYSQL_ROOT_PASSWORD wordpress < /tmp/database.sql"
