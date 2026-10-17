{{ config(
    materialized='view',
    catalog='workspace',
    schema='staging'
) }}

SELECT
    product_key,
    product_id,
    product_name,
    brand,
    subcategory,
    category
FROM workspace.gold.dim_product
WHERE product_id IS NOT NULL