# Speedtest logger

## Initialize
By runing `docker-compose up [-d]` a database is started, and a table for log results is created.

There is also an initial test run by running app's command  

## "cron" mode
To run a test maybe by a cronjob call this command:

    docker-compose run --rm app


## "manual" read logfile
It is possible to read full logfile with this command

    docker-compose run --rm app /app/batch.sh /app/logs/speedtest.2020-03-15.log

Make sure database has been started before

## "batch logs"
To import a bunch of files call

    for FILE in `find ./logs -type f -name "*.log"`; do docker-compose run --rm app /app/batch.sh /app/$FILE; done

## Development
Due to different architecture a different MariaDB docker image is used for development


## local testing
If you want to avoid docker virtualization overhead call `cron-test.sh` by a local cronjob and 
just a view seconds before midnight call `cron-log.sh` to import logs of the day  
