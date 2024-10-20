#!/bin/bash

mkdir -p ./images

sudo docker cp php:/var/www/html/wp-content/uploads/ ./images
