# Instructions

This example is taken from [https://www.baeldung.com/ksqldb](https://www.baeldung.com/ksqldb)

* docker-compose up
* open a terminal in `/ksqldb-cli` and connect to ksql `ksql http://ksqldb-server:8088`

We'll also tell ksqlDB to start all queries from the earliest point in each topic:
`SET 'auto.offset.reset' = 'earliest';`

Let's begin by creating our stream to store the incoming sensor data:
```
CREATE STREAM readings (sensor_id VARCHAR KEY, timestamp VARCHAR, reading INT)
    WITH (KAFKA_TOPIC = 'readings',
    VALUE_FORMAT = 'JSON',
    TIMESTAMP = 'timestamp',
    TIMESTAMP_FORMAT = 'yyyy-MM-dd HH:mm:ss',
    PARTITIONS = 1);
```

