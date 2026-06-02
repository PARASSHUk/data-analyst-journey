-- ================================================
-- Day 34 - SQL Learning Notes
-- Topic: SQL Revision and Basic EDA Questions
-- Note: Back with full focus after exam break!
--       Zero excuses from today onwards!
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised all SQL topics
-- Solved 5 Basic EDA Questions
-- Practiced Aggregate Functions on real data
-- Learned how to explore Measure columns
-- Used MIN MAX AVG SUM COUNT together

-- ================================================
-- BASIC EDA QUESTIONS SOLVED TODAY
-- ================================================

-- ------------------------------------------------
-- Q1. What is the Minimum Value?
-- ------------------------------------------------

-- Find minimum sales amount
SELECT
    MIN(sales_amount) AS min_sales
FROM sales;

-- Find minimum value in multiple columns
SELECT
    MIN(sales_amount)   AS min_sales,
    MIN(quantity)       AS min_quantity,
    MIN(price)          AS min_price
FROM sales;

-- Find minimum sales per category
SELECT
    category,
    MIN(sales_amount)   AS min_sales
FROM sales
GROUP BY category
ORDER BY min_sales ASC;

-- ------------------------------------------------
-- Q2. What is the Maximum Value?
-- ------------------------------------------------

-- Find maximum sales amount
SELECT
    MAX(sales_amount) AS max_sales
FROM sales;

-- Find maximum value in multiple columns
SELECT
    MAX(sales_amount)   AS max_sales,
    MAX(quantity)       AS max_quantity,
    MAX(price)          AS max_price
FROM sales;

-- Find maximum sales per category
SELECT
    category,
    MAX(sales_amount)   AS max_sales
FROM sales
GROUP BY category
ORDER BY max_sales DESC;

-- ------------------------------------------------
-- Q3. What is the Average Value?
-- ------------------------------------------------

-- Find average sales amount
SELECT
    ROUND(AVG(sales_amount), 2) AS avg_sales
FROM sales;

-- Find average value in multiple columns
SELECT
    ROUND(AVG(sales_amount), 2) AS avg_sales,
    ROUND(AVG(quantity), 2)     AS avg_quantity,
    ROUND(AVG(price), 2)        AS avg_price
FROM sales;

-- Find average sales per category
SELECT
    category,
    ROUND(AVG(sales_amount), 2) AS avg_sales
FROM sales
GROUP BY category
ORDER BY avg_sales DESC;

-- ------------------------------------------------
-- Q4. What is the Total Sum of Sales Revenue?
-- ------------------------------------------------

-- Find total revenue
SELECT
    SUM(sales_amount) AS total_revenue
FROM sales;

-- Find total revenue in multiple columns
SELECT
    SUM(sales_amount)   AS total_revenue,
    SUM(quantity)       AS total_quantity
FROM sales;

-- Find total revenue per category
SELECT
    category,
    SUM(sales_amount)   AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Find total revenue per year
SELECT
    YEAR(order_date)    AS order_year,
    SUM(sales_amount)   AS total_revenue
FROM sales
GROUP BY YEAR(order_date)
ORDER BY order_year ASC;

-- Find total revenue per month
SELECT
    YEAR(order_date)    AS order_year,
    MONTH(order_date)   AS order_month,
    SUM(sales_amount)   AS total_revenue
FROM sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year ASC,
    order_month ASC;

-- ------------------------------------------------
-- Q5. Find COUNT SUM AVG MIN MAX Together
-- ------------------------------------------------

-- Complete EDA summary of sales column
SELECT
    COUNT(*)                        AS total_records,
    COUNT(DISTINCT customer_id)     AS unique_customers,
    COUNT(DISTINCT product_id)      AS unique_products,
    SUM(sales_amount)               AS total_revenue,
    ROUND(AVG(sales_amount), 2)     AS avg_sales,
    MAX(sales_amount)               AS max_sales,
    MIN(sales_amount)               AS min_sales,
    MAX(sales_amount) -
    MIN(sales_amount)               AS sales_range
FROM sales;

-- Complete EDA summary per category
SELECT
    category,
    COUNT(*)                        AS total_records,
    SUM(sales_amount)               AS total_revenue,
    ROUND(AVG(sales_amount), 2)     AS avg_sales,
    MAX(sales_amount)               AS max_sales,
    MIN(sales_amount)               AS min_sales
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Complete EDA summary per year
SELECT
    YEAR(order_date)                AS order_year,
    COUNT(*)                        AS total_orders,
    COUNT(DISTINCT customer_id)     AS unique_customers,
    SUM(sales_amount)               AS total_revenue,
    ROUND(AVG(sales_amount), 2)     AS avg_order_value,
    MAX(sales_amount)               AS max_order,
    MIN(sales_amount)               AS min_order
FROM sales
GROUP BY YEAR(order_date)
ORDER BY order_year ASC;

-- ================================================
-- WHAT I LEARNED FROM EDA TODAY
-- ================================================

-- EDA with SQL helps us understand data quickly
-- Before building any dashboard or report
-- always do EDA first to understand the data

-- BASIC EDA STEPS
-- Step 1 = Find MIN to know lowest value
-- Step 2 = Find MAX to know highest value
-- Step 3 = Find AVG to know typical value
-- Step 4 = Find SUM to know total value
-- Step 5 = Find COUNT to know volume of data

-- WHY EDA IS IMPORTANT
-- Understand data before analysis
-- Find outliers and anomalies
-- Identify patterns and trends
-- Know the boundaries of data
-- Make better business decisions

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Came back after exam break
-- Revised all SQL topics
-- Solved 5 basic EDA questions
-- Practiced MIN MAX AVG SUM COUNT
-- Used GROUP BY with all functions
-- Analyzed data by category and year
-- GitHub comeback starts today 

-- ================================================
-- TOMORROW I WILL PRACTICE
-- ================================================

-- More EDA questions
-- Intermediate EDA analysis
-- Ranking analysis
-- Time series analysis
-- Continue EDA project
-- Upload to SQL-Projects on GitHub