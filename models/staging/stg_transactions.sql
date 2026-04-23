-- models/staging/stg_transactions.sql
WITH orders AS (
    SELECT * FROM {{ source('thelook_ecommerce', 'orders') }}
),
order_items AS (
    SELECT * FROM {{ source('thelook_ecommerce', 'order_items') }}
)

SELECT
    oi.id AS order_item_id,
    o.order_id,
    o.user_id AS customer_id,
    oi.product_id,
    oi.sale_price,
    o.status,
    CAST(o.created_at AS TIMESTAMP) AS created_at
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id