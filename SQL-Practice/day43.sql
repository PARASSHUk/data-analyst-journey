-- ================================================
-- Day 43 - SQL Learning Notes
-- Topic: Advanced SQL Project - Day 2
--        Change Over Time, Cumulative Analysis
--        and Performance Analysis Started
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Completed Step 1 - Change Over Time Analysis
--   Sales performance by year
--   Sales performance by month
--   Filtered months with high quantity using CTE
--   Learned DATETRUNC function
--   Learned FORMAT function for date display
-- Completed Step 2 - Cumulative Analysis
--   Running total of sales using window function
--   Running average price using window function
-- Started Step 3 - Performance Analysis
--   Planned product yearly performance comparison

-- ================================================
-- ADVANCED PROJECT - DAY 2
-- ================================================

USE DataWarehouseAnalytics;

-- ================================================
-- STEP 1 - CHANGE OVER TIME ANALYSIS
-- ================================================

-- Goal:
-- Analyze how a measure evolves over time
-- Track trends and identify seasonality
-- Formula: [Measure] by [Date Dimension]
-- Example: Total Sales by Year
-- Example: Average Cost by Month

-- ------------------------------------------------
-- SALES PERFORMANCE BY YEAR
-- ------------------------------------------------

-- High level overview insight
-- Helps with strategic decision making

SELECT
    YEAR(order_date)            AS order_year,
    SUM(sales_amount)           AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity)                AS total_quantity
FROM sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date);

-- ------------------------------------------------
-- SALES PERFORMANCE BY MONTH
-- ------------------------------------------------

-- Detailed insight to discover seasonality

SELECT
    YEAR(order_date)             AS order_year,
    MONTH(order_date)            AS order_month,
    SUM(sales_amount)            AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity)                AS total_quantity
FROM sales
WHERE order_date IS NOT NULL
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;

-- ------------------------------------------------
-- MONTHS WITH HIGH QUANTITY SOLD
-- ------------------------------------------------

-- Find total monthly sales where
-- quantity sold is more than 5000
-- Using CTE for cleaner query

WITH duplicate AS
(
    SELECT
        MONTH(order_date)            AS total_month,
        -- Note: In SQL Server cannot use
        -- ORDER BY inside CTE, only in main query
        SUM(sales_amount)             AS total_sales,
        COUNT(DISTINCT customer_key)  AS total_customer,
        -- COUNT DISTINCT works in MySQL too
        SUM(quantity)                 AS total_quantity
    FROM sales
    WHERE order_date IS NOT NULL
    GROUP BY MONTH(order_date)
)
SELECT
    total_month,
    total_sales,
    total_quantity
FROM duplicate
WHERE total_quantity > 5000
ORDER BY total_month;

-- ------------------------------------------------
-- USING DATETRUNC FUNCTION
-- ------------------------------------------------

-- DATETRUNC rounds date to specified part
-- Avoids writing YEAR and MONTH separately
-- Cleaner way to group by month

SELECT
    DATETRUNC(MONTH, order_date) AS order_month,
    SUM(sales_amount)            AS total_amount,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity)                AS total_quantity
FROM sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH, order_date)
ORDER BY DATETRUNC(MONTH, order_date);

-- ------------------------------------------------
-- USING FORMAT FOR READABLE MONTH NAMES
-- ------------------------------------------------

-- FORMAT converts date to string format
-- 'yyyy-MMM' gives Year-MonthName format
-- Example: 2024-Jan 2024-Feb

-- Note: When using FORMAT result is TEXT
-- so sorting may not be in correct order
-- because text sorting is alphabetical
-- not chronological

SELECT
    FORMAT(order_date, 'yyyy-MMM') AS order_month,
    SUM(sales_amount)              AS total_amount,
    COUNT(customer_key)            AS total_customers,
    SUM(quantity)                  AS total_quantity
FROM sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');

-- ================================================
-- STEP 2 - CUMULATIVE ANALYSIS
-- ================================================

-- Goal:
-- Aggregate data progressively over time
-- Very important technique to understand
-- if business is growing or declining

-- Formula: {Cumulative Measure} by {Date Dimension}
-- Example: Running Total Sales by Year
-- Example: Moving Average of Sales by Month

-- ------------------------------------------------
-- RUNNING TOTAL OF SALES BY MONTH
-- ------------------------------------------------

-- Calculate total sales per month
-- and running total of sales over time

SELECT
    month_date,
    total_sales,
    -- Window function SUM adds each row
    -- value as sum of all previous values
    -- This happens because of default
    -- window frame which is:
    -- BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    SUM(total_sales) OVER(
        ORDER BY month_date
    ) AS running_total
FROM
(
    SELECT
        DATETRUNC(MONTH, order_date) AS month_date,
        SUM(sales_amount)            AS total_sales
    FROM sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(MONTH, order_date)
) t
ORDER BY month_date;

-- ------------------------------------------------
-- RUNNING TOTAL AND RUNNING AVERAGE BY YEAR
-- ------------------------------------------------

-- Calculate average price per year
-- and running average price per year

SELECT
    years,
    total_sales,
    SUM(total_sales) OVER(
        ORDER BY years
    ) AS running_total_sales,
    AVG(average_price) OVER(
        ORDER BY years
    ) AS average_running_price
FROM
(
    SELECT
        DATETRUNC(YEAR, order_date) AS years,
        SUM(sales_amount)           AS total_sales,
        AVG(price)                  AS average_price
    FROM sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(YEAR, order_date)
) t;

-- ================================================
-- STEP 3 - PERFORMANCE ANALYSIS (STARTED)
-- ================================================

-- Goal:
-- Compare current value with target value
-- Helps measure success and compare performance

-- Formula:
-- CURRENT [Measure] - TARGET [Measure]
-- Example: Current Sales - Average Sales
-- Example: Current Sales - Previous Year Sales

-- Plan for Tomorrow:
-- Analyze yearly performance of products
-- Compare each product's sales to:
--   1. Its own average sales performance
--   2. The previous year's sales

-- ================================================
-- KEY LEARNINGS FROM TODAY
-- ================================================

-- DATETRUNC(MONTH, date)
--   Rounds date to start of month
--   DATETRUNC(YEAR, date) rounds to start of year
--   Avoids writing YEAR() and MONTH() separately
--   Cleaner grouping by time period

-- FORMAT(date, 'yyyy-MMM')
--   Converts date to readable text
--   yyyy = 4 digit year
--   MMM  = 3 letter month name
--   Result is TEXT so sorting may be wrong
--   Sort by the FORMAT expression itself

-- WINDOW FUNCTION SUM() OVER(ORDER BY ...)
--   Creates running total
--   Default frame = UNBOUNDED PRECEDING
--                    to CURRENT ROW
--   Each row adds to sum of all previous rows

-- WINDOW FUNCTION AVG() OVER(ORDER BY ...)
--   Creates running average
--   Same default frame as SUM
--   Useful for trend analysis

-- CTE LIMITATION IN SQL SERVER
--   Cannot use ORDER BY inside CTE
--   ORDER BY only allowed in main query
--   MySQL is more flexible with this

-- CHANGE OVER TIME vs CUMULATIVE ANALYSIS
--   Change Over Time = values per period
--   Cumulative = running total across periods
--   Both use date dimension for grouping

-- ================================================
-- ADVANCED PROJECT STATUS
-- ================================================

-- Setup
--   Database connected               ✅
--   Tables renamed for clarity        ✅

-- Step 1 = Change Over Time           ✅ Done
--   Yearly sales performance          ✅
--   Monthly sales performance         ✅
--   High quantity months filtered     ✅
--   DATETRUNC and FORMAT learned       ✅

-- Step 2 = Cumulative Analysis        ✅ Done
--   Running total sales by month      ✅
--   Running total and avg by year     ✅

-- Step 3 = Performance Analysis       🔄 Started
--   Product yearly performance        ⏳ Tomorrow

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Completed Change Over Time Analysis
-- Completed Cumulative Analysis
-- Started Performance Analysis
-- Learned DATETRUNC and FORMAT functions
-- Learned Window Functions for running totals
-- Learned SQL Server CTE limitations

-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Complete Step 3 Performance Analysis
--   Compare product sales to average sales
--   Compare product sales to previous year
--   Use LAG window function for year over year
-- Continue Advanced SQL Project
-- More techniques to explore:
--   Step 4 = Part to Whole Analysis
--   Step 5 = Data Segmentation