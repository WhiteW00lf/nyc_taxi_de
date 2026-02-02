CREATE OR REPLACE TABLE `nyc-taxi-486204.nyc_analytics.daily_trip_summary`
PARTITION BY DATE(tpep_pickup_datetime)

AS

SELECT 
tpep_pickup_datetime,
COUNT(*) AS total_trips,
SUM(total_amount) AS total_revenue,
AVG(trip_distance) AS avg_trip_distance,
AVG(fare_amount) AS avg_fare,
AVG(diff_mins) AS average_time_taken_to_dropoff,
FROM `nyc-taxi-486204.nyc_curated.fact_trips`
GROUP BY tpep_pickup_datetime 
