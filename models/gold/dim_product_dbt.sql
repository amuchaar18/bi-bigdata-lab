{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT
    product_key,
    product_id,
    product_name,
    brand,
    subcategory,
    category
FROM {{ ref('stg_products') }}