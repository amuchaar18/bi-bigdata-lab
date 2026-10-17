{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT
    s.sale_id,
    d.date_key,
    p.product_key,
    t.store_key,
    c.customer_key,
    s.quantity,
    s.unit_price,
    s.sales_amount
FROM {{ ref('stg_sales') }} s
INNER JOIN {{ ref('dim_date_dbt') }} d
    ON CAST(s.sale_date AS DATE) = d.full_date
INNER JOIN {{ ref('dim_product_dbt') }} p
    ON s.product_id = p.product_id
INNER JOIN {{ ref('dim_store_dbt') }} t
    ON s.store_id = t.store_id
INNER JOIN {{ ref('dim_customer_dbt') }} c
    ON s.customer_id = c.customer_id