{{ config(
    materialized='view',
    catalog='workspace',
    schema='staging'
) }}

SELECT
    store_key,
    store_id,
    store_name,
    city,
    region,
    country
FROM workspace.gold.dim_store
WHERE store_id IS NOT NULL