-- ================================================
-- Day 8 - SQL Learning Notes
-- Topic: Built-in Functions Revision and
--        Subquery Practice.
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Practiced all Built-in Functions revision
-- Solved Subquery practice problems
-- COVID-19 Mini Project shifted to Day 10
--   due to technical reasons

-- ------------------------------------------------
-- STEP 1 - BUILT IN FUNCTIONS REVISION
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS
-- SUM()          = adds all values
-- AVG()          = finds average
-- MAX()          = finds highest value
-- MIN()          = finds lowest value
-- COUNT(*)       = counts all rows
-- COUNT(DISTINCT col) = counts unique values

-- STRING FUNCTIONS
-- SUBSTRING(col, start, len) = extract part of text
-- LEFT(col, n)               = first n characters
-- RIGHT(col, n)              = last n characters
-- TRIM(col)                  = remove extra spaces
-- REVERSE(col)               = reverse the text
-- LENGTH(col)                = count characters
-- UPPER(col)                 = convert to uppercase
-- LOWER(col)                 = convert to lowercase

-- LOGICAL FUNCTIONS
-- IF(condition, true, false) = simple condition
-- IFNULL(col, value)         = replace NULL
-- NULLIF(val1, val2)         = return NULL if equal
-- CASE WHEN THEN ELSE END    = multiple conditions
-- COALESCE(col1, col2)       = first non null value

-- DATE AND TIME FUNCTIONS
-- CURRENT_DATE()             = today's date
-- CURRENT_TIME()             = current time
-- NOW()                      = date and time
-- DAY(date)                  = extract day
-- MONTH(date)                = extract month
-- YEAR(date)                 = extract year
-- HOUR(time)                 = extract hour
-- MINUTE(time)               = extract minute
-- DATE_ADD(date, INTERVAL n) = add to date
-- DATE_SUB(date, INTERVAL n) = subtract from date
-- DATEDIFF(end, start)       = days between dates

-- NUMERIC FUNCTIONS
-- ABS(n)                     = absolute value
-- CEIL(n)                    = always round up
-- FLOOR(n)                   = always round down
-- MOD(n, d)                  = remainder of division
-- ROUND(n, d)                = round to decimals
-- POWER(n, e)                = n to the power e

-- WINDOW FUNCTIONS
-- ROW_NUMBER()               = unique row number
-- RANK()                     = rank with gaps
-- DENSE_RANK()               = rank without gaps
-- NTILE(n)                   = divide into n groups
-- LAG()                      = value from previous row
-- LEAD()                     = value from next row

-- ------------------------------------------------
-- STEP 2 - SUBQUERY PROBLEMS PRACTICED
-- ------------------------------------------------

-- Problem 1
-- Find all countries whose population is
-- greater than the average population
SELECT name, population
FROM world.country
WHERE population > (
    SELECT AVG(population)
    FROM world.country
)
ORDER BY population DESC;

-- Problem 2
-- Find the top 3 most populated countries
-- in each continent using subquery
SELECT name, continent, population
FROM world.country c1
WHERE (
    SELECT COUNT(*)
    FROM world.country c2
    WHERE c2.continent = c1.continent
    AND c2.population > c1.population
) < 3
ORDER BY continent, population DESC;

-- Problem 3
-- Find countries with population
-- higher than all countries in Africa
SELECT name, population
FROM world.country
WHERE population > ALL (
    SELECT population
    FROM world.country
    WHERE continent = "Africa"
    AND population > 0
)
ORDER BY population DESC;

-- Problem 4
-- Find continents where at least one country
-- has population above 500 million
SELECT DISTINCT continent
FROM world.country
WHERE continent IN (
    SELECT continent
    FROM world.country
    WHERE population > 500000000
);

-- Problem 5
-- Using CTE with Subquery together
WITH large_countries AS
(
    SELECT name, continent, population
    FROM world.country
    WHERE population > (
        SELECT AVG(population)
        FROM world.country
    )
)
SELECT
    continent,
    COUNT(*) AS large_country_count,
    SUM(population) AS total_population
FROM large_countries
GROUP BY continent
ORDER BY large_country_count DESC;

-- ------------------------------------------------
-- MINI PROJECT UPDATE
-- ------------------------------------------------

-- COVID-19 Data Exploration Project
-- Status: Shifted to Day 10
-- Reason: Technical issues resolved
-- Plan: Will start on Day 10 with full setup

-- ------------------------------------------------
-- SUMMARY - WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised all 6 categories of functions
--   Aggregate, String, Logical,
--   Date Time, Numeric, Window
-- Practiced 5 subquery problems
--   Single row subquery with AVG MAX
--   Multi row subquery with IN ALL
--   Correlated subquery with COUNT
--   CTE combined with subquery

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- More complex JOIN problems
-- Subquery inside FROM clause
-- Practice on StrataScratch
-- Prepare for COVID-19 Mini Project