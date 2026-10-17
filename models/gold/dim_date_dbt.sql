{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT DISTINCT
    CAST(date_format(sale_date, 'yyyyMMdd') AS BIGINT) AS date_key,
    CAST(sale_date AS DATE) AS full_date,
    YEAR(sale_date) AS year,
    QUARTER(sale_date) AS quarter,
    MONTH(sale_date) AS month,
    DAY(sale_date) AS day
FROM {{ ref('stg_sales') }}
WHERE sale_date IS NOT NULL