-- ================================================
-- Day 47 - SQL Learning Notes
-- Topic:sql+excel - Day 2
--        Charts Requirement Queries and
--        Excel Pivot Tables Started
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Built all Chart Requirement SQL queries
--   Daily trend for total orders
--   Hourly trend for total orders
--   Percentage of sales by pizza category
--   Percentage of sales by pizza size
--   Percentage of sales by quarter
--   Total pizzas sold per category
--   Top 5 best sellers
--   Bottom 5 sellers using window function
-- Imported data directly from SQL Server
--   to Excel
-- Started building Pivot Tables in Excel
-- Created KPI cards using Pivot Tables
-- Dashboard build expected tomorrow!

-- ================================================
-- PIZZA DASHBOARD PROJECT - DAY 2
-- ================================================

-- ================================================
-- CHARTS REQUIREMENT QUERIES
-- ================================================

-- ------------------------------------------------
-- 1. DAILY TREND FOR TOTAL ORDERS
-- ------------------------------------------------

-- Find total orders for each day of the week
-- Goal: See which days have most orders

SELECT
    FORMAT(order_date, 'dddd')        AS day_name,
    COUNT(DISTINCT order_id)          AS total_pizza_sale
FROM pizza_sales
GROUP BY
    FORMAT(order_date, 'dddd'),
    DATEPART(WEEKDAY, order_date)
    -- Grouping with DATEPART WEEKDAY too
    -- so we get days in correct order
    -- Sunday Monday Tuesday ... Saturday
ORDER BY DATEPART(WEEKDAY, order_date);

-- MySQL Equivalent Functions:
-- DAYNAME(order_date)   = gets day name
-- DAYOFWEEK(order_date) = gets day number
--                          for correct ordering

-- ------------------------------------------------
-- 2. HOURLY TREND FOR TOTAL ORDERS
-- ------------------------------------------------

-- Find total orders for each hour of day
-- Goal: See peak ordering hours

SELECT
    DATEPART(HOUR, order_time)        AS order_hour,
    COUNT(DISTINCT order_id)          AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hour;

-- DATEPART(HOUR, time_column)
-- extracts hour from time value
-- Example: DATEPART(HOUR, '2023-04-09 12:34:45')
-- returns 12

-- ------------------------------------------------
-- 3. PERCENTAGE OF SALES BY PIZZA CATEGORY
-- ------------------------------------------------

-- For January month only
-- Goal: Find each category's share of total sales

WITH duplicate AS
(
    SELECT
        pizza_category,
        ROUND(SUM(total_price), 0)            AS total_sales,
        ROUND(SUM(SUM(total_price)) OVER(), 0) AS overall_sales
    FROM pizza_sales
    WHERE MONTH(order_date) = 1    -- January
    GROUP BY pizza_category
)
SELECT
    pizza_category,
    total_sales,
    overall_sales,
    CONCAT(
        ROUND(
            (CAST(total_sales AS FLOAT) /
             overall_sales) * 100, 1
        ), '%'
    ) AS category_percent_sales
FROM duplicate;

-- ------------------------------------------------
-- 4. PERCENTAGE OF SALES BY PIZZA SIZE
-- ------------------------------------------------

WITH duplicate AS
(
    SELECT
        pizza_size,
        ROUND(SUM(total_price), 0)            AS total_sales,
        ROUND(SUM(SUM(total_price)) OVER(), 0) AS overall_sales
    FROM pizza_sales
    GROUP BY pizza_size
)
SELECT
    pizza_size,
    total_sales,
    overall_sales,
    CONCAT(
        ROUND(
            (CAST(total_sales AS FLOAT) /
             overall_sales) * 100, 1
        ), '%'
    ) AS category_percent_sales
FROM duplicate
ORDER BY category_percent_sales DESC;

-- ------------------------------------------------
-- SAME ANALYSIS BY QUARTER
-- ------------------------------------------------

-- Filter by Quarter 1 (first 3 months)

WITH duplicate AS
(
    SELECT
        pizza_size,
        ROUND(SUM(total_price), 0)            AS total_sales,
        ROUND(SUM(SUM(total_price)) OVER(), 0) AS overall_sales
    FROM pizza_sales
    WHERE DATEPART(QUARTER, order_date) = 1
    -- Quarter 1 = January February March
    GROUP BY pizza_size
)
SELECT
    pizza_size,
    total_sales,
    overall_sales,
    CONCAT(
        ROUND(
            (CAST(total_sales AS FLOAT) /
             overall_sales) * 100, 1
        ), '%'
    ) AS category_percent_sales
FROM duplicate
ORDER BY category_percent_sales DESC;

-- ------------------------------------------------
-- 5. TOTAL PIZZAS SOLD PER CATEGORY
-- ------------------------------------------------

SELECT
    pizza_category,
    SUM(quantity) AS total_pizzas
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas DESC;

-- ------------------------------------------------
-- 6. TOP 5 BEST SELLERS BY PIZZAS SOLD
-- ------------------------------------------------

SELECT TOP 5
    pizza_name,
    SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold DESC;

-- ------------------------------------------------
-- 7. BOTTOM 5 SELLERS USING WINDOW FUNCTION
-- ------------------------------------------------

-- More flexible method using RANK
-- Useful when extra details are needed

SELECT *
FROM
(
    SELECT
        pizza_name,
        SUM(quantity) AS total_quantity,
        RANK() OVER(
            ORDER BY SUM(quantity)
        ) AS ranking
        -- No DESC means ascending
        -- so rank 1 = lowest quantity sold
    FROM pizza_sales
    GROUP BY pizza_name
) t
WHERE ranking <= 5;

-- ================================================
-- EXCEL DASHBOARD WORK STARTED
-- ================================================

-- Imported data directly from SQL Server
-- into Excel using Data connection feature
-- No need to manually export/import CSV

-- ------------------------------------------------
-- PIVOT TABLE TRICK LEARNED
-- ------------------------------------------------

-- Problem: total_order column has duplicate
-- order_id values (multiple pizzas per order)
-- Simple SUM would count orders multiple times

-- Solution: Calculated field trick
-- =1/COUNT(total_order)
-- This way each order is counted as
-- exactly 1 no matter how many pizza
-- rows belong to that same order
-- Then SUM of this field = exact unique
-- order count inside Pivot Table

-- ------------------------------------------------
-- KPI CARDS CREATED IN EXCEL
-- ------------------------------------------------

-- Built using Pivot Table values:
-- Total Revenue
-- Total Orders          (using 1/COUNT trick)
-- Average Pizzas per Order
-- Average Order Value
-- Total Pizzas Sold

-- ================================================
-- KEY LEARNINGS FROM TODAY
-- ================================================

-- FORMAT(date, 'dddd')
--   Gives full day name like Monday Tuesday
--   Text result so sorting may be wrong
--   Must group/order with DATEPART WEEKDAY too

-- DATEPART(WEEKDAY, date)
--   Gives day as a number Sunday=1 Monday=2
--   Used to sort days in correct calendar order

-- DATEPART(HOUR, time)
--   Extracts hour value from time column
--   Useful for hourly trend analysis

-- DATEPART(QUARTER, date)
--   Gives quarter number 1 2 3 or 4
--   Quarter 1 = Jan Feb Mar
--   Quarter 2 = Apr May Jun

-- WINDOW FUNCTION FOR PERCENTAGE
--   SUM(SUM(col)) OVER() = grand total
--   Used to calculate % share by category

-- RANK() WITHOUT DESC
--   Default order is ascending
--   Useful to find bottom performers
--   RANK() OVER(ORDER BY col DESC) for top
--   RANK() OVER(ORDER BY col) for bottom

-- EXCEL PIVOT TABLE 1/COUNT TRICK
--   Prevents double counting of orders
--   when multiple rows share same order_id
--   =1/COUNT(order_id) then SUM it
--   Gives accurate unique order count

-- ================================================
-- PIZZA DASHBOARD PROJECT STATUS
-- ================================================

-- SQL Analysis Phase                  ✅ Done
--   Q1-Q5 Basic KPIs                  ✅
--   Daily Trend                       ✅
--   Hourly Trend                      ✅
--   Category Percentage               ✅
--   Size Percentage                   ✅
--   Quarter Analysis                  ✅
--   Top 5 Best Sellers                ✅
--   Bottom 5 Sellers                  ✅

-- Excel Phase                         🔄 Started
--   Data imported from SQL Server     ✅
--   Pivot Tables created              ✅
--   KPI cards created                 ✅
--   Dashboard build                   ⏳ Tomorrow

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Built 8 chart requirement SQL queries
-- Learned DATEPART for day hour quarter
-- Learned window function percentage trick
-- Learned RANK for top and bottom analysis
-- Connected SQL Server directly to Excel
-- Built Pivot Tables with 1/COUNT trick
-- Created 5 KPI cards in Excel


-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Build the complete Dashboard in Excel
-- Add charts for all chart requirements
-- Add slicers for interactivity
-- Finalize Pizza Dashboard Project
-- Write README and upload to GitHub