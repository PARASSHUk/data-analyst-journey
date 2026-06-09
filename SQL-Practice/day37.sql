-- ================================================
-- Day 37 - SQL Learning Notes
-- Topic: SQL Revision and EDA Project Started
--        Dimension vs Measure Analysis

-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Revised all SQL topics
-- Started EDA Project with SQL
-- Learned secret trick to analyse data
-- Learned difference between
--   Dimension and Measure
-- Practiced on DataWarehouse database
-- Explored customer products and sales tables

-- ================================================
-- EDA PROJECT - DAY 1
-- ================================================

-- Project Name: EDA Using SQL
-- Database: DataWarehouse
-- Status: In Progress
-- Tables: customer, products, sales

-- ================================================
-- SECRET TRICK TO ANALYSE DATA
-- ================================================

-- Divide all columns into 2 categories
-- 1. DIMENSION
-- 2. MEASURE

-- HOW TO DECIDE WHICH CATEGORY

-- Rule 1 - Check Data Type
--   If data type is NUMERIC  = MEASURE
--   If data type is TEXT     = DIMENSION

-- Rule 2 - Does Aggregation Make Sense?
--   If YES aggregation makes sense = MEASURE
--   If NO  aggregation makes sense = DIMENSION

-- KEY INSIGHT
-- customer_id is numeric BUT
-- aggregating customer_id does NOT make sense
-- so it is a DIMENSION not a MEASURE!
-- Always use Rule 2 to confirm!

-- WHY THIS MATTERS
-- DIMENSIONS = used on sides of charts
--              used in GROUP BY
--              used as row headers in tables
--              example: category country product
-- MEASURES   = used as main data values
--              tells how much how many
--              example: sales quantity age
--              used in SUM AVG MAX MIN COUNT

-- ================================================
-- SELECT DATABASE
-- ================================================

USE datawarehouse;

-- ================================================
-- STEP 1 - EXPLORE TABLES
-- ================================================

-- Preview customer table
SELECT * FROM customer;

-- Preview products table
SELECT * FROM products;

-- Preview sales table
SELECT * FROM sales;

-- ================================================
-- STEP 2 - IDENTIFY DIMENSIONS AND MEASURES
-- ================================================

-- ------------------------------------------------
-- DIMENSIONS IDENTIFIED
-- ------------------------------------------------

-- category column in products table
-- It is TEXT so it is a DIMENSION
-- Aggregating category does NOT make sense
SELECT DISTINCT
    category
FROM products;
-- Result: Shows unique product categories
-- This is used to GROUP and SEGMENT data

-- ------------------------------------------------

-- product_name column in products table
-- It is TEXT so it is a DIMENSION
-- Aggregating product names does NOT make sense
SELECT DISTINCT
    product_name
FROM products;
-- Result: Shows all unique product names
-- Used on X axis of charts or as row labels

-- ------------------------------------------------

-- customer_id column in customer table
-- It is NUMERIC but DIMENSION
-- Aggregating customer_id does NOT make sense
-- SUM of customer IDs has no business meaning
SELECT DISTINCT
    customer_id
FROM customer;
-- Result: Shows all unique customer IDs
-- Numeric but used for identification only
-- Rule 2 confirms it is DIMENSION not MEASURE

-- ------------------------------------------------
-- MEASURES IDENTIFIED
-- ------------------------------------------------

-- sales_amount column in sales table
-- It is NUMERIC and MEASURE
-- Aggregating sales makes complete sense
-- SUM AVG MAX MIN of sales = business insight
SELECT DISTINCT
    sales_amount
FROM sales;
-- Result: Shows unique sales values
-- This is used in SUM AVG MAX MIN calculations

-- ------------------------------------------------

-- quantity column in sales table
-- It is NUMERIC and MEASURE
-- Aggregating quantity makes sense
-- SUM of quantity = total items sold
SELECT DISTINCT
    quantity
FROM sales;
-- Result: Shows unique quantity values
-- Used in SUM AVG calculations

-- ------------------------------------------------

-- age column calculated from birthdate
-- It is NUMERIC and MEASURE
-- Aggregating age makes sense
-- AVG age = average customer age
SELECT DISTINCT
    DATEDIFF(YEAR, birthdate, GETDATE()) AS age
FROM customer;
-- Result: Shows unique customer ages
-- DATEDIFF calculates age from birthdate
-- Note: GETDATE() used in SQL Server
--       Use NOW() in MySQL

-- ================================================
-- DIMENSION VS MEASURE SUMMARY TABLE
-- ================================================

-- DIMENSIONS FOUND
-- category     = text    = dimension ✅
-- product_name = text    = dimension ✅
-- customer_id  = numeric = dimension ✅
--               (aggregation makes no sense)

-- MEASURES FOUND
-- sales_amount = numeric = measure ✅
--               (SUM AVG MAX MIN make sense)
-- quantity     = numeric = measure ✅
--               (SUM AVG MAX MIN make sense)
-- age          = numeric = measure ✅
--               (AVG age makes sense)

-- ================================================
-- KEY LEARNINGS FROM EDA TODAY
-- ================================================

-- Not all numeric columns are MEASURES!
-- customer_id is numeric but is a DIMENSION
-- Always ask: Does aggregation make sense?
-- If YES = MEASURE
-- If NO  = DIMENSION

-- DIMENSIONS are used for:
-- Grouping data in GROUP BY
-- Filtering data in WHERE
-- Labeling axes in charts
-- Row headers in tables
-- Segmenting data

-- MEASURES are used for:
-- Calculating totals SUM
-- Finding averages AVG
-- Finding extremes MAX MIN
-- Counting records COUNT
-- Main values in charts

-- ================================================
-- WHAT I WILL DO NEXT IN EDA PROJECT
-- ================================================

-- Database Exploration
--   Explore all tables using INFORMATION_SCHEMA
--   Find all columns and their data types

-- Dimension Exploration
--   Find all unique values in dimension columns
--   Understand categories and segments

-- Measure Exploration
--   Find MIN MAX AVG SUM for all measures
--   Understand the range of numeric data

-- Date Exploration
--   Find earliest and latest dates
--   Understand time boundaries of data

-- Magnitude Analysis
--   Find total counts per dimension
--   How much data exists in each category

-- Ranking Analysis
--   Find top and bottom performers
--   Use ORDER BY LIMIT and Window Functions

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Revised all SQL topics
-- Started EDA Project successfully
-- Learned Dimension vs Measure concept
-- Identified dimensions and measures
--   in customer products and sales tables
-- Practiced SELECT DISTINCT on all columns
-- Understood why customer_id is DIMENSION


-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Continue EDA Project
-- Database Exploration with INFORMATION_SCHEMA
-- Dimension Exploration in detail
-- Measure Exploration MIN MAX AVG SUM
-- Date Exploration earliest and latest
