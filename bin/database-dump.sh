#!bin/bash

DB_NAME=$(grep DB_NAME .env | cut -d '=' -f2)
TIMESTAMP=`date "+%Y-%m-%d_%H:%M:%S"`

echo "Database name: $DB_NAME . Lets make its dump"

mysqldump $DB_NAME > "database/$TIMESTAMP.sql" || exit

echo "Dump created. Lets make a symlink"
if [ ! -d "database" ]; then
    mkdir "database"
fi

cd "database"
rm "latest.sql" -f

ln -s "$TIMESTAMP.sql" "latest.sql" || exit

echo "Done. Exiting"