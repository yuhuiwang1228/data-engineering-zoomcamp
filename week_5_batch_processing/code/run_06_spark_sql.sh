python 06_spark_sql.py \
    --input_green=data/pq/green/2021/*/ \
    --input_yellow=data/pq/yellow/2021/*/ \
    --output=data/report-2021

URL="spark://192.168.3.231:7077"

spark-submit \
  --master ${URL} \
  06_py_sql.py \
    --input_green=data/pq/green/2021/*/ \
    --input_yellow=data/pq/yellow/2021/*/ \
    --output=data/report-2021

--input_green=gs://de-zoomcamp-ny-taxi/pq/green/2021/*/ \
--input_yellow=gs://de-zoomcamp-ny-taxi/pq/yellow/2021/*/ \
--output=gs://de-zoomcamp-ny-taxi/report-2021

gcloud dataproc jobs submit pyspark \
    --cluster=de-zoomcamp-cluster \
    --region=us-central1 \
    gs://de-zoomcamp-ny-taxi/code/06_spark_sql.py \
    -- \
        --input_green=gs://de-zoomcamp-ny-taxi/pq/green/2020/*/ \
        --input_yellow=gs://de-zoomcamp-ny-taxi/pq/yellow/2020/*/ \
        --output=gs://de-zoomcamp-ny-taxi/report-2020

gcloud dataproc jobs submit pyspark \
    --cluster=de-zoomcamp-cluster \
    --region=us-central1 \
    --jars=gs://spark-lib/bigquery/spark-bigquery-with-dependencies_2.12-0.23.2.jar \
    gs://de-zoomcamp-ny-taxi/code/06_spark_sql_big_query.py \
    -- \
        --input_green=gs://de-zoomcamp-ny-taxi/pq/green/2020/*/ \
        --input_yellow=gs://de-zoomcamp-ny-taxi/pq/yellow/2020/*/ \
        --output=trips_data_all.reports-2020

gcloud dataproc jobs submit pyspark \
    --cluster=de-zoomcamp-cluster \
    --region=us-central1 \
    --jars=gs://spark-lib/bigquery/spark-bigquery-latest_2.12.jar \
    --properties spark.driver.memory=4g,spark.executor.memory=4g \
    gs://de-zoomcamp-ny-taxi/code/06_spark_sql_big_query.py \
    -- \
        --input_green=gs://de-zoomcamp-ny-taxi/pq/green/2020/*/ \
        --input_yellow=gs://de-zoomcamp-ny-taxi/pq/yellow/2020/*/ \
        --output=trips_data_all.reports-2020