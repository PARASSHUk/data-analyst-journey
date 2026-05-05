-- ================================================
-- Day 20 - SQL Learning Notes
-- Topic: Complete SQL Journey Revision
--        Everything Learned Till Now
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Complete revision of everything learned
-- from Day 1 to Day 19 of SQL practice
-- Revised all SQL Commands
-- Revised all Clauses and Operators
-- Revised all 6 Built-in Function categories
-- Revised JOINS all 4 types
-- Revised Subqueries all 3 types
-- Revised CTE Common Table Expression
-- Revised Window Functions with PARTITION BY
-- Revised Normalization 1NF 2NF 3NF
-- Revised EDA concepts Dimension and Measure

-- ================================================
-- COMPLETE SQL JOURNEY REVISION
-- ================================================

-- ------------------------------------------------
-- CHAPTER 1 - SQL COMMANDS
-- ------------------------------------------------

-- DDL - Data Definition Language
-- CREATE   = creates new table or database
-- DROP     = deletes table or database
-- ALTER    = modifies table structure
--   ADD COLUMN    = adds new column
--   DROP COLUMN   = removes a column
--   CHANGE COLUMN = renames a column
--   MODIFY COLUMN = changes data type

-- DML - Data Manipulation Language
-- INSERT   = adds new rows to table
-- UPDATE   = modifies existing rows
-- DELETE   = removes rows from table

-- DQL - Data Query Language
-- SELECT   = retrieves data from table

-- ------------------------------------------------
-- CHAPTER 2 - ALL CLAUSES
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

-- Example using ALL clauses together
SELECT
    department,
    COUNT(*)                AS total_employees,
    ROUND(AVG(salary), 2)   AS avg_salary,
    SUM(salary)             AS total_salary
FROM employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(*) > 1
ORDER BY avg_salary DESC
LIMIT 5
OFFSET 0;

-- ------------------------------------------------
-- CHAPTER 3 - ALL OPERATORS
-- ------------------------------------------------

-- Comparison Operators
-- =    equal to
-- >    greater than
-- <    less than
-- >=   greater than or equal
-- <=   less than or equal
-- !=   not equal to

-- Logical Operators
-- AND          = both conditions true
-- OR           = one condition true
-- NOT          = negates condition

-- Special Operators
-- IN           = matches list of values
-- BETWEEN      = value in a range
-- LIKE         = pattern matching
-- IS NULL      = checks for null
-- IS NOT NULL  = checks for not null

-- LIKE Patterns
-- LIKE "A%"    = starts with A
-- LIKE "%A"    = ends with A
-- LIKE "%A%"   = contains A
-- LIKE "_A%"   = second char is A
-- LIKE "___"   = exactly 3 characters

-- ------------------------------------------------
-- CHAPTER 4 - ALL CONSTRAINTS
-- ------------------------------------------------

-- PRIMARY KEY  = unique and not null
-- FOREIGN KEY  = links two tables
-- UNIQUE       = no duplicate values
-- NOT NULL     = cannot be empty
-- DEFAULT      = sets default value
-- CHECK        = value must meet condition

-- ------------------------------------------------
-- CHAPTER 5 - ALL BUILT-IN FUNCTIONS
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS
-- COUNT(*)              = count all rows
-- COUNT(DISTINCT col)   = count unique values
-- SUM(col)              = sum all values
-- AVG(col)              = average value
-- MAX(col)              = highest value
-- MIN(col)              = lowest value

-- STRING FUNCTIONS
-- UPPER(col)            = to uppercase
-- LOWER(col)            = to lowercase
-- LENGTH(col)           = character count
-- LEFT(col, n)          = first n chars
-- RIGHT(col, n)         = last n chars
-- SUBSTRING(col, s, n)  = extract part
-- TRIM(col)             = remove spaces
-- REVERSE(col)          = reverse text

-- LOGICAL FUNCTIONS
-- IF(cond, true, false) = simple condition
-- IFNULL(col, value)    = replace null
-- NULLIF(val1, val2)    = null if equal
-- COALESCE(c1, c2)      = first non null
-- CASE WHEN THEN ELSE   = multi condition

-- DATE TIME FUNCTIONS
-- CURRENT_DATE()        = today date
-- CURRENT_TIME()        = current time
-- NOW()                 = date and time
-- DAY(date)             = extract day
-- MONTH(date)           = extract month
-- YEAR(date)            = extract year
-- HOUR(time)            = extract hour
-- MINUTE(time)          = extract minute
-- DATE_ADD(d, INTERVAL) = add to date
-- DATE_SUB(d, INTERVAL) = subtract from date
-- DATEDIFF(end, start)  = days between

-- NUMERIC FUNCTIONS
-- ABS(n)                = no negative sign
-- CEIL(n)               = always round up
-- FLOOR(n)              = always round down
-- MOD(n, d)             = remainder
-- ROUND(n, d)           = round decimals
-- POWER(n, e)           = n to power e

-- WINDOW FUNCTIONS
-- ROW_NUMBER()          = unique row number
-- RANK()                = rank with gaps
-- DENSE_RANK()          = rank no gaps
-- NTILE(n)              = n equal groups
-- LAG()                 = previous row value
-- LEAD()                = next row value
-- PARTITION BY          = reset per group

-- ------------------------------------------------
-- CHAPTER 6 - ALL JOINS
-- ------------------------------------------------

-- INNER JOIN
-- returns only matching rows from both tables
SELECT a.col1, b.col2
FROM table_a a
INNER JOIN table_b b
ON a.id = b.id;

-- LEFT JOIN
-- returns all left rows and matching right
SELECT a.col1, b.col2
FROM table_a a
LEFT JOIN table_b b
ON a.id = b.id;

-- RIGHT JOIN
-- returns all right rows and matching left
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
-- INNER JOIN = matching rows only
-- LEFT JOIN  = all left + matching right
-- RIGHT JOIN = all right + matching left
-- FULL JOIN  = all rows both tables

-- ------------------------------------------------
-- CHAPTER 7 - SUBQUERIES
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
-- returns many values used with IN
SELECT name, department
FROM employees
WHERE department IN (
    SELECT DISTINCT department
    FROM employees
    WHERE salary > 55000
);

-- Correlated Subquery
-- subquery references outer query
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
-- CHAPTER 8 - CTE
-- ------------------------------------------------

-- Simple CTE
WITH cte_name AS
(
    SELECT col1, col2
    FROM table_name
    WHERE condition
)
SELECT * FROM cte_name;

-- CTE with Window Function
WITH ranked_data AS
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
FROM ranked_data
WHERE dept_rank = 1;

-- Multiple CTEs
WITH
cte_one AS
(
    SELECT department, COUNT(*) AS total
    FROM employees
    GROUP BY department
),
cte_two AS
(
    SELECT department, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department
)
SELECT
    c1.department,
    c1.total,
    ROUND(c2.avg_sal, 2) AS avg_salary
FROM cte_one c1
INNER JOIN cte_two c2
ON c1.department = c2.department;

-- ------------------------------------------------
-- CHAPTER 9 - NORMALIZATION
-- ------------------------------------------------

-- 1NF First Normal Form
-- atomic values no repeating groups
-- each row must be unique

-- 2NF Second Normal Form
-- must be in 1NF
-- no partial dependencies on primary key

-- 3NF Third Normal Form
-- must be in 2NF
-- no transitive dependencies

-- ------------------------------------------------
-- CHAPTER 10 - EDA CONCEPTS
-- ------------------------------------------------

-- DIMENSION
-- text based non numeric columns
-- used for grouping and segmenting
-- examples: country category product name
-- used in GROUP BY WHERE ORDER BY

-- MEASURE
-- numeric columns
-- aggregation makes sense
-- examples: sales quantity price
-- used in SUM AVG MAX MIN COUNT

-- DATABASE EXPLORATION
-- INFORMATION_SCHEMA.TABLES
--   shows all tables in database
-- INFORMATION_SCHEMA.COLUMNS
--   shows all columns of a table

-- ------------------------------------------------
-- COMPLETE SQL LEARNING SUMMARY
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
-- Day 14 = Pizza Project All 13 Done
-- Day 15 = Full SQL Revision
-- Day 16 = EDA Project Started
-- Day 17 = Complete SQL Revision
-- Day 18 = Commands and Functions Revision
-- Day 19 = Built-in Functions Revision
-- Day 20 = Complete Journey Revision 

-- ------------------------------------------------
-- SKILLS MASTERED IN SQL
-- ------------------------------------------------

-- Commands    = DDL DML DQL              
-- Clauses     = 8 clauses               
-- Operators   = 10 plus operators       
-- Constraints = 6 constraints           
-- Functions   = 6 types 40 plus         
-- JOINS       = 4 types                 
-- Subqueries  = 3 types                 
-- CTE         = Simple and Multiple     
-- Window Fn   = 6 functions             
-- Normalization = 1NF 2NF 3NF         
-- EDA         = Dimension and Measure   

-- ------------------------------------------------
-- TOMORROW I WILL START
-- ------------------------------------------------

-- SQL Projects Phase Begins!
-- Project 1 = EDA with SQL
