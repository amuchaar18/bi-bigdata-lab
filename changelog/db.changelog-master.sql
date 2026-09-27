--liquibase formatted sql
--changeset estudiante:001

CREATE SCHEMA IF NOT EXISTS workspace.bi_lab_7002845536
COMMENT 'Laboratorio 02 - BI y Big Data - UCV';

--rollback DROP SCHEMA IF EXISTS workspace.bi_lab_7002845536;
--changeset estudiante:002

CREATE SCHEMA IF NOT EXISTS workspace.bi_staging_7002845536
COMMENT 'Staging schema - BI and Big Data - Lab 03';

--rollback DROP SCHEMA IF EXISTS workspace.bi_staging_7002845536;
--changeset estudiante:003

CREATE SCHEMA IF NOT EXISTS workspace.gold;

CREATE TABLE IF NOT EXISTS workspace.gold.dim_date (
    date_key INT,
    full_date DATE,
    day INT,
    month INT,
    month_name STRING,
    quarter INT,
    year INT
)
USING DELTA;

--rollback DROP TABLE IF EXISTS workspace.gold.dim_date;

--changeset estudiante:004

CREATE TABLE IF NOT EXISTS workspace.gold.dim_product (
    product_key BIGINT,
    product_id BIGINT,
    product_name STRING,
    brand STRING,
    subcategory STRING,
    category STRING
)
USING DELTA;

--rollback DROP TABLE IF EXISTS workspace.gold.dim_product;

--changeset estudiante:005

CREATE TABLE IF NOT EXISTS workspace.gold.dim_customer (
    customer_key BIGINT,
    customer_id BIGINT,
    customer_name STRING,
    segment STRING,
    city STRING,
    country STRING
)
USING DELTA;

--rollback DROP TABLE IF EXISTS workspace.gold.dim_customer;

--changeset estudiante:006

CREATE TABLE IF NOT EXISTS workspace.gold.dim_store (
    store_key BIGINT,
    store_id BIGINT,
    store_name STRING,
    city STRING,
    region STRING,
    country STRING
)
USING DELTA;

--rollback DROP TABLE IF EXISTS workspace.gold.dim_store;

--changeset estudiante:007

CREATE TABLE IF NOT EXISTS workspace.gold.fact_sales (
    sale_id BIGINT,
    date_key INT,
    product_key BIGINT,
    store_key BIGINT,
    customer_key BIGINT,
    quantity INT,
    unit_price DECIMAL(12,2),
    sales_amount DECIMAL(14,2)
)
USING DELTA;

--rollback DROP TABLE IF EXISTS workspace.gold.fact_sales;