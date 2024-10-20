#!/bin/bash

sudo docker cp ./images/uploads php:/var/www/html/wp-content

sudo docker exec -it php bash -c "chown -R www-data:www-data /var/www/html/wp-content/uploads"
