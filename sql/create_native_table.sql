CREATE OR REPLACE TABLE nyc_taxi.yellow_taxi_trips
PARTITION BY DATE(tpep_pickup_datetime)
AS
SELECT *
FROM nyc_taxi.yellow_taxi_trips_ext;