-- ================================================
-- Day 21 - SQL Learning Notes
-- Topic: SQL Revision
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised all SQL topics learned so far
-- Revised SQL Commands DDL DML DQL
-- Revised all Clauses and Operators
-- Revised all Built-in Functions
-- Revised JOINS Subqueries and CTE
-- Revised Window Functions
-- Revised Normalization and EDA concepts

-- ------------------------------------------------
-- QUICK REVISION - ALL TOPICS
-- ------------------------------------------------

-- ------------------------------------------------
-- 1. SQL COMMANDS
-- ------------------------------------------------

-- DDL = CREATE DROP ALTER
-- DML = INSERT UPDATE DELETE
-- DQL = SELECT

-- ------------------------------------------------
-- 2. ALL CLAUSES IN ORDER
-- ------------------------------------------------

-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT
-- OFFSET

-- ------------------------------------------------
-- 3. ALL OPERATORS
-- ------------------------------------------------

-- Comparison  = > < >= <= !=
-- Logical     = AND OR NOT
-- Special     = IN BETWEEN LIKE
--               IS NULL IS NOT NULL

-- ------------------------------------------------
-- 4. ALL CONSTRAINTS
-- ------------------------------------------------

-- PRIMARY KEY  = unique and not null
-- FOREIGN KEY  = links two tables
-- UNIQUE       = no duplicates
-- NOT NULL     = cannot be empty
-- DEFAULT      = sets default value
-- CHECK        = value must meet condition

-- ------------------------------------------------
-- 5. ALL BUILT-IN FUNCTIONS
-- ------------------------------------------------

-- AGGREGATE
-- COUNT SUM AVG MAX MIN COUNT DISTINCT

-- STRING
-- UPPER LOWER LENGTH LEFT RIGHT
-- SUBSTRING TRIM REVERSE

-- LOGICAL
-- IF IFNULL NULLIF COALESCE CASE WHEN

-- DATE TIME
-- CURRENT_DATE CURRENT_TIME NOW
-- DAY MONTH YEAR HOUR MINUTE
-- DATE_ADD DATE_SUB DATEDIFF

-- NUMERIC
-- ABS CEIL FLOOR MOD ROUND POWER

-- WINDOW
-- ROW_NUMBER RANK DENSE_RANK
-- NTILE LAG LEAD PARTITION BY

-- ------------------------------------------------
-- 6. ALL JOINS
-- ------------------------------------------------

-- INNER JOIN = matching rows only
-- LEFT JOIN  = all left matching right
-- RIGHT JOIN = all right matching left
-- FULL JOIN  = all rows both tables

-- ------------------------------------------------
-- 7. SUBQUERIES
-- ------------------------------------------------

-- Single Row  = one value   use = > 
-- Multi Row   = many values use IN
-- Correlated  = inside SELECT clause

-- ------------------------------------------------
-- 8. CTE
-- ------------------------------------------------

-- WITH cte_name AS (query)
-- SELECT * FROM cte_name
-- Makes complex queries readable
-- Temporary table during query only

-- ------------------------------------------------
-- 9. WINDOW FUNCTIONS
-- ------------------------------------------------

-- ROW_NUMBER()  = unique number each row
-- RANK()        = rank with gaps for ties
-- DENSE_RANK()  = rank without gaps
-- NTILE(n)      = divide into n groups
-- LAG()         = value from previous row
-- LEAD()        = value from next row
-- PARTITION BY  = resets per group

-- ------------------------------------------------
-- 10. NORMALIZATION
-- ------------------------------------------------

-- 1NF = atomic values no repeating groups
-- 2NF = no partial key dependencies
-- 3NF = no transitive dependencies

-- ------------------------------------------------
-- 11. EDA CONCEPTS
-- ------------------------------------------------

-- DIMENSION = text columns for grouping
-- MEASURE   = numeric columns for calculating

-- INFORMATION_SCHEMA.TABLES   = all tables
-- INFORMATION_SCHEMA.COLUMNS  = all columns

-- ------------------------------------------------
-- COMPLETE SQL JOURNEY - 21 DAYS
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
-- Day 21 = SQL Revision 

-- ------------------------------------------------
-- SKILLS MASTERED AFTER 21 DAYS
-- ------------------------------------------------

-- Commands      = DDL DML DQL           
-- Clauses       = 8 clauses             
-- Operators     = 10 plus operators     
-- Constraints   = 6 constraints         
-- Functions     = 6 types 40 plus       
-- JOINS         = 4 types               
-- Subqueries    = 3 types               
-- CTE           = Simple and Multiple   
-- Window Fn     = 6 functions           
-- Normalization = 1NF 2NF 3NF          
-- EDA           = Dimension Measure     
-- Projects      = Pizza Sales Done      

-- ------------------------------------------------
-- SUMMARY - WHAT I DID TODAY
-- ------------------------------------------------

-- Revised all SQL topics from Day 1 to Day 20
-- Strong revision of all commands and functions
-- Confident in all SQL concepts
-- Ready to build SQL projects

-- ------------------------------------------------
-- TOMORROW I WILL START
-- ------------------------------------------------

-- SQL Projects Phase!
-- EDA Project with SQL