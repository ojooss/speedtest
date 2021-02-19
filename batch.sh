#!/bin/bash

echo ""
echo "****************************"
date
echo "****************************"
echo ""

LOGFILE=$1
if [[ "${LOGFILE}" == "" ]]
then
  echo 'ERROR: no logfile given'
  exit 1
fi

input="/path/to/txt/file"
while IFS= read -r line
do
  echo "$line"
  echo "$line" \
  | awk -F"," '{ printf("INSERT IGNORE INTO log (timestamp, sponsor, server, datetime, download, upload) VALUES (STR_TO_DATE('\''%s'\'', '\''%%Y-%%m-%%dT%%H:%%i:%%s.%%f'\''), '\''%s'\'', '\''%s'\'', '\''%s'\'', ROUND((%s/1024/1024),2), ROUND((%s/1024/1024),2))", $4, $2, $3, $4, $7, $8 ) }' \
  | mysql -u speedtest -pspeedtest -h speedtest-database --database speedtest
done < "${LOGFILE}"
