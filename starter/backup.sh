#!/usr/bin/env bash

echo "Backing up the database..."

workdir=${PWD##*/}

dbContainer="${workdir}_db_1"
phpContainer="${workdir}_wordpress_1"

docker exec -it ${dbContainer} bash -c "mysqldump -uroot -ppass exampledb > migrate.sql"

docker cp ${dbContainer}:/migrate.sql .

docker cp ${phpContainer}:/var/www/html .

