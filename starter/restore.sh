#!/usr/bin/env bash

docker-compose up -d

sleep 3

echo "Restoring database from mysqldump..."

workdir=${PWD##*/}

container="${workdir}_db_1"

docker cp html ${container}:/var/www/

docker cp ./migrate.sql ${container}:/

docker exec -it ${container} bash -c "mysql -uroot -ppass exampledb < migrate.sql"

