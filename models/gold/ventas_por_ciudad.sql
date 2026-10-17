{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT
    s.city AS ciudad,
    COUNT(DISTINCT f.sale_id) AS total_ventas,
    SUM(f.quantity) AS unidades_vendidas,
    SUM(f.sales_amount) AS ingresos_totales
FROM workspace.gold.fact_sales AS f
INNER JOIN workspace.gold.dim_store AS s
    ON f.store_key = s.store_key
GROUP BY s.city