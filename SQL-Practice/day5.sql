-- ================================================
-- Day 5 - SQL Learning Notes
-- Topic: Date and Time Functions and
--        Common Table Expressions (CTE)
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised Aggregate Functions
--   SUM, MAX, MIN, AVG, COUNT, COUNT DISTINCT
-- Revised String Functions
--   SUBSTRING, LEFT, RIGHT, TRIM, REVERSE, LENGTH
-- Revised Logical Functions
--   IF, IFNULL, NULLIF, CASE, COALESCE
-- Learned 13 Date and Time Functions
-- Learned Common Table Expression (CTE)

-- ------------------------------------------------
-- STEP 1 - DATE AND TIME FUNCTIONS
-- ------------------------------------------------

-- 1. CURRENT_DATE()
-- returns today's date
SELECT CURRENT_DATE();
-- Output: 2026-04-20

-- 2. CURRENT_TIME()
-- returns current time
SELECT CURRENT_TIME();
-- Output: 14:35:22

-- 3. NOW()
-- returns current date and time together
SELECT NOW();
-- Output: 2026-04-20 14:35:22

-- 4. DATE()
-- extracts only date part from datetime
SELECT DATE(NOW());
-- Output: 2026-04-20

-- 5. DAY()
-- extracts day number from a date
SELECT DAY(CURRENT_DATE());
-- Output: 20

SELECT DAY("2026-04-20");
-- Output: 20

-- 6. MONTH()
-- extracts month number from a date
SELECT MONTH(CURRENT_DATE());
-- Output: 4

SELECT MONTH("2026-04-20");
-- Output: 4

-- 7. YEAR()
-- extracts year from a date
SELECT YEAR(CURRENT_DATE());
-- Output: 2026

SELECT YEAR("2026-04-20");
-- Output: 2026

-- 8. TIME()
-- extracts only time part from datetime
SELECT TIME(NOW());
-- Output: 14:35:22

-- 9. MINUTE()
-- extracts minute from time
SELECT MINUTE(CURRENT_TIME());
-- Output: 35

-- 10. HOUR()
-- extracts hour from time
SELECT HOUR(CURRENT_TIME());
-- Output: 14

-- 11. DATE_ADD()
-- adds a specific interval to a date
-- DATE_ADD(date, INTERVAL value unit)
SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY);
-- adds 5 days to today

SELECT DATE_ADD("2026-04-20", INTERVAL 1 MONTH);
-- adds 1 month to given date

SELECT DATE_ADD("2026-04-20", INTERVAL 1 YEAR);
-- adds 1 year to given date

-- 12. DATE_SUB()
-- subtracts a specific interval from a date
SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 5 DAY);
-- subtracts 5 days from today

SELECT DATE_SUB("2026-04-20", INTERVAL 3 MONTH);
-- subtracts 3 months from given date

-- 13. DATEDIFF()
-- calculates difference between two dates
-- DATEDIFF(end_date, start_date)
SELECT DATEDIFF("2026-12-31", "2026-04-20");
-- Output: number of days between dates

-- Real use case - find how many days
-- since an order was placed
SELECT
    ORDERNUMBER,
    ORDERDATE,
    DATEDIFF(CURRENT_DATE(), ORDERDATE) AS days_since_order
FROM orders
ORDER BY days_since_order DESC;

-- ------------------------------------------------
-- COMBINING DATE FUNCTIONS TOGETHER
-- ------------------------------------------------

-- Find orders placed in a specific month and year
SELECT *
FROM orders
WHERE MONTH(ORDERDATE) = 11
AND YEAR(ORDERDATE) = 2004;

-- Find orders placed in last 30 days
SELECT *
FROM orders
WHERE ORDERDATE >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY);

-- Extract day month year from order date
SELECT
    ORDERDATE,
    DAY(ORDERDATE)   AS order_day,
    MONTH(ORDERDATE) AS order_month,
    YEAR(ORDERDATE)  AS order_year
FROM orders
LIMIT 10;

-- ------------------------------------------------
-- STEP 2 - COMMON TABLE EXPRESSION (CTE)
-- ------------------------------------------------

-- CTE = Common Table Expression
-- Creates a temporary table that exists
-- only during the query execution
-- Makes complex queries easier to read
-- Use WITH keyword to create CTE

-- Basic CTE Syntax
-- WITH cte_name AS
-- (
--     your query here
-- )
-- SELECT * FROM cte_name;

-- Simple CTE Example
-- Find countries with population above average
WITH high_population AS
(
    SELECT name, population
    FROM world.country
    WHERE population > 0
)
SELECT *
FROM high_population
WHERE population > 100000000
ORDER BY population DESC;

-- CTE with Aggregate Functions
-- Find total sales per territory
-- then filter only high performing ones
WITH territory_sales AS
(
    SELECT
        TERRITORY,
        SUM(SALES)   AS total_sales,
        COUNT(*)     AS total_orders
    FROM sales_data
    GROUP BY TERRITORY
)
SELECT *
FROM territory_sales
WHERE total_sales > 1000000
ORDER BY total_sales DESC;

-- Multiple CTEs together
WITH
sales_2003 AS
(
    SELECT * FROM orders
    WHERE YEAR(ORDERDATE) = 2003
),
sales_2004 AS
(
    SELECT * FROM orders
    WHERE YEAR(ORDERDATE) = 2004
)
SELECT
    "2003" AS year,
    COUNT(*) AS total_orders
FROM sales_2003
UNION ALL
SELECT
    "2004" AS year,
    COUNT(*) AS total_orders
FROM sales_2004;

-- ------------------------------------------------
-- WHY USE CTE
-- ------------------------------------------------

-- Makes long queries easier to read
-- Can reuse the same subquery multiple times
-- Replaces complex nested subqueries
-- Temporary - only exists during the query
-- Does not create a permanent table

-- ------------------------------------------------
-- SUMMARY - WHAT I LEARNED TODAY
-- ------------------------------------------------

-- CURRENT_DATE()              = today's date
-- CURRENT_TIME()              = current time
-- NOW()                       = date and time
-- DATE(datetime)              = extract date only
-- DAY(date)                   = extract day number
-- MONTH(date)                 = extract month number
-- YEAR(date)                  = extract year number
-- TIME(datetime)              = extract time only
-- MINUTE(time)                = extract minutes
-- HOUR(time)                  = extract hours
-- DATE_ADD(date, INTERVAL n)  = add days months years
-- DATE_SUB(date, INTERVAL n)  = subtract days months
-- DATEDIFF(end, start)        = days between two dates
-- WITH cte AS (query)         = temporary named query

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- JOINS - INNER JOIN, LEFT JOIN, RIGHT JOIN
-- How to combine two or more tables
-- Subqueries inside WHERE and SELECTf