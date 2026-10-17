{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT
    d.year,
    d.month,
    COUNT(DISTINCT f.sale_id) AS total_sales,
    SUM(f.quantity) AS total_units,
    SUM(f.sales_amount) AS total_revenue,
    ROUND(
        SUM(f.sales_amount) / NULLIF(COUNT(DISTINCT f.sale_id), 0),
        2
    ) AS average_ticket
FROM {{ ref('fact_sales_dbt') }} f
INNER JOIN {{ ref('dim_date_dbt') }} d
    ON f.date_key = d.date_key
GROUP BY
    d.year,
    d.month