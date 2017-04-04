#!/usr/bin/env bash

if [ "$#" -lt 1 ]
  then
    echo "You must specify a database name"
  else
    output_directory=${2-$1}

    java -jar schemaSpy_5.0.0.jar \
         -dp postgresql-9.4-1204.jdbc42.jar \
         -t pgsql \
         -u postgres \
         -db $1 \
         -host localhost:5432 \
         -s public \
         -o $output_directory
fi
