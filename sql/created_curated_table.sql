create or replace table `nyc_curated.fact_trips`
PARTITION BY DATE(tpep_pickup_datetime)
CLUSTER BY PULocationID

AS

SELECT VendorID,
tpep_pickup_datetime,
tpep_dropoff_datetime,

EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour,
EXTRACT(DAYOFWEEK FROM  tpep_pickup_datetime) AS pickup_day,
TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime, MINUTE) AS diff_mins,
passenger_count,
  trip_distance,
  fare_amount,
  total_amount,
  payment_type,
  PULocationID,
  DOLocationID,
DATE(tpep_pickup_datetime) AS dates FROM `nyc-taxi-486204.nyc_taxi.yellow_taxi_trips`
WHERE tpep_pickup_datetime IS NOT NULL AND 
tpep_dropoff_datetime IS NOT NULL AND
total_amount > 0 AND
trip_distance > 0 AND 
tpep_dropoff_datetime >= tpep_pickup_datetime