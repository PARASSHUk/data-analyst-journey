-- ================================================
-- Day 16 - SQL Learning Notes
-- Topic: Exploratory Data Analysis (EDA) with SQL
-- Project: EDA Using SQL - Data Warehouse
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Started EDA Project with SQL
-- Learned secret trick to analyse data
-- Learned difference between Dimension and Measure
-- Learned Database Exploration techniques
-- Learned Dimension Exploration
-- Learned Date Exploration
-- Used INFORMATION_SCHEMA to explore database

-- ================================================
-- EDA WITH SQL - KEY CONCEPTS LEARNED
-- ================================================

-- ------------------------------------------------
-- SECRET TRICK TO ANALYSE DATA
-- ------------------------------------------------

-- Divide all columns into 2 categories:
-- 1. DIMENSION
-- 2. MEASURE

-- HOW TO DECIDE WHICH CATEGORY:

-- Rule 1 - Check Data Type
--   If data type is NUMERIC  = MEASURE
--   If data type is TEXT     = DIMENSION

-- Rule 2 - Does Aggregation Make Sense?
--   If YES aggregation makes sense = MEASURE
--   If NO  aggregation makes sense = DIMENSION

-- Examples:
--   sales_amount = MEASURE  (can SUM AVG MAX MIN)
--   category     = DIMENSION (cannot SUM a category)
--   quantity     = MEASURE  (can SUM quantities)
--   country      = DIMENSION (cannot SUM a country)
--   price        = MEASURE  (can AVG prices)
--   product_name = DIMENSION (cannot AVG a name)

-- WHY THIS MATTERS:
-- TO GROUP DATA   = use DIMENSIONS
-- TO SLICE DATA   = use DIMENSIONS
-- IN CHARTS       = DIMENSIONS on X axis
-- IN TABLES       = DIMENSIONS as row headers
-- TO CALCULATE    = use MEASURES as values

-- ================================================
-- EDA PROJECT - DATA WAREHOUSE DATABASE
-- ================================================

-- Select the database
USE datawarehouse;

-- ------------------------------------------------
-- STEP 1 - DATABASE EXPLORATION
-- ------------------------------------------------

-- Explore all tables in the database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Explore all columns in a specific table
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer';

-- ------------------------------------------------
-- STEP 2 - IDENTIFY DIMENSIONS AND MEASURES
-- ------------------------------------------------

-- DIMENSION Example
-- category is text so it is a DIMENSION
-- Aggregating category does not make sense
SELECT DISTINCT category
FROM products;

-- MEASURE Example
-- sales_amount is numeric so it is a MEASURE
-- Aggregating sales_amount makes sense
SELECT DISTINCT sales_amount
FROM sales;

-- ------------------------------------------------
-- STEP 3 - DIMENSION EXPLORATION
-- ------------------------------------------------

-- Dimension Exploration Goals:
-- Identify unique values in each dimension
-- Recognize how data can be grouped
-- Understand segments for later analysis

-- Explore unique countries in customer table
SELECT DISTINCT country
FROM customer;

-- Explore all product categories
-- The major divisions of products
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM products
ORDER BY 1, 2, 3;

-- ------------------------------------------------
-- STEP 4 - DATE EXPLORATION
-- ------------------------------------------------

-- Date Exploration Goals:
-- Identify earliest and latest dates
-- Understand the time boundaries of data
-- Find the data coverage period

-- Find first and last order date
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM sales;

-- Find how many years of data we have
SELECT
    MIN(order_date)                         AS first_order_date,
    MAX(order_date)                         AS last_order_date,
    DATEDIFF(
        MAX(order_date),
        MIN(order_date)
    ) / 365                                 AS years_of_data
FROM sales;

-- ================================================
-- WHAT I WILL EXPLORE NEXT IN EDA PROJECT
-- ================================================

-- Measure Exploration
--   Find MIN MAX AVG of all numeric columns
--   Find total revenue total orders total customers

-- Magnitude Analysis
--   How much data do we have
--   Total rows total unique values

-- Ranking Analysis
--   Top 10 customers by revenue
--   Top 10 products by sales
--   Best performing countries

-- Time Series Analysis
--   Monthly sales trends
--   Yearly growth patterns
--   Seasonal patterns

-- ================================================
-- KEY CONCEPTS SUMMARY
-- ================================================

-- DIMENSION
--   Text based columns
--   Used for grouping and slicing
--   Example: country category product_name
--   Used in: GROUP BY WHERE ORDER BY

-- MEASURE
--   Numeric columns
--   Used for calculations
--   Example: sales_amount quantity price
--   Used in: SUM AVG MAX MIN COUNT

-- INFORMATION_SCHEMA.TABLES
--   Shows all tables in database

-- INFORMATION_SCHEMA.COLUMNS
--   Shows all columns in a specific table
--   Very useful to explore unknown databases

-- ================================================
-- TOMORROW I WILL CONTINUE
-- ================================================

-- Continue EDA Project
-- Explore Measure columns
-- Find MIN MAX AVG of all measures
-- Do Magnitude Analysis
-- Do Ranking Analysis
-- Start Time Series Analysis
-- Upload EDA project to SQL-Projects folder