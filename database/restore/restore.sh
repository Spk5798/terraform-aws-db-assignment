#!/bin/bash


FILE=$1


if [ -z "$FILE" ]

then

echo "Provide backup file"

exit 1

fi



cat $FILE | docker exec -i postgres-db \
psql -U admin companydb



echo "Database restored"

