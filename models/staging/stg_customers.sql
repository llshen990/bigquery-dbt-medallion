-- models/staging/stg_customers.sql
SELECT
    id AS customer_id,
    first_name,
    last_name,
    email,
    traffic_source,
    age,
    gender,
    state,
    country,
    CAST(created_at AS TIMESTAMP) AS created_at
FROM `bigquery-public-data.thelook_ecommerce.users`
