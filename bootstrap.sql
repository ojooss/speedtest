CREATE TABLE log
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    timestamp TIMESTAMP    NOT NULL,
    sponsor   VARCHAR(128) NOT NULL,
    server    VARCHAR(128) NOT NULL,
    datetime  VARCHAR(128) NOT NULL,
    download  DECIMAL(5,2) NOT NULL COMMENT 'Mbit/s',
    upload    DECIMAL(5,2) NOT NULL COMMENT 'Mbit/s'
);

CREATE INDEX log_timestamp_index ON log (timestamp);
CREATE UNIQUE INDEX log_uindex   ON log (datetime);
