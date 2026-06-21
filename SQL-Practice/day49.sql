-- ================================================
-- Day 49 - SQL Learning Notes
-- Topic: Revision of Advanced SQL
--        Analytics Project
-- Total SQL Days Completed: 51
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Revised Advanced SQL Analytics Project
-- completely from start to finish
-- Revised all 7 steps of the project
-- Strengthened understanding of
--   Window Functions and Views

-- ================================================
-- ADVANCED PROJECT - COMPLETE REVISION
-- ================================================

-- ------------------------------------------------
-- STEP 1 - CHANGE OVER TIME
-- ------------------------------------------------

-- Formula: [Measure] by [Date Dimension]
-- Analyzes how values change across time
-- Used YEAR() MONTH() and DATETRUNC()
-- Found yearly and monthly sales trends
-- DATETRUNC avoids writing year/month twice

SELECT
    DATETRUNC(MONTH, order_date) AS order_month,
    SUM(sales_amount)            AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity)                AS total_quantity
FROM sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH, order_date)
ORDER BY DATETRUNC(MONTH, order_date);

-- ------------------------------------------------
-- STEP 2 - CUMULATIVE ANALYSIS
-- ------------------------------------------------

-- Formula: {Cumulative Measure} by {Date Dimension}
-- Used SUM() OVER(ORDER BY date) for running total
-- Used AVG() OVER(ORDER BY date) for running average
-- Default window frame = UNBOUNDED PRECEDING
--                          to CURRENT ROW

SELECT
    month_date,
    total_sales,
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
-- STEP 3 - PERFORMANCE ANALYSIS
-- ------------------------------------------------

-- Formula: CURRENT [Measure] - TARGET [Measure]
-- Compared product sales to:
--   1. Average sales (using AVG OVER PARTITION BY)
--   2. Previous year sales (using LAG)

-- LAG() gets value from previous row
-- within the same product partition
-- Used for Year over Year comparison

SELECT
    year,
    product,
    total_sales,
    AVG(total_sales) OVER(
        PARTITION BY product
    ) AS average_sales,
    LAG(total_sales) OVER(
        PARTITION BY product
        ORDER BY year
    ) AS previous_year_sales
FROM
(
    SELECT
        YEAR(s.order_date)  AS year,
        p.product_name      AS product,
        SUM(s.sales_amount) AS total_sales
    FROM products p
    LEFT JOIN sales s
    ON p.product_key = s.product_key
    WHERE YEAR(order_date) IS NOT NULL
    GROUP BY YEAR(order_date), product_name
) t;

-- ------------------------------------------------
-- STEP 4 - PART-TO-WHOLE ANALYSIS
-- ------------------------------------------------

-- Formula: ([Measure]/[Total Measure]) * 100
-- Used SUM() OVER() with empty parentheses
-- to get grand total across ALL rows
-- CAST to FLOAT to avoid integer division
-- giving wrong 0 result

SELECT
    category,
    total_sales,
    SUM(total_sales) OVER() AS overall_sales,
    CONCAT(
        ROUND(
            (CAST(total_sales AS FLOAT) /
             SUM(total_sales) OVER()) * 100, 2
        ), '%'
    ) AS percentage_covered
FROM
(
    SELECT
        category,
        SUM(sales_amount) AS total_sales
    FROM sales s
    LEFT JOIN products p
    ON s.product_key = p.product_key
    WHERE category IS NOT NULL
    GROUP BY category
) t
ORDER BY total_sales DESC;

-- ------------------------------------------------
-- STEP 5 - DATA SEGMENTATION
-- ------------------------------------------------

-- Formula: [Measure] by [Measure]
-- Used CASE WHEN to create custom buckets

-- Product Cost Segmentation
SELECT
    CASE
        WHEN cost < 100 THEN 'Below 100'
        WHEN cost BETWEEN 100 AND 500 THEN '100-500'
        WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
        ELSE 'Above 1000'
    END AS product_cost_range,
    COUNT(product_key) AS total_products
FROM products
GROUP BY
    CASE
        WHEN cost < 100 THEN 'Below 100'
        WHEN cost BETWEEN 100 AND 500 THEN '100-500'
        WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
        ELSE 'Above 1000'
    END
ORDER BY total_products DESC;

-- Customer Spending Segmentation
-- VIP     = 12+ months AND spend > 5000
-- Regular = 12+ months AND spend <= 5000
-- New     = less than 12 months

-- ------------------------------------------------
-- STEP 6 - CUSTOMER REPORT VIEW
-- ------------------------------------------------

-- CREATE VIEW must be the FIRST statement
-- No other query allowed before it
-- Combined 2 CTEs base_query + aggregation
-- Added age segmentation
-- Added customer segmentation VIP/Regular/New
-- Added recency = months since last order
-- Added avg_order_value with zero protection
-- Added avg_monthly_spend with zero protection

SELECT * FROM customer_report;

-- ------------------------------------------------
-- STEP 7 - PRODUCT REPORT VIEW
-- ------------------------------------------------

-- Same structure as customer report
-- Added revenue segmentation
--   High-Performer Mid-Range Low-Performer
-- Added recency avg_order_revenue
--   avg_monthly_revenue
-- Used NULLIF for safe division
--   AVG(sales / NULLIF(quantity, 0))

SELECT * FROM product_report;

-- ================================================
-- KEY CONCEPTS REVISED TODAY
-- ================================================

-- WINDOW FUNCTIONS RECAP
-- SUM() OVER(ORDER BY col)        = running total
-- AVG() OVER(PARTITION BY col)    = group average
-- LAG() OVER(PARTITION BY ORDER)  = previous row
-- SUM() OVER()                    = grand total

-- DIVISION SAFETY RECAP
-- CAST(col AS FLOAT) for percentage accuracy
-- NULLIF(col, 0) to prevent divide by zero
-- CASE WHEN col = 0 THEN 0 ELSE division

-- VIEW RECAP
-- CREATE VIEW must be first statement
-- Always shows latest live data
-- Reusable for dashboards and reports

-- SEGMENTATION RECAP
-- CASE WHEN for custom range buckets
-- Combine multiple conditions with AND
-- Order conditions from most specific
--   to least specific (VIP checked first)

-- ================================================
-- WHY REVISION DAYS MATTER
-- ================================================

-- Revisiting completed projects
-- strengthens long term memory
-- Makes concepts second nature
-- Prepares for technical interviews
-- where these exact patterns are asked

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Complete revision of Advanced SQL Project
-- Revisited all 7 steps in detail
-- Reinforced Window Functions usage
-- Reinforced VIEW creation rules
-- Reinforced division safety techniques

-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Continue Pizza Dashboard Project
-- Finalize Dashboard layout in Excel
-- Add Slicers for interactivity
-- Complete and upload Pizza Dashboard
--   Project to GitHub