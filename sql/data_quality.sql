SELECT COUNT(*) AS bad_rows FROM `nyc-taxi-486204.nyc_curated.fact_trips`
WHERE tpep_pickup_datetime IS NULL AND diff_mins < 0;

