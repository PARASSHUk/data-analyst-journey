-- ================================================
-- Day 3 - SQL Learning Notes
-- Topic: LIKE Operator, Built-in Functions- aggregate function, string function.
--        GROUP BY and HAVING Clause
-- Database Used: World Database
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised DDL, DML, DQL commands
-- Revised all 6 Constraints
--   Primary Key, Foreign Key, Unique,
--   Default, Not Null, Check
-- Revised clauses WHERE, GROUP BY, LIMIT, OFFSET
-- Revised operators AND, OR, IN, BETWEEN
-- Learned LIKE operator with % and _
-- Learned Built-in Aggregate Functions
--   SUM, MAX, MIN, AVG, COUNT, COUNT DISTINCT
-- Learned GROUP BY with HAVING clause

-- ------------------------------------------------
-- STEP 1 - LIKE Operator
-- ------------------------------------------------

-- LIKE is used for pattern matching in text
-- Works with two wildcards:
-- % = matches any number of characters
-- _ = matches exactly one character

-- Find countries starting with letter A
SELECT name FROM country
WHERE name LIKE "A%";

-- Find countries ending with land
SELECT name FROM country
WHERE name LIKE "%land";

-- Find countries containing word "an" anywhere
SELECT name FROM country
WHERE name LIKE "%an%";

-- Find countries where second letter is a
-- _ means exactly one character before a
SELECT name FROM country
WHERE name LIKE "_a%";

-- Find countries with exactly 5 characters
SELECT name FROM country
WHERE name LIKE "_____";

-- ------------------------------------------------
-- STEP 2 - Built-in Aggregate Functions
-- ------------------------------------------------

-- Aggregate functions work on entire column
-- and return a single result value

-- SUM - adds all values in a column
SELECT SUM(population) AS total_world_population
FROM country;

-- MAX - finds highest value in column
SELECT MAX(population) AS most_populated_country
FROM country;

-- MIN - finds lowest value in column
SELECT MIN(population) AS least_populated_country
FROM country;

-- AVG - finds average value in column
SELECT ROUND(AVG(population), 2) AS avg_country_population
FROM country;

-- COUNT - counts total number of rows
SELECT COUNT(*) AS total_countries
FROM country;

-- COUNT DISTINCT - counts unique values only
-- ignores duplicate values
SELECT COUNT(DISTINCT(continent)) AS total_continents
FROM country;

-- Combining multiple functions together
SELECT
    COUNT(*)                        AS total_countries,
    SUM(population)                 AS world_population,
    ROUND(AVG(population), 2)       AS avg_population,
    MAX(population)                 AS highest_population,
    MIN(population)                 AS lowest_population
FROM country;

-- ------------------------------------------------
-- STEP 3 - GROUP BY Clause
-- ------------------------------------------------

-- GROUP BY groups rows with same value together
-- Always used with aggregate functions
-- Example: total population per continent

-- Total population by continent
SELECT
    continent,
    SUM(population) AS total_population
FROM world.country
GROUP BY continent
ORDER BY total_population DESC;

-- Count of countries in each continent
SELECT
    continent,
    COUNT(*) AS number_of_countries
FROM world.country
GROUP BY continent
ORDER BY number_of_countries DESC;

-- Average population per continent
SELECT
    continent,
    ROUND(AVG(population), 2) AS avg_population
FROM world.country
GROUP BY continent;

-- ------------------------------------------------
-- STEP 4 - HAVING Clause
-- ------------------------------------------------

-- HAVING filters groups created by GROUP BY
-- WHERE filters rows BEFORE grouping
-- HAVING filters groups AFTER grouping
-- HAVING always comes after GROUP BY

-- Find continents with total population
-- above 1 billion
SELECT
    continent,
    SUM(population) AS total_population
FROM country
GROUP BY continent
HAVING SUM(population) > 1000000000
ORDER BY total_population DESC;

-- Find continents having more than
-- 10 countries in them
SELECT
    continent,
    COUNT(*) AS number_of_countries
FROM country
GROUP BY continent
HAVING COUNT(*) > 10
ORDER BY number_of_countries DESC;

-- Combining WHERE and HAVING together
-- WHERE filters rows first
-- then GROUP BY groups them
-- then HAVING filters groups
SELECT
    continent,
    COUNT(*)        AS total_countries,
    SUM(population) AS total_population
FROM country
WHERE population > 1000000
GROUP BY continent
HAVING COUNT(*) > 5
ORDER BY total_population DESC;

-- ------------------------------------------------
-- DIFFERENCE - WHERE vs HAVING
-- ------------------------------------------------

-- WHERE  = filters ROWS before grouping
-- HAVING = filters GROUPS after grouping

-- Wrong way - cannot use aggregate in WHERE
-- SELECT continent, SUM(population)
-- FROM country
-- WHERE SUM(population) > 1000000000  -- ERROR!
-- GROUP BY continent;

-- Correct way - use HAVING for aggregates
-- SELECT continent, SUM(population)
-- FROM country
-- GROUP BY continent
-- HAVING SUM(population) > 1000000000; -- CORRECT!

-- ------------------------------------------------
-- SUMMARY - WHAT I LEARNED TODAY
-- ------------------------------------------------

-- LIKE "%text%"  = contains text anywhere
-- LIKE "text%"   = starts with text
-- LIKE "%text"   = ends with text
-- LIKE "_text"   = one char then text
-- SUM(col)       = adds all values
-- MAX(col)       = highest value
-- MIN(col)       = lowest value
-- AVG(col)       = average value
-- COUNT(*)       = count all rows
-- COUNT(DISTINCT(col)) = count unique values
-- GROUP BY col   = groups same values together
-- HAVING         = filters groups after GROUP BY

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- JOINS - INNER JOIN, LEFT JOIN, RIGHT JOIN
-- Combining two tables together
-- Subqueries
-- CASE statement