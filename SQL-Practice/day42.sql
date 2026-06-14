-- ================================================
-- Day 42 - SQL Learning Notes
-- Topic: Advanced SQL Project Started
--        Renaming Tables and
--        Change Over Time Analysis
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Started Advanced SQL Project
-- Database: DataWarehouseAnalytics
-- Renamed long table names to short names
-- Started Step 1 - Change Over Time Analysis
-- Learned sp_rename system stored procedure

-- ================================================
-- ADVANCED PROJECT - DAY 1
-- ================================================

-- Project Name: Advanced SQL Analysis
-- Database: DataWarehouseAnalytics
-- Status: In Progress

USE DataWarehouseAnalytics;

-- Preview original tables with long names
SELECT * FROM [dbo].[dim_customers];
SELECT * FROM dbo.dim_products;
SELECT * FROM dbo.fact_sales;

-- ================================================
-- RENAMING TABLES FOR EASIER USE
-- ================================================

-- The original table names are too long
-- dim_customers dim_products fact_sales
-- Renaming them to shorter names

-- ------------------------------------------------
-- sp_rename - SQL Server Way
-- ------------------------------------------------

-- sp_rename is a system stored procedure
-- provided by SQL Server to rename objects
-- Syntax: sp_rename 'old_name', 'new_name'

EXECUTE sp_rename 'dbo.dim_customers', 'customers';
SELECT * FROM customers;

EXECUTE sp_rename 'dbo.dim_products', 'products';
SELECT * FROM products;

EXECUTE sp_rename 'dbo.fact_sales', 'sales';
SELECT * FROM sales;

-- ------------------------------------------------
-- MySQL Equivalent (for reference)
-- ------------------------------------------------

-- In MySQL renaming a table is done as:
-- ALTER TABLE dbo.dim_products RENAME TO products;

-- Note:
-- sp_rename     = SQL Server way
-- ALTER RENAME  = MySQL way

-- ================================================
-- ADVANCED ANALYSIS PROJECT
-- ================================================

-- ================================================
-- STEP 1 - CHANGE OVER TIME ANALYSIS
-- ================================================

-- Goal:
-- Analyze how a measure evolves over time
-- Helps track trends in the business
-- Helps identify seasonality patterns

-- Formula:
-- [Measure] by [Date Dimension]

-- Examples:
-- Total Sales by Year
-- Average Cost by Month
-- Total Orders by Quarter

-- ------------------------------------------------
-- SALES PERFORMANCE OVER TIME
-- ------------------------------------------------

-- This section will analyze how sales
-- have changed across different time periods
-- Will continue building this analysis tomorrow

-- Plan for tomorrow:
-- Total sales by year
-- Total sales by month
-- Year over year growth
-- Month over month comparison

-- ================================================
-- KEY LEARNINGS FROM TODAY
-- ================================================

-- sp_rename
--   System stored procedure in SQL Server
--   Used to rename tables columns and objects
--   Syntax: EXECUTE sp_rename 'old', 'new'
--   Makes long table names easier to work with

-- ALTER TABLE RENAME TO
--   MySQL equivalent for renaming tables
--   Different syntax than SQL Server

-- CHANGE OVER TIME ANALYSIS
--   New analysis technique learned
--   Formula = Measure by Date Dimension
--   Helps find trends and seasonality
--   Foundation for time series analysis

-- ================================================
-- ADVANCED PROJECT STATUS
-- ================================================

-- Setup
--   Database connected               ✅
--   Tables renamed for clarity        ✅

-- Step 1 = Change Over Time           🔄 Started
--   Sales performance over time       ⏳ In Progress

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Started new Advanced SQL Project
-- Renamed 3 tables to shorter names
-- Learned sp_rename procedure
-- Started Change Over Time analysis concept
-- Planned sales performance over time queries


-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Continue Change Over Time Analysis
-- Find total sales by year
-- Find total sales by month
-- Find year over year growth
-- Build sales performance over time queries
-- Continue Advanced SQL Project