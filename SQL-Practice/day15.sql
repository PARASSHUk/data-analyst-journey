-- ================================================
-- Day 15 - SQL Learning Notes
-- Topic: Complete SQL Revision
-- Total SQL Days Completed: 15
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Complete revision of all SQL notes
-- Revised all SQL Commands
-- Revised all Clauses and Operators
-- Revised all Built-in Functions
-- Revised JOINS all 4 types
-- Revised Subqueries all 3 types
-- Revised CTE Common Table Expression
-- Revised Window Functions
-- Revised Normalization 1NF 2NF 3NF

-- ------------------------------------------------
-- 1. SQL COMMANDS REVISION
-- ------------------------------------------------

-- DDL COMMANDS - Data Definition Language
-- CREATE   = creates new table or database
-- DROP     = deletes table completely
-- ALTER    = modifies table structure
--            ADD COLUMN
--            DROP COLUMN
--            CHANGE COLUMN
--            MODIFY COLUMN

-- DML COMMANDS - Data Manipulation Language
-- INSERT   = adds new rows to table
-- UPDATE   = modifies existing rows
-- DELETE   = removes rows from table

-- DQL COMMANDS - Data Query Language
-- SELECT   = retrieves data from table

-- ------------------------------------------------
-- 2. ALL CLAUSES REVISION
-- ------------------------------------------------

-- Correct order of writing clauses

-- SELECT   = choose columns to show
-- FROM     = which table to use
-- WHERE    = filter rows before grouping
-- GROUP BY = group same values together
-- HAVING   = filter groups after grouping
-- ORDER BY = sort results ASC or DESC
-- LIMIT    = show only n rows
-- OFFSET   = skip first n rows

-- Example using all clauses together
SELECT
    department,
    COUNT(*)                AS total_employees,
    ROUND(AVG(salary), 2)   AS avg_salary
FROM employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY avg_salary DESC
LIMIT 5
OFFSET 0;

-- ------------------------------------------------
-- 3. ALL OPERATORS REVISION
-- ------------------------------------------------

-- Comparison Operators
-- =        = equal to
-- >        = greater than
-- <        = less than
-- >=       = greater than or equal
-- <=       = less than or equal
-- !=       = not equal to

-- Logical Operators
-- AND      = both conditions must be true
-- OR       = one condition must be true
-- NOT      = negates a condition

-- Special Operators
-- IN           = matches list of values
-- BETWEEN      = value within a range
-- LIKE         = pattern matching with % and _
-- IS NULL      = checks for null value
-- IS NOT NULL  = checks for non null value

-- ------------------------------------------------
-- 4. ALL FUNCTIONS REVISION
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS
-- SUM(col)              = adds all values
-- AVG(col)              = finds average
-- MAX(col)              = finds highest value
-- MIN(col)              = finds lowest value
-- COUNT(*)              = counts all rows
-- COUNT(DISTINCT col)   = counts unique values

-- STRING FUNCTIONS
-- UPPER(col)            = converts to uppercase
-- LOWER(col)            = converts to lowercase
-- LENGTH(col)           = counts characters
-- LEFT(col, n)          = first n characters
-- RIGHT(col, n)         = last n characters
-- SUBSTRING(col, s, n)  = extracts part of text
-- TRIM(col)             = removes extra spaces
-- REVERSE(col)          = reverses the text

-- LOGICAL FUNCTIONS
-- IF(cond, true, false) = simple condition
-- IFNULL(col, value)    = replace NULL value
-- NULLIF(val1, val2)    = return NULL if equal
-- COALESCE(c1, c2)      = first non null value
-- CASE WHEN THEN ELSE   = multiple conditions

-- DATE AND TIME FUNCTIONS
-- CURRENT_DATE()        = today date
-- CURRENT_TIME()        = current time
-- NOW()                 = date and time both
-- DAY(date)             = extract day
-- MONTH(date)           = extract month
-- YEAR(date)            = extract year
-- HOUR(time)            = extract hour
-- MINUTE(time)          = extract minute
-- DATE_ADD(d, INTERVAL) = add to date
-- DATE_SUB(d, INTERVAL) = subtract from date
-- DATEDIFF(end, start)  = days between dates

-- NUMERIC FUNCTIONS
-- ABS(n)                = absolute value
-- CEIL(n)               = always round up
-- FLOOR(n)              = always round down
-- MOD(n, d)             = remainder of division
-- ROUND(n, d)           = round to decimals
-- POWER(n, e)           = n to the power e

-- WINDOW FUNCTIONS
-- ROW_NUMBER()          = unique row number
-- RANK()                = rank with gaps
-- DENSE_RANK()          = rank without gaps
-- NTILE(n)              = divide into n groups
-- LAG()                 = value from previous row
-- LEAD()                = value from next row
-- PARTITION BY          = reset for each group

-- ------------------------------------------------
-- 5. ALL JOINS REVISION
-- ------------------------------------------------

-- INNER JOIN
-- returns only matching rows from both tables
SELECT a.col1, b.col2
FROM table_a a
INNER JOIN table_b b
ON a.id = b.id;

-- LEFT JOIN
-- returns all left rows and matching right rows
SELECT a.col1, b.col2
FROM table_a a
LEFT JOIN table_b b
ON a.id = b.id;

-- RIGHT JOIN
-- returns all right rows and matching left rows
SELECT a.col1, b.col2
FROM table_a a
RIGHT JOIN table_b b
ON a.id = b.id;

-- FULL JOIN using UNION
-- returns all rows from both tables
SELECT a.col1, b.col2
FROM table_a a
LEFT JOIN table_b b
ON a.id = b.id
UNION
SELECT a.col1, b.col2
FROM table_a a
RIGHT JOIN table_b b
ON a.id = b.id;

-- JOINS SUMMARY
-- INNER JOIN = only matching rows both tables
-- LEFT JOIN  = all left and matching right
-- RIGHT JOIN = all right and matching left
-- FULL JOIN  = all rows from both tables

-- ------------------------------------------------
-- 6. SUBQUERIES REVISION
-- ------------------------------------------------

-- Single Row Subquery
-- returns one value used with = > 
SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Multi Row Subquery
-- returns multiple values used with IN
SELECT name, department
FROM employees
WHERE department IN (
    SELECT DISTINCT department
    FROM employees
    WHERE salary > 55000
);

-- Correlated Subquery
-- subquery inside SELECT clause
SELECT
    emp_name,
    salary,
    (SELECT ROUND(AVG(salary), 2)
     FROM employees e2
     WHERE e2.department = e1.department)
     AS dept_avg
FROM employees e1;

-- ------------------------------------------------
-- 7. CTE REVISION
-- ------------------------------------------------

-- Basic CTE
WITH cte_name AS
(
    SELECT col1, col2
    FROM table_name
    WHERE condition
)
SELECT * FROM cte_name;

-- CTE with Window Function
WITH ranked_employees AS
(
    SELECT
        emp_name,
        department,
        salary,
        RANK() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE dept_rank = 1;

-- ------------------------------------------------
-- 8. NORMALIZATION REVISION
-- ------------------------------------------------

-- 1NF First Normal Form
-- Each column must have atomic values
-- No repeating groups in columns
-- Each row must be unique

-- 2NF Second Normal Form
-- Must be in 1NF first
-- No partial dependencies on primary key
-- Every column depends on whole primary key

-- 3NF Third Normal Form
-- Must be in 2NF first
-- No transitive dependencies
-- Non key columns depend only on primary key

-- ------------------------------------------------
-- COMPLETE SQL TOPICS COVERED SO FAR
-- ------------------------------------------------

-- Commands   = DDL DML DQL
-- Clauses    = SELECT FROM WHERE GROUP BY
--              HAVING ORDER BY LIMIT OFFSET
-- Operators  = AND OR NOT IN BETWEEN LIKE
--              IS NULL IS NOT NULL
-- Functions  = Aggregate String Logical
--              Date Time Numeric Window
-- Joins      = INNER LEFT RIGHT FULL
-- Subqueries = Single Row Multi Row Correlated
-- CTE        = Simple and Multiple CTEs
-- Normal     = 1NF 2NF 3NF

-- ------------------------------------------------
-- SUMMARY - WHAT I DID TODAY
-- ------------------------------------------------

-- Revised all SQL notes from Day 1 to Day 14
-- Strong revision before starting projects
-- Ready to start SQL projects tomorrow

-- ------------------------------------------------
-- TOMORROW I WILL START
-- ------------------------------------------------

-- Start EDA Project with SQL
-- Start Data Cleaning Project with SQL
-- Work on E-Commerce own project
-- Upload all projects to SQL-Projects folder