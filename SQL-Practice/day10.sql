-- ================================================
-- Day 10 - SQL Learning Notes
-- Topic: SQL Revision and Pizza Sales Project
--        Continuation - Q8
-- 
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised SQL topics
--   Built-in Functions revision
--   Clauses revision - WHERE GROUP BY HAVING
--                      ORDER BY LIMIT OFFSET
--   Commands revision - DDL DML DQL
-- Solved Pizza Sales Project Question 8

-- ------------------------------------------------
-- MINI PROJECT - PIZZA SALES ANALYSIS
-- ------------------------------------------------

-- Project Name: Pizza Sales Analysis
-- Tool: SQL Server
-- Status: In Progress
-- Questions Solved Today: Q8

-- ------------------------------------------------
-- Q8. Find the category wise distribution of pizzas
-- ------------------------------------------------

-- Objective:
-- Find how many pizzas belong to each category
-- Join pizza_types, pizzas and order_details
-- Group by category to get distribution

-- Tables Used:
-- pizza_types - has category column
-- pizzas      - connects pizza_types to orders
-- order_details - has pizza_id and quantity

SELECT
    PT.category,
    COUNT(P.pizza_id) AS distributions
FROM pizza_types PT
INNER JOIN pizzas P
ON PT.pizza_type_id = P.pizza_type_id
INNER JOIN order_details od
ON od.pizza_id = P.pizza_id
GROUP BY PT.category
ORDER BY distributions;

-- What this query does:
-- INNER JOIN pizza_types and pizzas
--   to get category for each pizza
-- INNER JOIN order_details
--   to count how many times each pizza ordered
-- GROUP BY category
--   groups all pizzas of same category together
-- COUNT(pizza_id)
--   counts total pizzas in each category
-- ORDER BY distributions
--   shows lowest distribution first

-- ------------------------------------------------
-- QUESTIONS SOLVED SO FAR IN MINI PROJECT
-- ------------------------------------------------

-- Basic Questions
-- Q1  Total number of orders placed        
-- Q2  Total revenue from pizza sales       
-- Q3  Highest priced pizza                 
-- Q4  Most common pizza size ordered       
-- Q5  Top 5 most ordered pizza types       

-- Intermediate Questions
-- Q6  Total quantity per pizza category    
-- Q7  Distribution of orders by hour       
-- Q8  Category wise pizza distribution     

-- ------------------------------------------------
-- TOPICS REVISED TODAY
-- ------------------------------------------------

-- Built-in Functions
--   Aggregate - SUM COUNT MAX MIN AVG
--   String    - LEFT RIGHT TRIM LENGTH REVERSE
--   Logical   - IF IFNULL CASE COALESCE
--   Date Time - NOW DAY MONTH YEAR DATEDIFF
--   Numeric   - ABS CEIL FLOOR MOD ROUND POWER
--   Window    - ROW_NUMBER RANK DENSE_RANK LAG LEAD

-- Clauses Revised
--   WHERE     - filter rows before grouping
--   GROUP BY  - group same values together
--   HAVING    - filter groups after grouping
--   ORDER BY  - sort results ASC or DESC
--   LIMIT     - show only n rows
--   OFFSET    - skip first n rows

-- Commands Revised
--   DDL       - CREATE DROP ALTER
--   DML       - INSERT UPDATE DELETE
--   DQL       - SELECT

-- ------------------------------------------------
-- SUMMARY - WHAT I LEARNED TODAY
-- ------------------------------------------------

-- Category wise distribution query
-- uses 3 table JOINS together
-- COUNT on pizza_id gives distribution
-- GROUP BY category groups same categories
-- ORDER BY distributions sorts by count

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- Solve remaining Pizza Project questions
-- Advanced level questions
