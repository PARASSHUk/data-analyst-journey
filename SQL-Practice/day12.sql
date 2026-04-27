-- ================================================
-- Day 12 - SQL Learning Notes
-- Topic: SQL Commands Practice and
--        Problem Solving
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Practiced all SQL Commands
--   DDL - CREATE DROP ALTER
--   DML - INSERT UPDATE DELETE
--   DQL - SELECT with all clauses
-- Solved SQL Practice Problems
-- Revised all concepts learned so far

-- ------------------------------------------------
-- STEP 1 - SQL COMMANDS REVISION
-- ------------------------------------------------

-- COMPLETE SQL COMMAND SUMMARY

-- DDL COMMANDS
-- CREATE   = creates database or table
-- DROP     = deletes table or database
-- ALTER    = modifies table structure
--            ADD COLUMN
--            DROP COLUMN
--            CHANGE COLUMN
--            MODIFY COLUMN

-- DML COMMANDS
-- INSERT   = adds new rows to table
-- UPDATE   = modifies existing data
-- DELETE   = removes rows from table

-- DQL COMMANDS
-- SELECT   = retrieves data from table

-- ALL CLAUSES
-- FROM     = specifies which table
-- WHERE    = filters rows before grouping
-- GROUP BY = groups same values together
-- HAVING   = filters groups after grouping
-- ORDER BY = sorts results ASC or DESC
-- LIMIT    = shows only n rows
-- OFFSET   = skips first n rows

-- ALL OPERATORS
-- AND      = both conditions must be true
-- OR       = one condition must be true
-- IN       = matches list of values
-- BETWEEN  = value within a range
-- LIKE     = pattern matching with % and _
-- NOT      = negates a condition

-- ------------------------------------------------
-- STEP 2 - SQL PROBLEMS SOLVED TODAY
-- ------------------------------------------------

-- PROBLEM 1 - Basic Aggregation
-- Find total employees and average salary
-- in each department
SELECT
    department,
    COUNT(*)                AS total_employees,
    ROUND(AVG(salary), 2)   AS avg_salary,
    MAX(salary)             AS highest_salary,
    MIN(salary)             AS lowest_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- ------------------------------------------------

-- PROBLEM 2 - Filtering with HAVING
-- Find departments where average salary
-- is above 50000
SELECT
    department,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000
ORDER BY avg_salary DESC;

-- ------------------------------------------------

-- PROBLEM 3 - Using JOINS
-- Find all orders with customer details
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.amount,
    o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- ------------------------------------------------

-- PROBLEM 4 - LEFT JOIN
-- Find customers who have NOT placed any orders
SELECT
    c.customer_name,
    c.city,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- ------------------------------------------------

-- PROBLEM 5 - Subquery Practice
-- Find employees earning above average salary
SELECT
    emp_name,
    department,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;

-- ------------------------------------------------

-- PROBLEM 6 - Window Function Practice
-- Rank employees by salary within department
SELECT
    emp_name,
    department,
    salary,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rank_in_dept,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS overall_rank
FROM employees;

-- ------------------------------------------------

-- PROBLEM 7 - CTE Practice
-- Find top earning employee in each department
WITH dept_rankings AS
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
SELECT
    emp_name,
    department,
    salary
FROM dept_rankings
WHERE dept_rank = 1
ORDER BY salary DESC;

-- ------------------------------------------------

-- PROBLEM 8 - Date Functions Practice
-- Find employees who joined in last 6 months
SELECT
    emp_name,
    department,
    join_date,
    DATEDIFF(CURRENT_DATE(), join_date)
    AS days_in_company
FROM employees
WHERE join_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
ORDER BY join_date DESC;

-- ------------------------------------------------

-- PROBLEM 9 - String Functions Practice
-- Clean and format employee names
SELECT
    emp_id,
    UPPER(emp_name)              AS name_upper,
    LENGTH(emp_name)             AS name_length,
    SUBSTRING(emp_name, 1, 5)    AS short_name,
    CONCAT(emp_name, " - ",
           department)           AS full_detail
FROM employees
ORDER BY name_length DESC;

-- ------------------------------------------------

-- PROBLEM 10 - Complex Query
-- Find department wise performance summary
-- using multiple functions together
WITH dept_summary AS
(
    SELECT
        department,
        COUNT(*)                    AS total_emp,
        ROUND(AVG(salary), 2)       AS avg_salary,
        SUM(salary)                 AS total_salary,
        MAX(salary)                 AS top_salary
    FROM employees
    GROUP BY department
),
dept_ranked AS
(
    SELECT
        department,
        total_emp,
        avg_salary,
        total_salary,
        top_salary,
        RANK() OVER(
            ORDER BY avg_salary DESC
        ) AS salary_rank
    FROM dept_summary
)
SELECT *
FROM dept_ranked
ORDER BY salary_rank;

-- ------------------------------------------------
-- ALL FUNCTIONS PRACTICED TODAY
-- ------------------------------------------------

-- Aggregate  = SUM AVG MAX MIN COUNT
-- String     = UPPER LENGTH SUBSTRING CONCAT TRIM
-- Logical    = IF CASE IFNULL COALESCE
-- Date Time  = DATEDIFF DATE_SUB CURRENT_DATE
-- Numeric    = ROUND ABS CEIL FLOOR
-- Window     = RANK DENSE_RANK PARTITION BY

-- ------------------------------------------------
-- SUMMARY - WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised all SQL commands DDL DML DQL
-- Revised all clauses and operators
-- Solved 10 SQL practice problems
--   Basic aggregation with GROUP BY
--   Filtering groups with HAVING
--   INNER JOIN for matching rows
--   LEFT JOIN for finding missing data
--   Subquery for above average salary
--   Window function RANK with PARTITION
--   CTE for top earner per department
--   Date function for recent joiners
--   String function for name formatting
--   Complex multi CTE query for summary

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- Day 13 - Final SQL Day
-- Complete Pizza Sales Mini Project
-- Solve remaining advanced questions
-- Full SQL revision before Python starts
-- Upload complete SQL practice to GitHub
-- Prepare to start Python learning phase