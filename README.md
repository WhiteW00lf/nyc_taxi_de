# NYC Taxi Data Engineering Pipeline

### This project implements a production-style batch data pipeline on Google Cloud Platform that ingests NYC Taxi trip data, models it into analytics-ready tables, and exposes a business-facing daily summary for fast, cost-efficient querying.

```

NYC Taxi Public Dataset
→ Google Cloud Storage (RAW)
→ BigQuery RAW
→ BigQuery CURATED (fact_trips)
→ BigQuery ANALYTICS (daily_trip_summary)

```

## Data Layers

**RAW**

- Source-faithful taxi trip data stored in Parquet

- Loaded into BigQuery via external/native tables

- Partitioned by pickup date for cost-efficient scans

**CURATED**

- Cleaned fact table (fact_trips)

- Enforced data quality rules (valid timestamps, positive fares/distances)

- Derived analytics columns (trip duration, pickup hour, date)

**ANALYTICS**

- Business-facing table: daily_trip_summary

- One row per day with trips, revenue, and averages

- Optimized for repeated consumption by analysts and stakeholders

### Tech Stack
- Python 
- Google Cloud Storage
- Bigquery

### How to run 
``` 

pip install -r requirements.txt

python src/ingest.py

```