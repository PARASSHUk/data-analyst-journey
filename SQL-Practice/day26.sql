-- ================================================
-- Day 26 - SQL Learning Notes
-- Topic: SQL Commands and CTE Practice
-- Total SQL Days Completed: 26
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Practiced all SQL Commands
--   DDL - CREATE DROP ALTER
--   DML - INSERT UPDATE DELETE
--   DQL - SELECT
-- Practiced Common Table Expression CTE
--   Simple CTE
--   Multiple CTEs
--   CTE with Window Functions
--   CTE with Subqueries

-- ------------------------------------------------
-- SQL COMMANDS PRACTICE
-- ------------------------------------------------

-- DDL COMMANDS

-- CREATE database and table
CREATE DATABASE practice_db;
USE practice_db;

CREATE TABLE employees
(
    emp_id      INT           PRIMARY KEY,
    emp_name    VARCHAR(50)   NOT NULL,
    department  VARCHAR(30),
    salary      DECIMAL(10,2),
    join_date   DATE
);

-- ALTER - add column
ALTER TABLE employees
ADD COLUMN city VARCHAR(30);

-- ALTER - rename column
ALTER TABLE employees
CHANGE COLUMN city location VARCHAR(30);

-- ALTER - change data type
ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(15,2);

-- ALTER - drop column
ALTER TABLE employees
DROP COLUMN location;

-- DROP - delete table
DROP TABLE employees;

-- DML COMMANDS

-- INSERT - add rows
INSERT INTO employees VALUES
(1, "Paras Shukla",  "Analytics",  65000, "2024-01-10"),
(2, "Rahul Sharma",  "Finance",    52000, "2024-02-15"),
(3, "Priya Singh",   "Marketing",  48000, "2024-03-20"),
(4, "Amit Kumar",    "Analytics",  71000, "2024-04-05"),
(5, "Neha Gupta",    "HR",         45000, "2024-05-12"),
(6, "Ravi Verma",    "Finance",    58000, "2024-06-18"),
(7, "Sonia Mehta",   "Analytics",  69000, "2024-07-22"),
(8, "Vikram Das",    "Marketing",  51000, "2024-08-30");

-- UPDATE - modify rows
UPDATE employees
SET salary = salary * 1.10
WHERE department = "Analytics";

-- DELETE - remove rows
DELETE FROM employees
WHERE salary < 46000;

-- DQL COMMANDS

-- Basic SELECT
SELECT * FROM employees;

-- SELECT with WHERE
SELECT emp_name, department, salary
FROM employees
WHERE salary > 55000
ORDER BY salary DESC;

-- SELECT with GROUP BY
SELECT
    department,
    COUNT(*)                AS total_employees,
    ROUND(AVG(salary), 2)   AS avg_salary,
    SUM(salary)             AS total_salary,
    MAX(salary)             AS highest_salary
FROM employees
GROUP BY department
HAVING COUNT(*) > 1
ORDER BY avg_salary DESC;

-- ------------------------------------------------
-- CTE PRACTICE
-- ------------------------------------------------

-- WHAT IS CTE
-- CTE = Common Table Expression
-- Creates a temporary named result set
-- Only exists during the query execution
-- Makes complex queries easier to read
-- Uses WITH keyword

-- BASIC CTE SYNTAX
-- WITH cte_name AS
-- (
--     your query here
-- )
-- SELECT * FROM cte_name;

-- ------------------------------------------------
-- SIMPLE CTE
-- ------------------------------------------------

-- Find employees earning above average salary
WITH above_avg_salary AS
(
    SELECT
        emp_name,
        department,
        salary
    FROM employees
    WHERE salary > (
        SELECT AVG(salary)
        FROM employees
    )
)
SELECT *
FROM above_avg_salary
ORDER BY salary DESC;

-- ------------------------------------------------
-- CTE WITH AGGREGATE FUNCTIONS
-- ------------------------------------------------

-- Find department wise salary summary
WITH dept_summary AS
(
    SELECT
        department,
        COUNT(*)                AS total_employees,
        ROUND(AVG(salary), 2)   AS avg_salary,
        SUM(salary)             AS total_salary,
        MAX(salary)             AS highest_salary,
        MIN(salary)             AS lowest_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_summary
ORDER BY avg_salary DESC;

-- ------------------------------------------------
-- MULTIPLE CTEs TOGETHER
-- ------------------------------------------------

-- Find departments with high average salary
-- and more than 1 employee
WITH
dept_avg AS
(
    SELECT
        department,
        ROUND(AVG(salary), 2) AS avg_salary
    FROM employees
    GROUP BY department
),
dept_count AS
(
    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
)
SELECT
    da.department,
    da.avg_salary,
    dc.total_employees
FROM dept_avg da
INNER JOIN dept_count dc
ON da.department = dc.department
WHERE dc.total_employees > 1
ORDER BY da.avg_salary DESC;

-- ------------------------------------------------
-- CTE WITH WINDOW FUNCTIONS
-- ------------------------------------------------

-- Find top earning employee in each department
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
SELECT
    emp_name,
    department,
    salary
FROM ranked_employees
WHERE dept_rank = 1
ORDER BY salary DESC;

-- ------------------------------------------------
-- CTE WITH SUBQUERY
-- ------------------------------------------------

-- Find employees earning above
-- their department average
WITH dept_averages AS
(
    SELECT
        department,
        ROUND(AVG(salary), 2) AS dept_avg
    FROM employees
    GROUP BY department
)
SELECT
    e.emp_name,
    e.department,
    e.salary,
    da.dept_avg,
    ROUND(e.salary - da.dept_avg, 2) AS above_avg_by
FROM employees e
INNER JOIN dept_averages da
ON e.department = da.department
WHERE e.salary > da.dept_avg
ORDER BY above_avg_by DESC;

-- ------------------------------------------------
-- CTE SUMMARY
-- ------------------------------------------------

-- Simple CTE      = one temporary table
-- Multiple CTEs   = two or more temp tables
-- CTE with Window = ranking inside CTE
-- CTE with Join   = combining CTEs together
-- CTE with Sub    = subquery inside CTE

-- WHY USE CTE
-- Makes long queries easy to read
-- Reuse same subquery multiple times
-- Replaces complex nested subqueries
-- Does not create permanent table
-- Only exists during current query

-- ------------------------------------------------
-- SUMMARY - WHAT I DID TODAY
-- ------------------------------------------------

-- Practiced all DDL DML DQL commands
-- Practiced Simple CTE
-- Practiced Multiple CTEs
-- Practiced CTE with Window Functions
-- Practiced CTE with Subqueries

-- ------------------------------------------------
-- TOMORROW I WILL
-- ------------------------------------------------

-- Continue exam preparation
-- Quick SQL revision
-- Projects starting very soon!