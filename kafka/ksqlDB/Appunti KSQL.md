# HOW TO

- Connect to VPN Databitz
- Enter in pod confluent-ksqldb shell
- type `ksql` to enter ksql shell


### How to list all topics
`SHOW TOPICS;`

### How read last 5 messages from a topic
--DROP stream TMP_RGHM_phases_list;

create stream TMP_RGHM_phases_list with (kafka_TOPIC = 'phases-list', VALUE_FORMAT= 'AVRO');

DESCRIBE TMP_RGHM_phases_list;

select * from TMP_RGHM_phases_list LIMIT 10;
select TIMESTAMPTOSTRING(ROWTIME,'yyyy-MM-dd HH:mm:ss.SSS'), * from TMP_RGHM_phases_list LIMIT 10;
select TIMESTAMPTOSTRING(ROWTIME,'yyyy-MM-dd HH:mm:ss.SSS'), * from TMP_RGHM_phases_list WHERE ROWTIME > 1646784000000 and ROWTIME < 1646870400000 EMIT CHANGES;
select ROWKEY, * from TMP_RGHM_phases_list EMIT CHANGES;

select * from TMP_RGHM_phases_list LIMIT 10;
SELECT key, COUNT(*) FROM TMP_RGHM_phases_list GROUP BY id;





create stream TMP_RGHM_tasks_list with (kafka_TOPIC = 'tasks-list', VALUE_FORMAT= 'AVRO');
DESCRIBE TMP_RGHM_tasks_list;
select  * from TMP_RGHM_tasks_list WHERE ROWTIME > 1646784000000 and ROWTIME < 1646838000000 EMIT CHANGES;

SET 'auto.offset.reset' = 'earliest';
output json;


PRINT 'non-post-sales-magnolia-submissions' FROM BEGINNING;

### How to find last message by key on a topic


### Luca santo subito 
DROP stream TMP_RGHM_non_post_sales_magnolia_submissions;
create stream TMP_RGHM_non_post_sales_magnolia_submissions (rowkey STRING KEY) with (kafka_TOPIC = 'non-post-sales-magnolia-submissions', VALUE_FORMAT= 'AVRO');
select TIMESTAMPTOSTRING(ROWTIME,'yyyy-MM-dd HH:mm:ss.SSS'),* from TMP_RGHM_non_post_sales_magnolia_submissions WHERE ROWKEY = 'SUB-251038-W1M6H3' EMIT CHANGES;


DROP stream TMP_RGHM_tasks_list;
create stream TMP_RGHM_tasks_list (rowkey STRING KEY) with (kafka_TOPIC = 'tasks-list', VALUE_FORMAT= 'AVRO');
select TIMESTAMPTOSTRING(ROWTIME,'yyyy-MM-dd HH:mm:ss.SSS'),* from TMP_RGHM_tasks_list WHERE ROWKEY = 'SUB-73668-D0M6S6' EMIT CHANGES;
