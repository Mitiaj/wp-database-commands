#!bin/bash

DB_NAME=$(grep DB_NAME .env | cut -d '=' -f2)
TIMESTAMP=`date "+%Y-%m-%d_%H:%M:%S"`

echo "Database name: $DB_NAME . Lets make its dump"

mysqldump $DB_NAME > "database/$TIMESTAMP.sql"

echo "Dump created. Lets make a symlink"

cd "database"
rm "latest.sql" -f

ln -s "$TIMESTAMP.sql" "latest.sql"

echo "Done. Exiting"