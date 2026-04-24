-- ================================================
-- Day 9 - SQL Learning Notes
-- Topic: Built-in Functions Revision and
--        Pizza Sales Mini Project
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised all Built-in Functions
--   Aggregate, String, Logical,
--   Date Time, Numeric, Window Functions
-- Started and Solved Pizza Sales Mini Project
--   Solved 5 Basic Level Questions
--   Solved 2 Intermediate Level Questions
--   Used JOINS, GROUP BY, ORDER BY, DATEPART
--   Used ROUND, COUNT, SUM, MAX functions

-- ------------------------------------------------
-- MINI PROJECT - PIZZA SALES ANALYSIS
-- ------------------------------------------------

-- Project Name: Pizza Sales Analysis
-- Tool: SQL Server
-- Database: mini_project
-- Tables Used: orders, order_details,
--              pizzas, pizza_types
-- Status: In Progress

-- Select the database
USE mini_project;

-- Preview all tables
SELECT * FROM dbo.orders;
SELECT * FROM order_details;
SELECT * FROM pizzas;
SELECT * FROM pizza_types;

-- ------------------------------------------------
-- BASIC QUESTIONS
-- ------------------------------------------------

-- Q1. Retrieve the total number of orders placed
-- Used: COUNT function

SELECT
    COUNT(order_id) AS total_orders
FROM orders;

-- ------------------------------------------------

-- Q2. Calculate total revenue from pizza sales
-- Used: INNER JOIN, SUM, ROUND
-- Joined pizzas and order_details on pizza_id
-- Revenue = quantity x price for each order

SELECT
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM pizzas p
INNER JOIN dbo.order_details od
ON p.pizza_id = od.pizza_id;

-- ------------------------------------------------

-- Q3. Identify the highest priced pizza
-- Used: INNER JOIN, MAX, GROUP BY, ORDER BY
-- Joined pizza_types and pizzas tables
-- Used TOP 1 to get only highest priced pizza

SELECT TOP 1
    pt.name                    AS pizza_name,
    ROUND(MAX(p.price), 0)     AS price
FROM pizza_types pt
INNER JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.name
ORDER BY price DESC;

-- ------------------------------------------------

-- Q4. Identify the most common pizza size ordered
-- Used: INNER JOIN, COUNT, GROUP BY, ORDER BY
-- Joined pizzas and order_details on pizza_id
-- Counted total orders for each size

SELECT
    p.size,
    COUNT(od.pizza_id) AS total_orders
FROM pizzas p
INNER JOIN order_details od
ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY total_orders DESC;

-- Finding: Most common size is L (Large)
--          with approximately 18526 orders

-- ------------------------------------------------

-- Q5. List top 5 most ordered pizza types
--     along with their quantities
-- Used: Multiple INNER JOINS, SUM, GROUP BY
-- Joined 3 tables: pizza_types, pizzas, order_details
-- Used SUM on quantity because quantity is a value

SELECT TOP 5
    pt.name,
    SUM(od.quantity) AS total_quantity
FROM pizza_types pt
INNER JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY total_quantity DESC;

-- ------------------------------------------------
-- INTERMEDIATE QUESTIONS
-- ------------------------------------------------

-- Q6. Find total quantity of each pizza
--     category ordered
-- Used: Multiple INNER JOINS, SUM, GROUP BY
-- Joined 3 tables to get category and quantity
-- Grouped by category to get total per category

SELECT
    pt.category,
    SUM(od.quantity) AS total_quantity
FROM pizza_types pt
INNER JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

-- ------------------------------------------------

-- Q7. Determine distribution of orders
--     by hour of the day
-- Used: DATEPART, COUNT, GROUP BY, ORDER BY
-- Note: HOUR() does not work in SQL Server
--       Use DATEPART(HOUR, time) instead
-- This shows which hours are busiest for orders

SELECT
    DATEPART(HOUR, time) AS order_hour,
    COUNT(order_id)      AS total_orders
FROM orders
GROUP BY DATEPART(HOUR, time)
ORDER BY total_orders DESC;

-- ------------------------------------------------
-- KEY FINDINGS FROM PROJECT TODAY
-- ------------------------------------------------

-- Total Orders placed in dataset
--   use Q1 result

-- Highest Revenue pizza
--   use Q2 result for total revenue

-- Most Popular Size
--   Large pizza with 18526 orders

-- Top Ordered Pizza Types
--   use Q5 result for top 5 names

-- Busiest Hour
--   use Q7 result for peak order time

-- ------------------------------------------------
-- NEW THINGS LEARNED IN PROJECT TODAY
-- ------------------------------------------------

-- DATEPART(HOUR, time)
--   extracts hour from time in SQL Server
--   HOUR() function does not work in SQL Server
--   always use DATEPART for SQL Server

-- TOP 1 and TOP 5
--   SQL Server uses TOP keyword
--   MySQL uses LIMIT keyword
--   TOP 1 = LIMIT 1 in MySQL

-- Multiple Table JOINS
--   joining 3 tables in single query
--   each JOIN needs its own ON condition

-- ------------------------------------------------
-- SUMMARY - WHAT I LEARNED TODAY
-- ------------------------------------------------

-- COUNT(col)              = count rows
-- SUM(col)                = add all values
-- MAX(col)                = find highest value
-- ROUND(value, decimals)  = round the number
-- TOP n                   = show only n rows
-- DATEPART(HOUR, time)    = extract hour in SQL Server
-- Multiple JOINS          = join 3 or more tables
-- GROUP BY category       = group same values

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- Continue Pizza Sales Mini Project
-- Solve remaining Advanced questions
-- Apply Window Functions on Pizza data
