#!/usr/bin/env bash

if [ "$#" -lt 1 ]
  then
    echo "You must specify a database name"
  else
    output_directory=${2-$1}
    psql -U postgres -d $1 -a -f generate_csv_schema.sql

    mv /tmp/result.csv ./$output_directory.csv
fi
