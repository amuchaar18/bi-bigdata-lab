
{{ config(materialized='view', catalog='workspace', schema='gold') }}

SELECT
    p.category AS categoria,
    SUM(f.quantity) AS cantidad_vendida,
    SUM(f.sales_amount) AS ventas_totales
FROM workspace.gold.fact_sales AS f
INNER JOIN workspace.gold.dim_product AS p
    ON f.product_key = p.product_key
GROUP BY p.category
