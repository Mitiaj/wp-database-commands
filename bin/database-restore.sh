#!bin/bash
DB_NAME=$(grep DB_NAME .env | cut -d '=' -f2)
echo "Database name $DB_NAME. Let's restore its latest dump"
mysql $DB_NAME < database/latest.sql
echo "Done. Exiting"
