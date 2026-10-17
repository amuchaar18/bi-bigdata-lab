{{ config(
    materialized='view',
    catalog='workspace',
    schema='gold'
) }}

SELECT
    COUNT(DISTINCT sale_id) AS total_ventas,
    SUM(quantity) AS unidades_vendidas,
    SUM(sales_amount) AS ingresos_totales,
    ROUND(
        SUM(sales_amount) / NULLIF(COUNT(DISTINCT sale_id), 0),
        2
    ) AS ticket_promedio
FROM workspace.silver.sales_clean