# Using Hive CLI

`bin/hive --config /projects/bi_discovery/vagrant/hive/conf`

# Using Beeline

`bin/beeline -u 'jdbc:hive2://localhost:10000/default;auth=noSasl' -n root`

```
CREATE EXTERNAL TABLE ody_bi_event_raw (event_uid STRING, utc_ts BIGINT, data STRING) PARTITIONED BY (dt STRING, hr STRING) STORED AS PARQUET LOCATION '/data/bievent/ody/raw';
MSCK REPAIR TABLE ody_bi_event_raw;
```
