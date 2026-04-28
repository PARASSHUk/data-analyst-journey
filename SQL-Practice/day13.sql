-- ================================================
-- Day 13 - SQL Learning Notes
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Complete revision of all SQL topics
-- Revised all Built-in Functions
--   Aggregate Functions
--   String Functions
--   Logical Functions
--   Date and Time Functions
--   Numeric Functions
--   Window Functions
-- Revised all SQL Commands
--   DDL - CREATE DROP ALTER
--   DML - INSERT UPDATE DELETE
--   DQL - SELECT
-- Revised all Clauses and Operators
-- Revised JOINS - all 4 types
-- Revised Subqueries - all 3 types
-- Revised CTE - Common Table Expression
-- Revised Normalization - 1NF 2NF 3NF

-- ------------------------------------------------
-- COMPLETE SQL REVISION
-- ------------------------------------------------

-- ------------------------------------------------
-- 1. ALL SQL COMMANDS REVISION
-- ------------------------------------------------

-- DDL COMMANDS
-- CREATE   = creates new table or database
-- DROP     = deletes table or database
-- ALTER    = modifies table structure

-- DML COMMANDS
-- INSERT   = adds new rows to table
-- UPDATE   = modifies existing rows
-- DELETE   = removes rows from table

-- DQL COMMANDS
-- SELECT   = retrieves data from table

-- ------------------------------------------------
-- 2. ALL CLAUSES REVISION
-- ------------------------------------------------

-- SELECT   = choose which columns to show
-- FROM     = which table to get data from
-- WHERE    = filter rows before grouping
-- GROUP BY = group same values together
-- HAVING   = filter groups after grouping
-- ORDER BY = sort results ASC or DESC
-- LIMIT    = show only n rows
-- OFFSET   = skip first n rows

-- Correct order of clauses in a query:
-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT
-- OFFSET

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
-- IN       = matches list of values
-- BETWEEN  = value within a range
-- LIKE     = pattern matching
-- IS NULL  = checks for null value
-- IS NOT NULL = checks for non null value

-- ------------------------------------------------
-- 4. ALL FUNCTIONS REVISION
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS
SELECT
    COUNT(*)                AS total_rows,
    COUNT(DISTINCT dept)    AS unique_depts,
    SUM(salary)             AS total_salary,
    ROUND(AVG(salary), 2)   AS avg_salary,
    MAX(salary)             AS highest_salary,
    MIN(salary)             AS lowest_salary
FROM employees;

-- STRING FUNCTIONS
SELECT
    emp_name,
    UPPER(emp_name)             AS upper_name,
    LOWER(emp_name)             AS lower_name,
    LENGTH(emp_name)            AS name_length,
    LEFT(emp_name, 3)           AS first_3,
    RIGHT(emp_name, 3)          AS last_3,
    SUBSTRING(emp_name, 1, 4)   AS sub_name,
    TRIM(emp_name)              AS trimmed,
    REVERSE(emp_name)           AS reversed
FROM employees;

-- LOGICAL FUNCTIONS
SELECT
    emp_name,
    salary,
    IF(salary > 50000,
        "High",
        "Low")                  AS salary_level,
    IFNULL(dept, "No Dept")     AS department,
    NULLIF(salary, 0)           AS safe_salary,
    COALESCE(dept, city,
        "Unknown")              AS location,
    CASE
        WHEN salary > 60000 THEN "Senior"
        WHEN salary > 50000 THEN "Mid Level"
        WHEN salary > 40000 THEN "Junior"
        ELSE                     "Trainee"
    END                         AS level
FROM employees;

-- DATE AND TIME FUNCTIONS
SELECT
    emp_name,
    join_date,
    CURRENT_DATE()              AS today,
    DAY(join_date)              AS join_day,
    MONTH(join_date)            AS join_month,
    YEAR(join_date)             AS join_year,
    HOUR(CURRENT_TIME())        AS current_hour,
    MINUTE(CURRENT_TIME())      AS current_minute,
    DATEDIFF(
        CURRENT_DATE(),
        join_date)              AS days_worked,
    DATE_ADD(join_date,
        INTERVAL 1 YEAR)        AS first_anniversary,
    DATE_SUB(join_date,
        INTERVAL 7 DAY)         AS week_before_joining
FROM employees;

-- NUMERIC FUNCTIONS
SELECT
    salary,
    ABS(salary - 55000)         AS diff_from_55k,
    CEIL(salary / 1000)         AS ceil_thousands,
    FLOOR(salary / 1000)        AS floor_thousands,
    MOD(salary, 1000)           AS remainder,
    ROUND(salary, -3)           AS rounded_to_k,
    POWER(2, 8)                 AS two_power_8
FROM employees;

-- WINDOW FUNCTIONS
SELECT
    emp_name,
    dept,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC)       AS row_num,
    RANK() OVER(
        ORDER BY salary DESC)       AS rank_num,
    DENSE_RANK() OVER(
        ORDER BY salary DESC)       AS dense_rank,
    NTILE(4) OVER(
        ORDER BY salary DESC)       AS quartile,
    LAG(salary) OVER(
        ORDER BY salary DESC)       AS prev_salary,
    LEAD(salary) OVER(
        ORDER BY salary DESC)       AS next_salary,
    RANK() OVER(
        PARTITION BY dept
        ORDER BY salary DESC)       AS rank_in_dept
FROM employees;

-- ------------------------------------------------
-- 5. ALL JOINS REVISION
-- ------------------------------------------------

-- INNER JOIN = only matching rows both tables
SELECT c.name, o.order_id, o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- LEFT JOIN = all left and matching right
SELECT c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- RIGHT JOIN = all right and matching left
SELECT c.name, o.order_id, o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- FULL JOIN using UNION
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT c.name, o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- ------------------------------------------------
-- 6. SUBQUERIES REVISION
-- ------------------------------------------------

-- Single Row Subquery
SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Multi Row Subquery
SELECT name, dept
FROM employees
WHERE dept IN (
    SELECT DISTINCT dept
    FROM employees
    WHERE salary > 55000
);

-- Correlated Subquery
SELECT
    emp_name,
    dept,
    salary,
    (SELECT ROUND(AVG(salary), 2)
     FROM employees e2
     WHERE e2.dept = e1.dept) AS dept_avg_salary
FROM employees e1;

-- ------------------------------------------------
-- 7. CTE REVISION
-- ------------------------------------------------

-- Simple CTE
WITH high_earners AS
(
    SELECT emp_name, dept, salary
    FROM employees
    WHERE salary > 55000
)
SELECT * FROM high_earners
ORDER BY salary DESC;

-- Multiple CTEs
WITH
dept_avg AS
(
    SELECT dept,
           ROUND(AVG(salary), 2) AS avg_salary
    FROM employees
    GROUP BY dept
),
dept_count AS
(
    SELECT dept,
           COUNT(*) AS total_emp
    FROM employees
    GROUP BY dept
)
SELECT
    da.dept,
    da.avg_salary,
    dc.total_emp
FROM dept_avg da
INNER JOIN dept_count dc
ON da.dept = dc.dept
ORDER BY avg_salary DESC;

-- ------------------------------------------------
-- 8. NORMALIZATION REVISION
-- ------------------------------------------------

-- 1NF = atomic values no repeating groups
-- 2NF = no partial dependencies on primary key
-- 3NF = no transitive dependencies

-- ------------------------------------------------
-- COMPLETE SQL JOURNEY SUMMARY
-- ------------------------------------------------

-- Day 1  = DDL DML DQL Basics and Constraints
-- Day 2  = DQL Operators WHERE ORDER BY IN BETWEEN
-- Day 3  = LIKE Aggregate Functions GROUP BY HAVING
-- Day 4  = String Functions Logical Functions
-- Day 5  = Date Time Functions and CTE
-- Day 6  = Window Functions Numeric Functions JOINS
-- Day 7  = Subqueries and Normalization
-- Day 8  = Functions and Subquery Practice
-- Day 9  = Pizza Sales Project Q1 to Q7
-- Day 10 = Pizza Sales Project Q8
-- Day 11 = All Commands Practice
-- Day 12 = 10 SQL Problems Solved
-- Day 13 = Complete SQL Revision FINAL DAY 

-- ------------------------------------------------
-- SQL LEARNING PHASE COMPLETED 
-- ------------------------------------------------

-- Total SQL Days     = 13
-- Commands Learned   = DDL DML DQL
-- Functions Learned  = 6 types 40+ functions
-- Clauses Learned    = 8 clauses
-- Operators Learned  = 10+ operators
-- JOINS Learned      = 4 types
-- Subqueries Learned = 3 types
-- Mini Projects Done = Pizza Sales Analysis
-- StrataScratch      = Questions solved

-- ------------------------------------------------
-- NEXT PHASE - Building SQL Projects for data analysis role.
-- ------------------------------------------------

-- Building sql project this whole week as much as possible for better understanding.