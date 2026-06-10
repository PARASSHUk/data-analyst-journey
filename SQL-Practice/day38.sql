-- ================================================
-- Day 38 - SQL Learning Notes
-- Topic: EDA Project Continuation
--        Database Exploration, Dimension
--        Exploration and Date Exploration
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Revised EDA concepts from yesterday
-- Continued EDA Project
-- Completed Step 1 - Database Exploration
-- Completed Step 2 - Dimension Exploration
-- Completed Step 3 - Date Exploration
-- EDA Project finishing tomorrow!
-- Data Cleaning with SQL starts after!

-- ================================================
-- EDA PROJECT - DAY 2
-- ================================================

-- Project Name: EDA Using SQL
-- Database: DataWarehouse
-- Status: In Progress
-- Steps Completed Today: 1 2 and 3

USE datawarehouse;

-- ================================================
-- STEP 1 - DATABASE EXPLORATION
-- ================================================

-- Goal:
-- Explore all objects in the database
-- Understand what tables exist
-- Understand what columns each table has

-- Explore all tables in the database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;
-- Shows all tables available in database
-- Helps understand the full database structure

-- ------------------------------------------------

-- Explore all columns in customer table
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer';
-- Shows all column names and data types
-- Helps identify dimensions and measures
-- Very useful when exploring unknown databases

-- ================================================
-- STEP 2 - DIMENSIONS EXPLORATION
-- ================================================

-- Goal:
-- Identify unique values in each dimension
-- Recognize how data can be grouped
-- Understand categories and segments
-- Useful for later analysis and charts

-- ------------------------------------------------
-- Explore all countries
-- Find where our customers come from
SELECT DISTINCT country
FROM customer;
-- Shows all unique countries in customer table
-- Used for geographical segmentation
-- This is a DIMENSION column

-- ------------------------------------------------

-- Explore all product categories
-- Find the major product divisions
SELECT DISTINCT category
FROM products;
-- Shows all unique product categories
-- Used for product segmentation
-- This is a DIMENSION column

-- ------------------------------------------------

-- Explore categories with subcategories
-- Understand the product hierarchy
SELECT DISTINCT
    category,
    subcategory
FROM products;
-- Shows category and subcategory together
-- Helps understand product structure

-- ------------------------------------------------

-- SQL TASK
-- Explore all product categories
-- the major divisions with full detail
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM products
ORDER BY 1, 2, 3;
-- ORDER BY 1,2,3 means
-- order by first second and third column
-- Shows complete product hierarchy
-- category > subcategory > product_name

-- ================================================
-- STEP 3 - DATE EXPLORATION
-- ================================================

-- Goal:
-- Identify earliest and latest dates
-- Understand scope and timespan of data
-- Know the boundaries of our dataset

-- ------------------------------------------------

-- Find first and last order date
-- How many years of sales data available
SELECT
    MIN(order_date)     AS first_order_date,
    MAX(order_date)     AS last_order_date,
    ABS(DATEDIFF(
        YEAR,
        MAX(order_date),
        MIN(order_date)
    ))                  AS order_range_years
FROM sales;

-- Important Note Learned Today:
-- Aliases created after SELECT execution
-- So aliases are NOT available inside
-- the same SELECT statement
-- That is why we use ABS(DATEDIFF(...))
-- directly instead of using alias

-- ------------------------------------------------

-- Find first and last shipping date
-- Understand shipping time boundaries
SELECT
    MIN(shipping_date)  AS first_shipping_date,
    MAX(shipping_date)  AS last_shipping_date,
    ABS(DATEDIFF(
        DAY,
        MAX(shipping_date),
        MIN(shipping_date)
    ))                  AS shipping_range_days
FROM sales;

-- ------------------------------------------------

-- Find youngest and oldest customers
-- Understand customer age range
SELECT
    MIN(birthdate)                              AS oldest_birthdate,
    DATEDIFF(
        YEAR,
        MIN(birthdate),
        GETDATE())                              AS oldest_age,
    MAX(birthdate)                              AS youngest_birthdate,
    DATEDIFF(
        YEAR,
        MAX(birthdate),
        GETDATE())                              AS youngest_age,
    DATEDIFF(
        YEAR,
        MIN(birthdate),
        MAX(birthdate))                         AS age_difference
FROM customer;

-- What this tells us:
-- MIN(birthdate) = oldest person born earliest
-- MAX(birthdate) = youngest person born latest
-- GETDATE()      = current date in SQL Server
-- DATEDIFF YEAR  = calculates age in years
-- age_difference = range between oldest
--                  and youngest customer

-- ================================================
-- KEY LEARNINGS FROM TODAY
-- ================================================

-- INFORMATION_SCHEMA.TABLES
--   Shows all tables in the database
--   Use to explore unknown databases

-- INFORMATION_SCHEMA.COLUMNS
--   Shows all columns of a specific table
--   Shows data types of each column
--   WHERE TABLE_NAME = 'table' to filter

-- SELECT DISTINCT
--   Shows only unique values
--   Used for dimension exploration
--   Helps understand categories

-- ORDER BY 1,2,3
--   Orders by column position number
--   1 = first column
--   2 = second column
--   3 = third column
--   Shortcut instead of writing column names

-- ABS()
--   Returns absolute value
--   Removes negative sign from result
--   Used with DATEDIFF to avoid negatives

-- ALIASES IN SELECT
--   Aliases created AFTER SELECT runs
--   Cannot use alias in same SELECT
--   Must repeat the expression instead

-- GETDATE()
--   Returns current date in SQL Server
--   Same as NOW() in MySQL
--   Used to calculate age from birthdate

-- ================================================
-- EDA STEPS COMPLETED SO FAR
-- ================================================

-- Step 1 = Database Exploration    
--   INFORMATION_SCHEMA explored
-- Step 2 = Dimension Exploration   
--   Unique countries found
--   Product hierarchy explored
-- Step 3 = Date Exploration        
--   Order date boundaries found
--   Shipping date boundaries found
--   Customer age range found

-- ================================================
-- EDA STEPS REMAINING FOR TOMORROW
-- ================================================

-- Step 4 = Measure Exploration
--   Find MIN MAX AVG SUM for all measures
--   Understand numeric column ranges

-- Step 5 = Magnitude Analysis
--   Find total counts per dimension
--   How much data in each category

-- Step 6 = Ranking Analysis
--   Find top and bottom performers
--   Use ORDER BY LIMIT Window Functions

-- Step 7 = Time Series Analysis
--   Find trends over time
--   GROUP BY with date functions

-- ================================================
-- WHAT COMES AFTER EDA PROJECT
-- ================================================

-- Data Cleaning with SQL!
-- Step 1 = Handle NULL values
-- Step 2 = Remove duplicates
-- Step 3 = Fix data types
-- Step 4 = Standardize text
-- Step 5 = Handle outliers
-- Step 6 = Validate data

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Revised EDA concepts from yesterday
-- Completed Database Exploration
-- Completed Dimension Exploration
-- Completed Date Exploration
-- Learned about aliases in SELECT
-- Learned ORDER BY column position
-- Learned GETDATE vs NOW difference
-- GitHub streak maintained day 38 
-- EDA Project finishing tomorrow!
-- Data Cleaning starts day after!

-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Complete EDA Project
-- Step 4 Measure Exploration
-- Step 5 Magnitude Analysis
-- Step 6 Ranking Analysis
-- Step 7 Time Series Analysis
-- Write README for EDA Project
-- Upload to SQL-Projects on GitHub
-- Start learning Data Cleaning with SQL!