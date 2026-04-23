-- models/marts/dim_customer.sql
WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),
transaction_summary AS (
    SELECT
        customer_id,
        MIN(created_at) AS first_order_date,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(sale_price) AS total_spend
    FROM {{ ref('stg_transactions') }}
    GROUP BY 1
)

SELECT
    c.*,
    ts.first_order_date,
    COALESCE(ts.total_orders, 0) AS total_orders,
    COALESCE(ts.total_spend, 0) AS total_lifetime_value
FROM customers c
LEFT JOIN transaction_summary ts ON c.customer_id = ts.customer_id