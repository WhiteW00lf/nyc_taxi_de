CREATE EXTERNAL TABLE IF NOT EXISTS nyc_taxi.yellow_taxi_trips_ext
OPTIONS (
    FORMAT="parquet",
    uris=["gs://nyc-taxi-raw-de/nyc_taxi/year=2023/month=01/yellow_tripdata_2023-01.parquet"]
    );


    