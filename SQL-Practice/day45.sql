-- ================================================
-- Day 45 - SQL Learning Notes
-- Topic: Advanced SQL Project - Day 4
--        Step 6 - Build Customer Report View
-- 
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Completed Step 6 - Build Customer Report
-- Created a VIEW for customer reporting
-- Used multiple CTEs together in one view
-- Combined customer demographics with
--   transaction metrics and KPIs
-- Learned CREATE VIEW syntax rules
-- Project entering final stage tomorrow!

-- ================================================
-- ADVANCED PROJECT - DAY 4
-- ================================================

USE DataWarehouseAnalytics;

-- ================================================
-- STEP 6 - BUILD CUSTOMER REPORT
-- ================================================

/*
========================================================
Customer Report
========================================================
Purpose:
  This report consolidates key customer
  metrics and behaviors

Highlights:
1. Gathers essential fields such as names,
   ages, and transaction details
2. Segments customers into categories
   (VIP, Regular, New) and age groups
3. Aggregates customer level metrics:
   - total orders
   - total sales
   - total quantity purchased
   - total products
   - lifespan (in months)
4. Calculates valuable KPIs:
   - recency (months since last order)
   - average order value
   - average monthly spend
========================================================
*/

-- IMPORTANT LEARNING:
-- CREATE VIEW must be the very first
-- statement in the query batch
-- No other query can come before it
-- otherwise SQL Server throws an error

CREATE VIEW dbo.customer_report AS

-- ------------------------------------------------
-- CTE 1 - BASE QUERY
-- ------------------------------------------------

-- Gathers essential fields such as
-- names, ages, and transaction details
WITH base_query AS
(
    SELECT
        c.customer_number,
        s.order_number,
        s.product_key,
        s.order_date,
        s.sales_amount,
        s.quantity,
        c.customer_key,
        CONCAT(
            c.first_name, ' ', c.last_name
        )                                    AS customer_name,
        DATEDIFF(
            YEAR, birthdate, GETDATE()
        )                                    AS age
    FROM sales s
    LEFT JOIN customers c
    ON s.customer_key = c.customer_key
    WHERE order_number IS NOT NULL
),

-- ------------------------------------------------
-- CTE 2 - CUSTOMER AGGREGATION
-- ------------------------------------------------

-- Aggregates customer level metrics
customer_aggregation AS
(
    SELECT
        customer_key,
        customer_number,
        customer_name,
        age,
        COUNT(DISTINCT order_number)        AS total_orders,
        SUM(sales_amount)                   AS total_sales,
        SUM(quantity)                       AS total_quantity,
        COUNT(DISTINCT product_key)         AS total_products,
        DATEDIFF(
            MONTH,
            MIN(order_date),
            MAX(order_date)
        )                                   AS lifespan,
        MAX(order_date)                     AS last_order
    FROM base_query
    GROUP BY
        customer_key,
        customer_number,
        customer_name,
        age
)

-- ------------------------------------------------
-- FINAL SELECT - BUILD COMPLETE REPORT
-- ------------------------------------------------

-- Segments customers into categories
-- (VIP, Regular, New) and age groups

SELECT
    customer_key,
    customer_number,
    customer_name,
    age,

    -- Age Segmentation
    CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE 'Above 50'
    END AS age_segmentation,

    total_products,
    total_orders,
    total_sales,
    total_quantity,
    lifespan,

    -- Customer Segmentation
    -- VIP needs both conditions true
    CASE
        WHEN lifespan > 12 AND total_sales > 5000
            THEN 'VIP'
        WHEN lifespan > 12 AND total_sales <= 5000
            THEN 'Regular'
        ELSE 'New'
    END AS customer_segmentation,

    last_order,

    -- Recency = months since last order
    -- Important KPI to find inactive customers
    DATEDIFF(
        MONTH, last_order, GETDATE()
    ) AS recency,

    -- Average Order Value
    -- Risky without CASE if total_orders = 0
    -- division by zero would cause error
    total_sales / total_orders AS avg_order_value,

    -- Safe version using CASE WHEN
    CASE
        WHEN total_orders = 0 THEN 0
        ELSE total_sales / total_orders
    END AS avg_order_spending,

    -- Average Monthly Spend
    -- If lifespan is 0 customer bought
    -- everything in less than a month
    -- so use total_sales directly
    CASE
        WHEN lifespan = 0 THEN total_sales
        ELSE total_sales / lifespan
    END AS avg_monthly_spend

FROM customer_aggregation;

-- Verify the view works correctly
SELECT * FROM dbo.customer_report;

-- ================================================
-- KEY LEARNINGS FROM TODAY
-- ================================================

-- CREATE VIEW RULE
--   CREATE VIEW must be first statement
--   No other queries before it allowed
--   Entire CTE chain goes after AS keyword

-- VIEW vs TABLE
--   VIEW = saved query that runs each time
--   No data physically stored in view
--   Always shows latest data automatically
--   Great for reports that update live

-- MULTIPLE CTEs IN ONE QUERY
--   Use comma to separate multiple CTEs
--   WITH cte1 AS (...), cte2 AS (...)
--   Second CTE can reference first CTE
--   Final SELECT uses the last CTE

-- DIVISION BY ZERO PROTECTION
--   Always check denominator before dividing
--   CASE WHEN denominator = 0 THEN 0
--   ELSE actual division
--   Prevents query errors in production

-- RECENCY METRIC
--   Months since customer's last order
--   Important KPI to find inactive customers
--   Low recency = active customer
--   High recency = customer may be churning

-- CUSTOMER REPORT STRUCTURE
--   Demographics (name age)
--   Segmentation (age group customer type)
--   Metrics (orders sales quantity)
--   KPIs (recency avg order avg monthly)

-- ================================================
-- ADVANCED PROJECT STATUS
-- ================================================

-- Setup                                ✅ Done
-- Step 1 = Change Over Time            ✅ Done
-- Step 2 = Cumulative Analysis         ✅ Done
-- Step 3 = Performance Analysis        ✅ Done
-- Step 4 = Part-To-Whole Analysis      ✅ Done
-- Step 5 = Data Segmentation           ✅ Done
-- Step 6 = Customer Report             ✅ Done
-- Step 7 = Product Report              ⏳ Tomorrow

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Built complete Customer Report VIEW
-- Combined 2 CTEs in single query
-- Added age and customer segmentation
-- Added recency average order value
-- Added average monthly spend KPI
-- Learned CREATE VIEW syntax rules
-- Learned division by zero protection
-- Project finishing tomorrow!

-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Build Product Report (final step)
-- Complete Advanced SQL Project fully!
-- Write README for the project
-- Upload to SQL-Projects on GitHub
-- Start new Excel + SQL combined project!