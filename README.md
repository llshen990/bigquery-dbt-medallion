# TheLook eCommerce Data Transformation Project

## Project Overview
This project uses **dbt (Data Build Tool)** to transform raw eCommerce data into an analytics-ready Data Mart in **Google BigQuery**.

## Architecture
- **Staging Layer**: Cleaned raw data from `users`, `orders`, and `order_items`.
- **Marts Layer**: 
    - `dim_customer`: Unified customer profile with lifetime value metrics.
    - `fact_transaction`: Partitioned transaction table for efficient BI querying.

## Key Features
- **Data Quality**: Implemented `unique` and `not_null` schema tests.
- **Optimization**: Used BigQuery **Partitioning** and **Clustering** to reduce scan costs.
- **Modularity**: Followed the Medallion Architecture for scalable data pipelines.
