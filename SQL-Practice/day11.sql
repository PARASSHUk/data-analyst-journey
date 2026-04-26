-- ================================================
-- Day 11 - SQL Learning Not
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Practiced all SQL Commands
--   DDL - CREATE DROP ALTER
--   DML - INSERT UPDATE DELETE
--   DQL - SELECT
-- Practiced all Built-in Functions
--   Aggregate Functions
--   String Functions
--   Logical Functions
--   Date and Time Functions
--   Numeric Functions
--   Window Functions

-- ------------------------------------------------
-- STEP 1 - SQL COMMANDS PRACTICE
-- ------------------------------------------------

-- DDL COMMANDS - Data Definition Language
-- These commands define structure of database

-- CREATE - creates new table or database
CREATE DATABASE practice_db;
USE practice_db;

CREATE TABLE employees
(
    emp_id      INT          PRIMARY KEY,
    emp_name    VARCHAR(50)  NOT NULL,
    department  VARCHAR(30),
    salary      DECIMAL(10,2),
    join_date   DATE
);

-- ALTER - modify existing table structure
-- Add new column
ALTER TABLE employees
ADD COLUMN location VARCHAR(30);

-- Change column name
ALTER TABLE employees
CHANGE COLUMN location city VARCHAR(30);

-- Change data type of column
ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(15,2);

-- Drop a column
ALTER TABLE employees
DROP COLUMN city;

-- DROP - delete entire table
DROP TABLE employees;

-- ------------------------------------------------
-- DML COMMANDS - Data Manipulation Language
-- These commands manipulate data in tables
-- ------------------------------------------------

-- INSERT - add new rows
INSERT INTO employees VALUES
(1, "Paras Shukla",  "Analytics",  55000, "2024-01-15"),
(2, "Rahul Sharma",  "Finance",    48000, "2024-02-20"),
(3, "Priya Singh",   "Marketing",  52000, "2024-03-10"),
(4, "Amit Kumar",    "Analytics",  61000, "2024-04-05"),
(5, "Neha Gupta",    "HR",         45000, "2024-05-18");

-- UPDATE - modify existing rows
-- Give 10% salary raise to Analytics department
UPDATE employees
SET salary = salary * 1.10
WHERE department = "Analytics";

-- Update single employee record
UPDATE employees
SET department = "Data Analytics"
WHERE emp_id = 1;

-- DELETE - remove rows from table
-- Delete employees with salary below 46000
DELETE FROM employees
WHERE salary < 46000;

-- Delete single employee
DELETE FROM employees
WHERE emp_id = 5;

-- ------------------------------------------------
-- DQL COMMANDS - Data Query Language
-- These commands retrieve data from tables
-- ------------------------------------------------

-- Basic SELECT
SELECT * FROM employees;

-- SELECT specific columns
SELECT emp_name, department, salary
FROM employees;

-- SELECT with WHERE filter
SELECT emp_name, salary
FROM employees
WHERE department = "Analytics"
ORDER BY salary DESC;

-- SELECT with GROUP BY
SELECT
    department,
    COUNT(*)        AS total_employees,
    AVG(salary)     AS avg_salary,
    SUM(salary)     AS total_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- ------------------------------------------------
-- STEP 2 - BUILT IN FUNCTIONS PRACTICE
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS PRACTICE
SELECT
    COUNT(*)                AS total_employees,
    SUM(salary)             AS total_salary,
    ROUND(AVG(salary), 2)   AS avg_salary,
    MAX(salary)             AS highest_salary,
    MIN(salary)             AS lowest_salary
FROM employees;

-- STRING FUNCTIONS PRACTICE
SELECT
    emp_name,
    UPPER(emp_name)              AS name_upper,
    LOWER(emp_name)              AS name_lower,
    LENGTH(emp_name)             AS name_length,
    LEFT(emp_name, 5)            AS first_5_chars,
    RIGHT(emp_name, 5)           AS last_5_chars,
    REVERSE(emp_name)            AS name_reversed,
    TRIM(emp_name)               AS name_trimmed,
    SUBSTRING(emp_name, 1, 5)    AS name_substring
FROM employees;

-- LOGICAL FUNCTIONS PRACTICE
SELECT
    emp_name,
    salary,
    IF(salary > 55000,
       "High Salary",
       "Normal Salary")          AS salary_category,
    IFNULL(department,
       "No Department")          AS dept,
    CASE
        WHEN salary > 60000 THEN "Senior"
        WHEN salary > 50000 THEN "Mid Level"
        ELSE                     "Junior"
    END                          AS level
FROM employees;

-- DATE AND TIME FUNCTIONS PRACTICE
SELECT
    emp_name,
    join_date,
    DAY(join_date)                              AS join_day,
    MONTH(join_date)                            AS join_month,
    YEAR(join_date)                             AS join_year,
    DATEDIFF(CURRENT_DATE(), join_date)         AS days_in_company,
    DATE_ADD(join_date, INTERVAL 1 YEAR)        AS first_anniversary
FROM employees;

-- NUMERIC FUNCTIONS PRACTICE
SELECT
    emp_name,
    salary,
    ROUND(salary, 0)             AS rounded_salary,
    CEIL(salary / 1000)          AS salary_thousands_ceil,
    FLOOR(salary / 1000)         AS salary_thousands_floor,
    ABS(salary - 55000)          AS difference_from_55k,
    POWER(2, 10)                 AS power_example,
    MOD(emp_id, 2)               AS odd_or_even
FROM employees;

-- WINDOW FUNCTIONS PRACTICE
SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC)
                                 AS row_num,
    RANK() OVER(ORDER BY salary DESC)
                                 AS salary_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC)
                                 AS dense_rank,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC)    AS rank_in_dept,
    LAG(salary) OVER(ORDER BY salary DESC)
                                 AS previous_salary,
    LEAD(salary) OVER(ORDER BY salary DESC)
                                 AS next_salary
FROM employees;

-- ------------------------------------------------
-- SUMMARY - WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- DDL Commands
--   CREATE  = make new table or database
--   ALTER   = change table structure
--   DROP    = delete table completely

-- DML Commands
--   INSERT  = add new rows to table
--   UPDATE  = modify existing rows
--   DELETE  = remove rows from table

-- DQL Commands
--   SELECT  = retrieve data from table

-- All Built-in Functions practiced on
-- a single employees table combining
-- all function types together

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- Continue Pizza Sales Mini Project
-- Solve remaining advanced questions
-- Practice complex JOINS problems
