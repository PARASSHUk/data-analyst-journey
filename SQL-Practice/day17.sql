-- ================================================
-- Day 17 - SQL Learning Notes
-- Topic: SQL Complete Revision
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Complete revision of all SQL topics
-- Revised all SQL Commands DDL DML DQL
-- Revised all Clauses and Operators
-- Revised all Built-in Functions
-- Revised JOINS all 4 types
-- Revised Subqueries all 3 types
-- Revised CTE Common Table Expression
-- Revised Window Functions
-- Revised Normalization 1NF 2NF 3NF
-- Revised EDA concepts Dimension and Measure

-- ------------------------------------------------
-- 1. SQL COMMANDS QUICK REVISION
-- ------------------------------------------------

-- DDL = Data Definition Language
-- CREATE   = creates table or database
-- DROP     = deletes table or database
-- ALTER    = modifies table structure

-- DML = Data Manipulation Language
-- INSERT   = adds new rows
-- UPDATE   = modifies existing rows
-- DELETE   = removes rows

-- DQL = Data Query Language
-- SELECT   = retrieves data

-- ------------------------------------------------
-- 2. CLAUSES QUICK REVISION
-- ------------------------------------------------

-- Correct writing order of clauses:
-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT
-- OFFSET

-- Example using all clauses:
SELECT
    department,
    COUNT(*)              AS total_employees,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(*) > 1
ORDER BY avg_salary DESC
LIMIT 5
OFFSET 0;

-- ------------------------------------------------
-- 3. OPERATORS QUICK REVISION
-- ------------------------------------------------

-- Comparison  = > < >= <= !=
-- Logical     = AND OR NOT
-- Special     = IN BETWEEN LIKE
--               IS NULL IS NOT NULL

-- ------------------------------------------------
-- 4. ALL FUNCTIONS QUICK REVISION
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS
-- SUM AVG MAX MIN COUNT COUNT DISTINCT

-- STRING FUNCTIONS
-- UPPER LOWER LENGTH LEFT RIGHT
-- SUBSTRING TRIM REVERSE

-- LOGICAL FUNCTIONS
-- IF IFNULL NULLIF COALESCE CASE WHEN

-- DATE TIME FUNCTIONS
-- CURRENT_DATE NOW DAY MONTH YEAR
-- HOUR MINUTE DATE_ADD DATE_SUB DATEDIFF

-- NUMERIC FUNCTIONS
-- ABS CEIL FLOOR MOD ROUND POWER

-- WINDOW FUNCTIONS
-- ROW_NUMBER RANK DENSE_RANK
-- NTILE LAG LEAD PARTITION BY

-- ------------------------------------------------
-- 5. JOINS QUICK REVISION
-- ------------------------------------------------

-- INNER JOIN = only matching rows both tables
SELECT a.col1, b.col2
FROM table_a a
INNER JOIN table_b b
ON a.id = b.id;

-- LEFT JOIN = all left and matching right
SELECT a.col1, b.col2
FROM table_a a
LEFT JOIN table_b b
ON a.id = b.id;

-- RIGHT JOIN = all right and matching left
SELECT a.col1, b.col2
FROM table_a a
RIGHT JOIN table_b b
ON a.id = b.id;

-- FULL JOIN using UNION
SELECT a.col1, b.col2
FROM table_a a
LEFT JOIN table_b b
ON a.id = b.id
UNION
SELECT a.col1, b.col2
FROM table_a a
RIGHT JOIN table_b b
ON a.id = b.id;

-- ------------------------------------------------
-- 6. SUBQUERIES QUICK REVISION
-- ------------------------------------------------

-- Single Row Subquery = returns one value
SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Multi Row Subquery = returns many values
SELECT name, department
FROM employees
WHERE department IN (
    SELECT DISTINCT department
    FROM employees
    WHERE salary > 55000
);

-- Correlated Subquery = inside SELECT clause
SELECT
    emp_name,
    salary,
    (
        SELECT ROUND(AVG(salary), 2)
        FROM employees e2
        WHERE e2.department = e1.department
    ) AS dept_avg_salary
FROM employees e1;

-- ------------------------------------------------
-- 7. CTE QUICK REVISION
-- ------------------------------------------------

-- Simple CTE
WITH high_earners AS
(
    SELECT emp_name, department, salary
    FROM employees
    WHERE salary > 55000
)
SELECT *
FROM high_earners
ORDER BY salary DESC;

-- CTE with Window Function
WITH ranked AS
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
FROM ranked
WHERE dept_rank = 1;

-- ------------------------------------------------
-- 8. WINDOW FUNCTIONS QUICK REVISION
-- ------------------------------------------------

SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC)        AS row_num,
    RANK() OVER(
        ORDER BY salary DESC)        AS rank_num,
    DENSE_RANK() OVER(
        ORDER BY salary DESC)        AS dense_rank,
    NTILE(4) OVER(
        ORDER BY salary DESC)        AS quartile,
    LAG(salary) OVER(
        ORDER BY salary DESC)        AS prev_salary,
    LEAD(salary) OVER(
        ORDER BY salary DESC)        AS next_salary,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC)        AS rank_in_dept
FROM employees;

-- ------------------------------------------------
-- 9. NORMALIZATION QUICK REVISION
-- ------------------------------------------------

-- 1NF = atomic values no repeating groups
-- 2NF = no partial dependencies on primary key
-- 3NF = no transitive dependencies

-- ------------------------------------------------
-- 10. EDA CONCEPTS QUICK REVISION
-- ------------------------------------------------

-- DIMENSION
--   Text based non numeric columns
--   Used for grouping and segmenting
--   Examples: country category product name

-- MEASURE
--   Numeric columns
--   Aggregation makes sense
--   Examples: sales amount quantity price

-- DATABASE EXPLORATION COMMANDS
--   INFORMATION_SCHEMA.TABLES
--   Shows all tables in database

--   INFORMATION_SCHEMA.COLUMNS
--   Shows all columns of a table

-- DIMENSION EXPLORATION
--   SELECT DISTINCT on text columns
--   Finds all unique categories

-- DATE EXPLORATION
--   MIN(date) = first date in data
--   MAX(date) = last date in data
--   DATEDIFF  = total days of data

-- ------------------------------------------------
-- COMPLETE SQL TOPICS MASTERED SO FAR
-- ------------------------------------------------

-- Day 1  = DDL DML DQL Basics Constraints
-- Day 2  = DQL Operators WHERE ORDER BY
-- Day 3  = LIKE Aggregate GROUP BY HAVING
-- Day 4  = String and Logical Functions
-- Day 5  = Date Time Functions and CTE
-- Day 6  = Window Functions Numeric JOINS
-- Day 7  = Subqueries and Normalization
-- Day 8  = Functions and Subquery Practice
-- Day 9  = Pizza Project Q1 to Q7
-- Day 10 = Pizza Project Q8
-- Day 11 = All Commands Practice
-- Day 12 = 10 SQL Problems Solved
-- Day 13 = Complete SQL Revision
-- Day 14 = Pizza Project All 13 Questions Done
-- Day 15 = Full SQL Revision
-- Day 16 = EDA Project Started
-- Day 17 = Complete SQL Revision 

-- ------------------------------------------------
-- SUMMARY - WHAT I DID TODAY
-- ------------------------------------------------

-- Strong revision of all SQL topics
-- Reinforced all concepts before projects
-- Confident in all SQL commands and functions
-- Ready to continue EDA project tomorrow

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- Continue EDA Project with SQL
-- Measure Exploration
-- Magnitude Analysis
-- Ranking Analysis
-- Time Series Analysis
-- Upload EDA project to SQL-Projects folder