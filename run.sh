#!/bin/bash

echo ""
echo "****************************"
date
echo "****************************"
echo ""

echo "running speedtest ..."
#speedtest-cli --csv-header
speedtest-cli --csv \
  | awk -F"," '{ printf("INSERT INTO log (timestamp, sponsor, server, datetime, download, upload) VALUES (NOW(), '\''%s'\'', '\''%s'\'', '\''%s'\'', ROUND((%s/1024/1024),2), ROUND((%s/1024/1024),2)) ON DUPLICATE KEY UPDATE  timestamp=NOW();", $2, $3, $4, $7, $8 ) }' \
  | mysql -u speedtest -pspeedtest -h speedtest-database --database speedtest

echo ""
echo "SELECT DATE_FORMAT(timestamp, '%H:%i:%s') AS time, download, upload FROM log ORDER BY id DESC LIMIT 1;" | mysql -u speedtest -pspeedtest -h speedtest-database --table --database speedtest
