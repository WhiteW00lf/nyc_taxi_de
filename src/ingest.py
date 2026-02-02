from google.cloud import storage
import os
import requests

PROJECT_ID = "nyc-taxi-486204"
BUCKET_NAME = "nyc-taxi-raw-de"
DATASET = "nyc_taxi"
YEAR = "2023"
MONTH = "01"

FILE_NAME = f"yellow_tripdata_{YEAR}-{MONTH}.parquet"
URL = f"https://d37ci6vzurychx.cloudfront.net/trip-data/{FILE_NAME}"
GCS_PATH = f"{DATASET}/year={YEAR}/month={MONTH}/{FILE_NAME}"
print(GCS_PATH)


def download_file_from_src(url, local_path):
    response = requests.get(url, stream=True)
    response.raise_for_status()
    if response.status_code == 200:
        with open(local_path, "wb") as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
    print(f"Downloaded file to {local_path}")


def upload_to_google_cloud(bucket_name, source_file, destination_blob):
    storage_client = storage.Client(project=PROJECT_ID)
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob)
    if blob.exists():
        print(
            f"File {destination_blob} already exists in {bucket_name}. Skipping upload."
        )
        return
    blob.upload_from_filename(source_file)
    print(f"Upload of {source_file} to {destination_blob} completed.")


def main():
    os.makedirs("data", exist_ok=True)
    local_path = os.path.join("data", FILE_NAME)

    if not os.path.exists(local_path):
        download_file_from_src(URL, local_path)
    else:
        print(f"File {local_path} already exists. Skipping download.")

    upload_to_google_cloud(BUCKET_NAME, local_path, GCS_PATH)


if __name__ == "__main__":
    main()
