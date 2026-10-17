{{ config(
    materialized='view',
    catalog='workspace',
    schema='staging'
) }}

SELECT
    customer_id,
    customer_name,
    segment,
    city,
    country
FROM workspace.bronze.customers_raw
WHERE customer_id IS NOT NULL