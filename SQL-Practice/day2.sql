-- ================================================
-- Day 2 - SQL Learning Notes
-- Topic: DQL Operators and Use Cases
-- Database Used: World Database
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Practiced DDL, DML, DQL commands revision
-- Practiced on World Database
-- Learned DQL operators and their use cases
-- Learned ROUND function
-- Learned how to give ALIAS to columns
-- Learned LIMIT and OFFSET clause
-- Learned ORDER BY clause
-- Learned WHERE clause
-- Learned Logical Operators AND and OR
-- Learned IN and BETWEEN operators

-- ------------------------------------------------
-- STEP 1 - ROUND Function
-- ------------------------------------------------

-- ROUND rounds a number to given decimal places
-- round(value, 2) gives 2 decimal places
-- round(value, 1) gives 1 decimal place
-- round(value, 0) gives 0 decimal places

SELECT ROUND(1234.5678, 2);   -- Output: 1234.57
SELECT ROUND(1234.5678, 1);   -- Output: 1234.6
SELECT ROUND(1234.5678, 0);   -- Output: 1235

-- Real use case on World database
SELECT
    name,
    ROUND(population / 1000000, 2) AS population_millions
FROM world.country;

-- ------------------------------------------------
-- STEP 2 - ALIAS
-- ------------------------------------------------

-- ALIAS gives a nickname to a column
-- makes column names easier to read
-- use AS keyword to give alias

SELECT
    name        AS country_name,
    population  AS total_population,
    area        AS total_area
FROM world.country;

-- ------------------------------------------------
-- STEP 3 - LIMIT and OFFSET
-- ------------------------------------------------

-- LIMIT = how many rows to show
-- OFFSET = how many rows to skip from top

-- Show only first 5 rows
SELECT * FROM world.country
LIMIT 5;

-- Skip first 5 rows then show next 5
SELECT * FROM world.country
LIMIT 5 OFFSET 5;

-- Real use case - top 10 most populated countries
SELECT name, population
FROM world.country
ORDER BY population DESC
LIMIT 10;

-- ------------------------------------------------
-- STEP 4 - ORDER BY Clause
-- ------------------------------------------------

-- ORDER BY sorts results
-- ASC  = smallest to largest (default)
-- DESC = largest to smallest

-- Sort countries by population smallest first
SELECT name, population
FROM world.country
ORDER BY population ASC;

-- Sort countries by population largest first
SELECT name, population
FROM world.country
ORDER BY population DESC;

-- Sort by name alphabetically
SELECT name, population
FROM world.country
ORDER BY name ASC;

-- ------------------------------------------------
-- STEP 5 - WHERE Clause
-- ------------------------------------------------

-- WHERE filters rows based on condition
-- only rows matching condition are returned

-- Find all countries in Asia
SELECT name, continent, population
FROM world.country
WHERE continent = "Asia";

-- Find countries with population above 1 billion
SELECT name, population
FROM world.country
WHERE population > 1000000000;

-- ------------------------------------------------
-- STEP 6 - Logical Operators AND and OR
-- ------------------------------------------------

-- AND = both conditions must be true
-- OR  = at least one condition must be true

-- AND Example
-- Find countries in Asia with population above 100 million
SELECT name, continent, population
FROM world.country
WHERE continent = "Asia"
AND population > 100000000;

-- OR Example
-- Find countries in Asia or Europe
SELECT name, continent
FROM world.country
WHERE continent = "Asia"
OR continent = "Europe";

-- ------------------------------------------------
-- STEP 7 - IN and BETWEEN Operators
-- ------------------------------------------------

-- IN = matches any value in a list
-- shorter way to write multiple OR conditions

-- Find countries in Asia, Europe or Africa
SELECT name, continent
FROM world.country
WHERE continent IN ("Asia", "Europe", "Africa");

-- BETWEEN = value within a range
-- includes both start and end values

-- Find countries with population between
-- 10 million and 50 million
SELECT name, population
FROM world.country
WHERE population BETWEEN 10000000 AND 50000000;

-- Combine IN and BETWEEN together
SELECT name, continent, population
FROM world.country
WHERE continent IN ("Asia", "Europe")
AND population BETWEEN 10000000 AND 100000000
ORDER BY population DESC;

-- ------------------------------------------------
-- WHAT I LEARNED TODAY - SUMMARY
-- ------------------------------------------------

-- ROUND(value, decimals) = rounds to decimal places
-- AS alias_name         = gives nickname to column
-- LIMIT n               = shows only n rows
-- OFFSET n              = skips first n rows
-- ORDER BY col ASC      = sorts smallest first
-- ORDER BY col DESC     = sorts largest first
-- WHERE condition       = filters rows
-- AND                   = both conditions true
-- OR                    = one condition true
-- IN (a, b, c)          = matches list of values
-- BETWEEN a AND b       = value in range

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- GROUP BY clause
-- HAVING clause
-- Aggregate functions SUM COUNT AVG MAX MIN
-- LIKE operator for pattern matching
-- IS NULL and IS NOT NULL