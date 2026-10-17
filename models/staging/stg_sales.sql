{{ config(
    materialized='view',
    catalog='workspace',
    schema='staging'
) }}

SELECT
    sale_id,
    sale_date,
    product_id,
    customer_id,
    store_id,
    quantity,
    unit_price,
    CAST(quantity * unit_price AS DECIMAL(14,2)) AS sales_amount
FROM workspace.bronze.sales_raw
WHERE sale_id IS NOT NULL
  AND sale_date IS NOT NULL
  AND quantity > 0
  AND unit_price >= 0