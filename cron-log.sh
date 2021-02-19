#!/bin/bash

#
#  this file intended for IMPORT LOCAL TEST RESULTS to dockered database
#
#  a running database is required (call "docker-compose up -d")
#
#  best way to import is calling this script at 23:59:00 to read total result of current day
#

docker-compose run --rm app /app/batch.sh "/app/logs/speedtest.$(date +%F).log"
