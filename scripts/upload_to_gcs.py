#!/usr/bin/env python3
"""Upload a local file to Google Cloud Storage using a service account JSON.

Usage:
  python scripts/upload_to_gcs.py --file Video_Games_Sales_Cleaned.csv --bucket bruin-test-002

Requires: pip install google-cloud-storage
"""
import argparse
from google.cloud import storage


def upload(file_path: str, bucket_name: str, object_name: str | None, service_account: str):
    client = storage.Client.from_service_account_json(service_account)
    bucket = client.bucket(bucket_name)
    blob_name = object_name or file_path
    blob = bucket.blob(blob_name)
    blob.upload_from_filename(file_path)
    print(f"Uploaded {file_path} to gs://{bucket_name}/{blob_name}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", required=True, help="Local file to upload")
    parser.add_argument("--bucket", required=True, help="GCS bucket name")
    parser.add_argument("--object", help="Object name in the bucket (defaults to file name)")
    parser.add_argument("--credentials", default="video-490706-6bd43a071f7e.json", help="Path to service account JSON")
    args = parser.parse_args()

    upload(args.file, args.bucket, args.object, args.credentials)


if __name__ == "__main__":
    main()
