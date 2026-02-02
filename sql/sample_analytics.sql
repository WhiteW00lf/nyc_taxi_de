SELECT COUNT(*),pickup_hour
FROM nyc_curated.fact_trips
GROUP BY pickup_hour
ORDER BY pickup_hour DESC;


SELECT pickup_day,avg(fare_amount) AS avg_fare
from `nyc-taxi-486204.nyc_curated.fact_trips`
GROUP BY pickup_day
ORDER BY avg_fare DESC