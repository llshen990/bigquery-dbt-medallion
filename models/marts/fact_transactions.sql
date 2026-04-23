-- models/marts/fact_transaction.sql
{{
  config(
    materialized='table',
    partition_by={"field": "created_at", "data_type": "timestamp", "granularity": "day"}
  )
}}

SELECT
    t.*,
    c.state,
    c.country
FROM {{ ref('stg_transactions') }} t
LEFT JOIN {{ ref('dim_customer') }} c ON t.customer_id = c.customer_id