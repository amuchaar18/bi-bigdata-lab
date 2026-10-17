{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT
    store_key,
    store_id,
    store_name,
    city,
    region,
    country
FROM {{ ref('stg_stores') }}