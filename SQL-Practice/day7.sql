-- ================================================
-- Day 7 - SQL Learning Notes
-- Topic: Subqueries, Normalization and
--        COVID-19 Mini Project Start
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Practiced Aggregate Functions
--   SUM, MAX, MIN, AVG, COUNT, COUNT DISTINCT
-- Practiced Logical Functions
--   IF, IFNULL, NULLIF, CASE, COALESCE
-- Revised String Functions
--   SUBSTRING, LEFT, RIGHT, TRIM, REVERSE, LENGTH
-- Revised Date and Time Functions
--   CURRENT_DATE, NOW, DAY, MONTH, YEAR,
--   DATE_ADD, DATE_SUB, DATEDIFF
-- Revised Common Table Expression (CTE)
-- Revised Window Functions
--   ROW_NUMBER, RANK, DENSE_RANK,
--   NTILE, LAG, LEAD
-- Revised Numeric Functions
--   ABS, CEIL, FLOOR, MOD, ROUND, POWER
-- Learned 3 Types of Subqueries
-- Learned Normalization 1NF, 2NF, 3NF
-- Started COVID-19 Mini Project

-- ------------------------------------------------
-- STEP 1 - SUBQUERIES
-- ------------------------------------------------

-- A Subquery is a query written inside
-- another query
-- Also called inner query or nested query
-- The inner query runs first
-- then outer query uses its result

-- There are 3 types of Subqueries:
-- 1. Single Row Subquery
-- 2. Multi Row Subquery
-- 3. Fetch Table Column Subquery

-- ------------------------------------------------
-- TYPE 1 - SINGLE ROW SUBQUERY
-- ------------------------------------------------

-- Returns only ONE row and ONE value
-- Used with operators = > < >= <=

-- Find countries with population
-- above the average population
SELECT name, population
FROM world.country
WHERE population > (
    SELECT AVG(population)
    FROM world.country
);

-- Find the country with maximum population
SELECT name, population
FROM world.country
WHERE population = (
    SELECT MAX(population)
    FROM world.country
);

-- Find orders with sales above average sales
SELECT ORDERNUMBER, SALES
FROM sales_data
WHERE SALES > (
    SELECT AVG(SALES)
    FROM sales_data
);

-- ------------------------------------------------
-- TYPE 2 - MULTI ROW SUBQUERY
-- ------------------------------------------------

-- Returns MULTIPLE rows
-- Used with IN, ANY, ALL operators

-- Find countries that are in
-- the same continent as India
SELECT name, continent
FROM world.country
WHERE continent IN (
    SELECT continent
    FROM world.country
    WHERE name = "India"
);

-- Find customers who have placed orders
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM orders
);

-- Find products with sales
-- higher than ALL products in Trains category
SELECT PRODUCTCODE, SALES
FROM sales_data
WHERE SALES > ALL (
    SELECT SALES
    FROM sales_data
    WHERE PRODUCTLINE = "Trains"
);

-- ------------------------------------------------
-- TYPE 3 - FETCH TABLE COLUMN SUBQUERY
-- ------------------------------------------------

-- Subquery used in SELECT clause
-- fetches a calculated column from another table
-- also called correlated subquery

-- Get each country name with
-- total number of cities in that country
SELECT
    name AS country_name,
    (
        SELECT COUNT(*)
        FROM world.city
        WHERE world.city.CountryCode = world.country.Code
    ) AS total_cities
FROM world.country
ORDER BY total_cities DESC;

-- ------------------------------------------------
-- STEP 2 - NORMALIZATION
-- ------------------------------------------------

-- Normalization = organizing database tables
-- to reduce data redundancy and improve integrity
-- There are 3 main normal forms

-- ------------------------------------------------
-- 1NF - FIRST NORMAL FORM
-- ------------------------------------------------

-- Rules for 1NF:
-- Each column must have atomic values
-- No repeating groups or arrays in columns
-- Each row must be unique

-- WRONG - Not in 1NF
-- student_id | name  | subjects
-- 1          | Paras | SQL, Python, Excel

-- CORRECT - In 1NF
-- student_id | name  | subject
-- 1          | Paras | SQL
-- 1          | Paras | Python
-- 1          | Paras | Excel

-- ------------------------------------------------
-- 2NF - SECOND NORMAL FORM
-- ------------------------------------------------

-- Rules for 2NF:
-- Must already be in 1NF
-- Every non-key column must depend on
-- the WHOLE primary key
-- No partial dependencies allowed

-- WRONG - Not in 2NF
-- order_id | product_id | product_name | quantity
-- product_name depends only on product_id
-- not on the full primary key order_id + product_id

-- CORRECT - Split into 2 tables
-- Table 1: orders (order_id, product_id, quantity)
-- Table 2: products (product_id, product_name)

-- ------------------------------------------------
-- 3NF - THIRD NORMAL FORM
-- ------------------------------------------------

-- Rules for 3NF:
-- Must already be in 2NF
-- No transitive dependencies
-- Non-key columns must depend ONLY
-- on the primary key not on other non-key columns

-- WRONG - Not in 3NF
-- student_id | name  | city     | state
-- state depends on city not on student_id
-- that is a transitive dependency

-- CORRECT - Split into 2 tables
-- Table 1: students (student_id, name, city_id)
-- Table 2: cities (city_id, city, state)

-- ------------------------------------------------
-- NORMALIZATION SUMMARY
-- ------------------------------------------------

-- 1NF = atomic values no repeating groups
-- 2NF = no partial dependencies on primary key
-- 3NF = no transitive dependencies

-- ------------------------------------------------
-- STEP 3 - COVID-19 MINI PROJECT STARTED
-- ------------------------------------------------

-- Project Name: COVID-19 Data Exploration
-- Tool: SQL
-- Dataset: COVID-19 dataset downloaded
-- Status: Starting - Data Exploration Phase
-- Goal: Apply all SQL skills on real world data

-- Questions to Answer in This Project:
-- 1. Which country had the highest total cases?
-- 2. Which country had the highest death rate?
-- 3. What was the monthly trend of cases?
-- 4. Which continent was most affected?
-- 5. What was the recovery rate by country?
-- 6. Which month had the highest new cases?
-- 7. Compare cases across different years

-- Initial Data Exploration Queries:
-- SELECT * FROM covid_data LIMIT 10;
-- SELECT COUNT(*) FROM covid_data;
-- SELECT COUNT(DISTINCT country) FROM covid_data;
-- SELECT MIN(date), MAX(date) FROM covid_data;

-- ------------------------------------------------
-- SUMMARY - WHAT I LEARNED TODAY
-- ------------------------------------------------

-- Subquery         = query inside another query
-- Single Row       = returns one value use = > 
-- Multi Row        = returns many values use IN
-- Correlated       = subquery in SELECT clause

-- 1NF              = atomic values in each column
-- 2NF              = no partial key dependencies
-- 3NF              = no transitive dependencies

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- Continue COVID-19 Mini Project
-- Apply JOINS on COVID data
-- Apply Window Functions on COVID data
-- Apply Subqueries on COVID data
