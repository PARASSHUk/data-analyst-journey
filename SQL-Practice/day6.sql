-- ================================================
-- Day 6 - SQL Learning Notes
-- Topic: Window Functions, Numeric Functions
--        and SQL JOINS
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised Aggregate Functions
--   SUM, MAX, MIN, AVG, COUNT, COUNT DISTINCT
-- Revised Logical Functions
--   IF, IFNULL, NULLIF, CASE, COALESCE
-- Revised String Functions
--   SUBSTRING, LEFT, RIGHT, TRIM, REVERSE, LENGTH
-- Revised Date and Time Functions
--   CURRENT_DATE, NOW, DAY, MONTH, YEAR,
--   DATE_ADD, DATE_SUB, DATEDIFF
-- Revised Common Table Expression (CTE)
-- Learned 6 Window Functions
--   ROW_NUMBER, RANK, DENSE_RANK,
--   NTILE, LAG, LEAD
-- Learned 6 Numeric Functions
--   ABS, CEIL, FLOOR, MOD, ROUND, POWER
-- Learned 4 Types of JOINS
--   INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN

-- ------------------------------------------------
-- STEP 1 - WINDOW FUNCTIONS
-- ------------------------------------------------

-- Window Functions perform calculations
-- across a set of rows related to current row
-- Unlike GROUP BY they do NOT collapse rows
-- Use OVER() keyword with window functions

-- 1. ROW_NUMBER()
-- assigns unique row number to each row
-- starts from 1
SELECT
    name,
    population,
    ROW_NUMBER() OVER(ORDER BY population DESC)
    AS row_num
FROM world.country;

-- 2. RANK()
-- assigns rank to each row
-- skips rank numbers when there are ties
-- example: 1, 2, 2, 4 (skips 3)
SELECT
    name,
    population,
    RANK() OVER(ORDER BY population DESC)
    AS rank_num
FROM world.country;

-- 3. DENSE_RANK()
-- assigns rank to each row
-- does NOT skip rank numbers for ties
-- example: 1, 2, 2, 3 (no skip)
SELECT
    name,
    population,
    DENSE_RANK() OVER(ORDER BY population DESC)
    AS dense_rank_num
FROM world.country;

-- DIFFERENCE between RANK and DENSE_RANK
-- RANK()       = 1, 2, 2, 4, 5 (skips 3)
-- DENSE_RANK() = 1, 2, 2, 3, 4 (no skip)

-- 4. NTILE()
-- divides rows into n equal groups
-- assigns group number to each row
-- useful for creating quartiles or percentiles
SELECT
    name,
    population,
    NTILE(4) OVER(ORDER BY population DESC)
    AS quartile
FROM world.country;
-- quartile 1 = top 25% most populated
-- quartile 4 = bottom 25% least populated

-- 5. LAG()
-- gets value from PREVIOUS row
-- useful for comparing current row with previous
SELECT
    YEAR_ID,
    SUM(SALES) AS yearly_sales,
    LAG(SUM(SALES)) OVER(ORDER BY YEAR_ID)
    AS previous_year_sales
FROM sales_data
GROUP BY YEAR_ID;

-- 6. LEAD()
-- gets value from NEXT row
-- useful for comparing current row with next
SELECT
    YEAR_ID,
    SUM(SALES) AS yearly_sales,
    LEAD(SUM(SALES)) OVER(ORDER BY YEAR_ID)
    AS next_year_sales
FROM sales_data
GROUP BY YEAR_ID;

-- Using PARTITION BY with Window Functions
-- partitions divide data into groups
-- window function resets for each partition
SELECT
    continent,
    name,
    population,
    RANK() OVER(
        PARTITION BY continent
        ORDER BY population DESC
    ) AS rank_in_continent
FROM world.country;

-- ------------------------------------------------
-- STEP 2 - NUMERIC FUNCTIONS
-- ------------------------------------------------

-- 1. ABS()
-- returns absolute value
-- removes negative sign
SELECT ABS(-250);     -- Output: 250
SELECT ABS(250);      -- Output: 250

-- 2. CEIL()
-- rounds UP to nearest whole number
SELECT CEIL(4.1);     -- Output: 5
SELECT CEIL(4.9);     -- Output: 5
SELECT CEIL(-4.1);    -- Output: -4

-- 3. FLOOR()
-- rounds DOWN to nearest whole number
SELECT FLOOR(4.9);    -- Output: 4
SELECT FLOOR(4.1);    -- Output: 4
SELECT FLOOR(-4.9);   -- Output: -5

-- DIFFERENCE CEIL vs FLOOR vs ROUND
-- CEIL(4.1)  = 5  always rounds up
-- FLOOR(4.9) = 4  always rounds down
-- ROUND(4.5) = 5  rounds to nearest

-- 4. MOD()
-- returns remainder after division
-- MOD(number, divisor)
SELECT MOD(32, 3);    -- Output: 2
SELECT MOD(10, 2);    -- Output: 0
SELECT MOD(10, 3);    -- Output: 1

-- Real use case - find even or odd row numbers
SELECT
    name,
    ROW_NUMBER() OVER(ORDER BY name) AS row_num,
    CASE
        WHEN MOD(ROW_NUMBER() OVER(ORDER BY name), 2) = 0
        THEN "Even Row"
        ELSE "Odd Row"
    END AS row_type
FROM world.country;

-- 5. ROUND()
-- rounds to specified decimal places
SELECT ROUND(4.5678, 2);   -- Output: 4.57
SELECT ROUND(4.5678, 0);   -- Output: 5
SELECT ROUND(4.5678, 1);   -- Output: 4.6

-- 6. POWER()
-- raises number to given power
-- POWER(number, exponent)
SELECT POWER(2, 10);   -- Output: 1024
SELECT POWER(3, 2);    -- Output: 9
SELECT POWER(5, 3);    -- Output: 125

-- ------------------------------------------------
-- STEP 3 - SQL JOINS
-- ------------------------------------------------

-- JOINS combine rows from two or more tables
-- based on a related column between them

-- Sample Tables Used for Examples:
-- Table 1: customers (customer_id, name, city)
-- Table 2: orders (order_id, customer_id, amount)

-- 1. INNER JOIN
-- returns only rows that match in BOTH tables
-- rows with no match are excluded
SELECT
    c.name         AS customer_name,
    o.order_id     AS order_id,
    o.amount       AS order_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 2. LEFT JOIN
-- returns ALL rows from LEFT table
-- and matching rows from RIGHT table
-- non matching right rows show NULL
SELECT
    c.name         AS customer_name,
    o.order_id     AS order_id,
    o.amount       AS order_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
-- shows all customers even those with no orders
-- order columns will be NULL for customers
-- who have not placed any order

-- 3. RIGHT JOIN
-- returns ALL rows from RIGHT table
-- and matching rows from LEFT table
-- non matching left rows show NULL
SELECT
    c.name         AS customer_name,
    o.order_id     AS order_id,
    o.amount       AS order_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
-- shows all orders even those with no customer

-- 4. FULL JOIN
-- returns ALL rows from BOTH tables
-- non matching rows show NULL on either side
-- MySQL does not support FULL JOIN directly
-- use UNION of LEFT and RIGHT JOIN instead
SELECT
    c.name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT
    c.name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- ---------------------------------