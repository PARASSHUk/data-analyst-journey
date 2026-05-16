-- ================================================
-- Day 31 - SQL Learning Notes
-- Topic: SQL Revision and Question Practice

-- ================================================

-- ------------------------------------------------
-- NOTE
-- ------------------------------------------------

-- Exams completed yesterday!
-- Now fully focused on SQL practice
-- Doing revision and question practice
-- GitHub streak maintained every day
-- 31 days completed zero days missed 
-- SQL Projects starting very soon!

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised all SQL topics
-- Practiced SQL questions on
--   JOINS
--   Subqueries
--   GROUP BY and HAVING
--   Window Functions
--   CTE
--   Aggregate Functions

-- ================================================
-- REVISION NOTES
-- ================================================

-- SQL COMMANDS
-- DDL = CREATE DROP ALTER
-- DML = INSERT UPDATE DELETE
-- DQL = SELECT

-- CLAUSES IN CORRECT ORDER
-- SELECT FROM WHERE
-- GROUP BY HAVING
-- ORDER BY LIMIT OFFSET

-- OPERATORS
-- Comparison  = > < >= <= !=
-- Logical     = AND OR NOT
-- Special     = IN BETWEEN LIKE
--               IS NULL IS NOT NULL

-- ALL FUNCTIONS
-- Aggregate = COUNT SUM AVG MAX MIN
-- String    = UPPER LOWER LENGTH LEFT
--             RIGHT SUBSTRING TRIM REVERSE
-- Logical   = IF IFNULL NULLIF COALESCE CASE
-- Date Time = CURRENT_DATE NOW DAY MONTH
--             YEAR DATE_ADD DATE_SUB DATEDIFF
-- Numeric   = ABS CEIL FLOOR MOD ROUND POWER
-- Window    = ROW_NUMBER RANK DENSE_RANK
--             NTILE LAG LEAD PARTITION BY

-- JOINS
-- INNER JOIN = matching rows only
-- LEFT JOIN  = all left matching right
-- RIGHT JOIN = all right matching left
-- FULL JOIN  = all rows both tables

-- SUBQUERIES
-- Single Row  = one value   use = > 
-- Multi Row   = many values use IN
-- Correlated  = inside SELECT clause

-- CTE
-- WITH name AS (query)
-- SELECT * FROM name

-- NORMALIZATION
-- 1NF = atomic values no repeating groups
-- 2NF = no partial key dependencies
-- 3NF = no transitive dependencies

-- ================================================
-- SQL QUESTIONS PRACTICED TODAY
-- ================================================

-- ------------------------------------------------
-- Q1. Find total sales per department
--     only show departments with
--     total sales above 100000
-- ------------------------------------------------
SELECT
    department,
    COUNT(*)                    AS total_employees,
    SUM(salary)                 AS total_salary,
    ROUND(AVG(salary), 2)       AS avg_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000
ORDER BY total_salary DESC;

-- ------------------------------------------------
-- Q2. Find top 3 highest paid employees
--     in each department using
--     Window Functions
-- ------------------------------------------------
WITH ranked_employees AS
(
    SELECT
        emp_name,
        department,
        salary,
        DENSE_RANK() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees
)
SELECT
    emp_name,
    department,
    salary,
    dept_rank
FROM ranked_employees
WHERE dept_rank <= 3
ORDER BY department, dept_rank;

-- ------------------------------------------------
-- Q3. Find employees earning more than
--     average salary of their department
-- ------------------------------------------------
SELECT
    e.emp_name,
    e.department,
    e.salary,
    ROUND(dept_avg.avg_salary, 2)   AS dept_avg_salary,
    ROUND(
        e.salary - dept_avg.avg_salary
    , 2)                            AS above_avg_by
FROM employees e
INNER JOIN
(
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg
ON e.department = dept_avg.department
WHERE e.salary > dept_avg.avg_salary
ORDER BY above_avg_by DESC;

-- ------------------------------------------------
-- Q4. Find cumulative salary
--     department wise
-- ------------------------------------------------
SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
        ORDER BY salary DESC
    )                               AS cumulative_salary,
    ROUND(AVG(salary) OVER(
        PARTITION BY department
    ), 2)                           AS dept_avg_salary
FROM employees
ORDER BY department, salary DESC;

-- ------------------------------------------------
-- Q5. Find departments where
--     maximum salary is above 60000
--     and minimum salary is above 40000
-- ------------------------------------------------
SELECT
    department,
    MAX(salary)                 AS max_salary,
    MIN(salary)                 AS min_salary,
    ROUND(AVG(salary), 2)       AS avg_salary,
    COUNT(*)                    AS total_employees
FROM employees
GROUP BY department
HAVING MAX(salary) > 60000
AND MIN(salary) > 40000
ORDER BY max_salary DESC;

-- ------------------------------------------------
-- Q6. Find second highest salary
--     in each department
-- ------------------------------------------------
WITH salary_ranked AS
(
    SELECT
        emp_name,
        department,
        salary,
        DENSE_RANK() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT
    emp_name,
    department,
    salary
FROM salary_ranked
WHERE salary_rank = 2
ORDER BY salary DESC;

-- ------------------------------------------------
-- Q7. Find employees who joined
--     in the same year as the
--     highest paid employee
-- ------------------------------------------------
SELECT
    emp_name,
    department,
    salary,
    join_date
FROM employees
WHERE YEAR(join_date) = (
    SELECT YEAR(join_date)
    FROM employees
    WHERE salary = (
        SELECT MAX(salary)
        FROM employees
    )
)
ORDER BY salary DESC;

-- ------------------------------------------------
-- Q8. Find running total of salary
--     ordered by join date
-- ------------------------------------------------
SELECT
    emp_name,
    department,
    salary,
    join_date,
    SUM(salary) OVER(
        ORDER BY join_date
    )                           AS running_total,
    COUNT(*) OVER(
        ORDER BY join_date
    )                           AS employee_count
FROM employees
ORDER BY join_date;

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Revised all SQL topics completely
-- Solved 8 SQL practice questions
--   GROUP BY with HAVING
--   Top N per group using DENSE_RANK
--   Above average salary per department
--   Cumulative salary with Window Functions
--   Multiple HAVING conditions
--   Second highest salary per department
--   Nested Subquery with YEAR function
--   Running total with Window Functions


-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Start SQL Projects!
-- Project 1 = EDA with SQL
-- Download dataset
-- Start data exploration