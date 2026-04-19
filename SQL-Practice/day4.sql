-- ================================================
-- Day 4 - SQL Learning Notes
-- Topic: String Functions, Logical Functions
--        and StrataScratch Practice.
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Practiced 6 Clauses
--   SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY
-- Practiced 5 Operators
--   AND, OR, IN, BETWEEN, LIKE
-- Practiced 4 Aggregate Functions
--   SUM, AVG, MAX, MIN
-- Learned 5 String Functions
--   SUBSTRING, RIGHT, LEFT, TRIM, REVERSE, LENGTH
-- Learned 5 Logical Functions
--   IF, IFNULL, NULLIF, CASE, COALESCE

-- ------------------------------------------------
-- STEP 1 - STRING FUNCTIONS
-- ------------------------------------------------

-- String functions work on text columns

-- 1. SUBSTRING - extracts part of a string
-- SUBSTRING(column, start, length)
SELECT SUBSTRING("Data Analytics", 1, 4);
-- Output: Data

SELECT name, SUBSTRING(name, 1, 3) AS short_name
FROM world.country;

-- 2. LEFT and RIGHT
-- LEFT  = extracts characters from left side
-- RIGHT = extracts characters from right side
SELECT LEFT("Data Analytics", 4);   -- Output: Data
SELECT RIGHT("Data Analytics", 9);  -- Output: Analytics

SELECT name, LEFT(name, 3) AS first_3_letters
FROM world.country;

-- 3. TRIM - removes extra spaces
-- from both sides of text
SELECT TRIM("   Data Analytics   ");
-- Output: Data Analytics

-- 4. REVERSE - reverses a string
SELECT REVERSE("Data Analytics");
-- Output: scitylanA ataD

SELECT name, REVERSE(name) AS reversed_name
FROM world.country
LIMIT 5;

-- 5. LENGTH - counts number of characters
SELECT LENGTH("Data Analytics");
-- Output: 14

-- Find countries with name longer than 10 chars
SELECT name, LENGTH(name) AS name_length
FROM world.country
WHERE LENGTH(name) > 10
ORDER BY name_length DESC;

-- ------------------------------------------------
-- STEP 2 - LOGICAL FUNCTIONS
-- ------------------------------------------------

-- 1. IF Function
-- IF(condition, value if true, value if false)
SELECT
    name,
    population,
    IF(population > 100000000,
       "Large Country",
       "Small Country") AS country_size
FROM world.country;

-- 2. IFNULL Function
-- IFNULL(column, value if null)
-- replaces NULL values with a given value
SELECT
    name,
    IFNULL(region, "No Region") AS region_name
FROM world.country;

-- 3. NULLIF Function
-- NULLIF(value1, value2)
-- returns NULL if both values are equal
-- otherwise returns value1
SELECT NULLIF(100, 100);   -- Output: NULL
SELECT NULLIF(100, 200);   -- Output: 100

-- 4. CASE Statement
-- works like IF ELSE in programming
-- checks multiple conditions one by one
SELECT
    name,
    population,
    CASE
        WHEN population > 1000000000 THEN "Very Large"
        WHEN population > 100000000  THEN "Large"
        WHEN population > 10000000   THEN "Medium"
        ELSE                              "Small"
    END AS country_category
FROM world.country
ORDER BY population DESC;

-- 5. COALESCE Function
-- returns first NON-NULL value from list
-- very useful for handling multiple NULL columns
SELECT
    name,
    COALESCE(region, continent, "Unknown") AS location
FROM world.country;

-- ------------------------------------------------
-- STEP 3 - STRATASCRATCH QUESTION SOLVED
-- ------------------------------------------------

-- Platform: StrataScratch
-- Company:  Tesla
-- Difficulty: Easy

-- Question:
-- Tesla just provided their quarterly sales
-- for their major vehicles.
-- Determine which Tesla Model has made
-- the most profit.
-- Include all columns with profit column at end.

-- Solution:
SELECT *,
    (car_price - production_cost) * cars_sold AS profit
FROM tesla_models
ORDER BY profit DESC
LIMIT 1;

-- Logic Used:
-- profit formula = (selling price - cost) x units sold
-- ORDER BY profit DESC = highest profit first
-- LIMIT 1 = show only top 1 result

-- ------------------------------------------------
-- SUMMARY - WHAT I LEARNED TODAY
-- ------------------------------------------------

-- SUBSTRING(col, start, len) = extract part of text
-- LEFT(col, n)               = first n characters
-- RIGHT(col, n)              = last n characters
-- TRIM(col)                  = remove extra spaces
-- REVERSE(col)               = reverse the text
-- LENGTH(col)                = count characters

-- IF(condition, true, false) = simple condition check
-- IFNULL(col, value)         = replace NULL with value
-- NULLIF(val1, val2)         = return NULL if equal
-- CASE WHEN THEN ELSE END    = multiple conditions
-- COALESCE(col1, col2, ...)  = first non null value

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- 
-- other built in function's
-- How to combine two tables together
-- Subqueries inside SELECT and WHERE