-- ================================================
-- Day 14 - SQL Learning Notes
-- 
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Completed all Pizza Sales Project Questions
--   5 Basic Questions     
--   5 Intermediate Questions 
--   3 Advanced Questions  
-- Planned Week 4 SQL Projects
--   EDA with SQL
--   Data Cleaning with SQL
--   1 SQL Project
--   1 SQL Project with Dashboard
--   1 Own Project - E-Commerce Analysis

-- ------------------------------------------------
-- PIZZA SALES PROJECT - ALL QUESTIONS COMPLETED
-- ------------------------------------------------

-- Project Name: Pizza Sales Analysis
-- Tool: SQL Server
-- Status: COMPLETED 
-- Total Questions Solved: 13

-- ================================================
-- BASIC QUESTIONS - ALL COMPLETED
-- ================================================

-- Q1. Retrieve total number of orders placed
SELECT
    COUNT(order_id) AS total_orders
FROM orders;

-- ------------------------------------------------

-- Q2. Calculate total revenue from pizza sales
SELECT
    ROUND(SUM(od.quantity * p.price), 2)
    AS total_revenue
FROM pizzas p
INNER JOIN order_details od
ON p.pizza_id = od.pizza_id;

-- ------------------------------------------------

-- Q3. Identify the highest priced pizza
SELECT TOP 1
    pt.name                 AS pizza_name,
    ROUND(MAX(p.price), 0)  AS price
FROM pizza_types pt
INNER JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.name
ORDER BY price DESC;

-- ------------------------------------------------

-- Q4. Identify the most common pizza size ordered
SELECT
    p.size,
    COUNT(od.pizza_id) AS total_orders
FROM pizzas p
INNER JOIN order_details od
ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY total_orders DESC;

-- Finding: Large size is most common
--          with approximately 18526 orders

-- ------------------------------------------------

-- Q5. List top 5 most ordered pizza types
--     with their quantities
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

-- ================================================
-- INTERMEDIATE QUESTIONS - ALL COMPLETED
-- ================================================

-- Q6. Total quantity of each pizza category ordered
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

-- Q7. Distribution of orders by hour of the day
SELECT
    DATEPART(HOUR, time)    AS order_hour,
    COUNT(order_id)         AS total_orders
FROM orders
GROUP BY DATEPART(HOUR, time)
ORDER BY total_orders DESC;

-- ------------------------------------------------

-- Q8. Category wise distribution of pizzas
SELECT
    pt.category,
    COUNT(p.pizza_id) AS distributions
FROM pizza_types pt
INNER JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY distributions;

-- ------------------------------------------------

-- Q9. Group orders by date and calculate
--     average number of pizzas ordered per day
SELECT
    ROUND(AVG(daily_quantity), 0) AS avg_pizzas_per_day
FROM
(
    SELECT
        o.date,
        SUM(od.quantity) AS daily_quantity
    FROM orders o
    INNER JOIN order_details od
    ON o.order_id = od.order_id
    GROUP BY o.date
) AS daily_orders;

-- ------------------------------------------------

-- Q10. Top 3 most ordered pizza types
--      based on revenue
SELECT TOP 3
    pt.name                             AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM pizza_types pt
INNER JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY total_revenue DESC;

-- ================================================
-- ADVANCED QUESTIONS - ALL COMPLETED
-- ================================================

-- Q11. Percentage contribution of each pizza type
--      to total revenue
SELECT
    pt.category,
    ROUND(
        SUM(od.quantity * p.price) * 100.0 /
        (
            SELECT SUM(od2.quantity * p2.price)
            FROM order_details od2
            INNER JOIN pizzas p2
            ON od2.pizza_id = p2.pizza_id
        ), 2
    ) AS revenue_percentage
FROM pizza_types pt
INNER JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY revenue_percentage DESC;

-- ------------------------------------------------

-- Q12. Cumulative revenue generated over time
SELECT
    date,
    ROUND(SUM(daily_revenue) OVER(
        ORDER BY date
    ), 2) AS cumulative_revenue
FROM
(
    SELECT
        o.date,
        SUM(od.quantity * p.price) AS daily_revenue
    FROM orders o
    INNER JOIN order_details od
    ON o.order_id = od.order_id
    INNER JOIN pizzas p
    ON od.pizza_id = p.pizza_id
    GROUP BY o.date
) AS daily_sales
ORDER BY date;

-- ------------------------------------------------

-- Q13. Top 3 most ordered pizza types based on
--      revenue for each pizza category
SELECT *
FROM
(
    SELECT
        pt.category,
        pt.name                                 AS pizza_name,
        ROUND(SUM(od.quantity * p.price), 2)    AS revenue,
        RANK() OVER(
            PARTITION BY pt.category
            ORDER BY SUM(od.quantity * p.price) DESC
        ) AS revenue_rank
    FROM pizza_types pt
    INNER JOIN pizzas p
    ON pt.pizza_type_id = p.pizza_type_id
    INNER JOIN order_details od
    ON od.pizza_id = p.pizza_id
    GROUP BY pt.category, pt.name
) AS ranked_pizzas
WHERE revenue_rank <= 3
ORDER BY category, revenue_rank;

-- ================================================
-- PIZZA PROJECT COMPLETE SUMMARY
-- ================================================

-- Total Questions Solved     = 13
-- Basic Questions            = 5  
-- Intermediate Questions     = 5  
-- Advanced Questions         = 3  

-- SQL Skills Used in Project
-- INNER JOIN                 = joining multiple tables
-- COUNT SUM MAX AVG ROUND    = aggregate functions
-- GROUP BY ORDER BY          = grouping and sorting
-- DATEPART                   = extracting hour
-- TOP keyword                = limiting results
-- Subquery in FROM           = derived table
-- Window Function SUM OVER   = cumulative revenue
-- RANK with PARTITION BY     = rank per category
-- Percentage calculation     = revenue contribution

-- ================================================
-- WEEK 4 SQL PROJECT GOALS
-- ================================================

-- This week goal is to complete 4 to 5 projects

-- Project 1 - EDA with SQL
--   Exploratory Data Analysis using SQL
--   Find patterns and insights from raw data
--   Use aggregate functions and GROUP BY

-- Project 2 - Data Cleaning with SQL
--   Clean messy dataset using SQL
--   Handle NULL values
--   Remove duplicates
--   Fix formatting issues
--   Standardize data types

-- Project 3 - SQL Project
--   Pick a real world dataset
--   Answer 10 plus business questions
--   Use JOINS Subqueries and Window Functions

-- Project 4 - SQL Project with Dashboard
--   SQL analysis plus Power BI dashboard
--   Export SQL results to Power BI
--   Build interactive dashboard

-- Project 5 - Own E-Commerce Project
--   Project Name: E-Commerce Database Analysis
--   Built completely independently
--   No external help taken
--   Apply all SQL skills learned
--   Design own database schema
--   Write all queries from scratch

-- ================================================
-- SUMMARY - WHAT I ACHIEVED TODAY
-- ================================================

-- Completed Pizza Sales Project fully
-- Solved advanced cumulative revenue query
-- Solved percentage contribution query
-- Solved top 3 per category using RANK
-- Planned 5 projects for Week 4
-- SQL learning extended by 1 more week

-- ================================================
-- TOMORROW I WILL START
-- ================================================

-- Project 1 - EDA with SQL
-- Download dataset for EDA project
-- Start data exploration queries
-- Find basic statistics of dataset
-- Identify patterns and anomalies