{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key,
    customer_id,
    customer_name,
    segment,
    city,
    country
FROM {{ ref('stg_customers') }}