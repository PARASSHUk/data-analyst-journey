-- ================================================
-- Day 46 - SQL Learning Notes
-- Topic: Revised All Previous Projects and
--        Started New SQL + Excel Pizza
--        Dashboard Project
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Uploaded Advanced SQL Analytics Project
--   to GitHub successfully ✅
-- Revised EDA Project concepts
-- Revised Data Cleaning Project concepts
-- Revised Advanced Analytics Project concepts
-- Started NEW Project: Pizza Dashboard
--   using SQL + Excel together
-- Solved first 5 business questions
--   using SQL on Pizza Sales data

-- ================================================
-- REVISION SUMMARY - PREVIOUS PROJECTS
-- ================================================

-- Project 1 = EDA with SQL
--   Database Dimension Measure Date Exploration
--   Magnitude and Ranking Analysis
-- Project 2 = Data Cleaning with SQL
--   Removed duplicates Standardized data
--   Handled NULLs Removed columns
-- Project 3 = Advanced SQL Analytics
--   Change Over Time Cumulative Analysis
--   Performance Analysis Part-To-Whole
--   Data Segmentation Customer/Product Views



-- ================================================
-- NEW PROJECT STARTED - DAY 1
-- ================================================

-- Project Name: Pizza Dashboard Project
-- Tools Used: SQL + Excel
-- Database: Pizza DB
-- Status: In Progress

USE [Pizza DB];

-- ------------------------------------------------
-- SETUP - RENAME TABLE
-- ------------------------------------------------

EXECUTE SP_RENAME 'dbo.pizza_sales_new', 'pizza_sales';

SELECT * FROM pizza_sales;

-- Important Note:
-- We CANNOT import Excel files directly
-- into SQL Server!
-- Only CSV (Comma Separated Values) files
-- can be imported into SQL Server
-- Excel file must be saved as CSV first

-- ================================================
-- BUSINESS QUESTIONS SOLVED TODAY
-- ================================================

-- ------------------------------------------------
-- Q1. Find Out the Total Revenue
-- ------------------------------------------------

SELECT
    ROUND(SUM(total_price), 1) AS total_revenue
FROM pizza_sales;

-- ------------------------------------------------
-- Q2. Average Order Value
-- ------------------------------------------------

-- Total revenue divided by total unique orders
SELECT
    SUM(total_price) / COUNT(DISTINCT order_id)
    AS avg_order_value
FROM pizza_sales;

-- ------------------------------------------------
-- Q3. Total Pizzas Sold
-- ------------------------------------------------

SELECT
    SUM(quantity) AS total_pizza_sold
FROM pizza_sales;

-- ------------------------------------------------
-- Q4. Total Orders Placed
-- ------------------------------------------------

-- COUNT DISTINCT to avoid counting
-- same order multiple times
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

-- ------------------------------------------------
-- Q5. Average Pizzas Per Order
-- ------------------------------------------------

-- Total quantity divided by total unique orders
SELECT
    COUNT(quantity) / COUNT(DISTINCT order_id)
    AS avg_pizzas_per_order
FROM pizza_sales;

-- ================================================
-- KEY LEARNINGS FROM TODAY
-- ================================================

-- EXCEL TO SQL IMPORT LIMITATION
--   SQL Server cannot import .xlsx directly
--   Must convert Excel file to CSV first
--   CSV = Comma Separated Values format
--   Then import CSV into SQL Server

-- KPI CALCULATIONS LEARNED
--   Total Revenue = SUM(total_price)
--   Avg Order Value = Total Revenue / Total Orders
--   Total Pizzas Sold = SUM(quantity)
--   Total Orders = COUNT(DISTINCT order_id)
--   Avg Pizzas per Order = Total Quantity / Total Orders

-- WHY COUNT DISTINCT MATTERS
--   One order can have multiple pizza rows
--   COUNT(order_id) would count duplicates
--   COUNT(DISTINCT order_id) counts unique orders
--   Always use DISTINCT for order level KPIs

-- ================================================
-- PIZZA DASHBOARD PROJECT PLAN
-- ================================================

-- Phase 1 = SQL Analysis (Today + Tomorrow)
--   Solve all KPI and business questions
--   Build queries for category analysis
--   Build queries for time based trends

-- Phase 2 = Excel Dashboard (After SQL)
--   Export SQL results to Excel
--   Build Pivot Tables and Charts
--   Create interactive Dashboard
--   Add Slicers for filtering

-- ================================================
-- PROJECT STATUS
-- ================================================

-- Setup                              ✅ Done
-- Table Renamed                      ✅ Done
-- Q1 Total Revenue                   ✅ Done
-- Q2 Average Order Value             ✅ Done
-- Q3 Total Pizzas Sold                ✅ Done
-- Q4 Total Orders Placed              ✅ Done
-- Q5 Average Pizzas per Order         ✅ Done
-- Remaining Questions                 ⏳ Tomorrow
-- Excel Dashboard                     ⏳ Coming Soon

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Uploaded Advanced Analytics Project to GitHub
-- Revised all 3 previous SQL projects
-- Started new Pizza Dashboard Project
-- Solved 5 KPI business questions
-- Learned Excel to SQL import limitation
-- Learned COUNT DISTINCT importance


-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Complete Pizza Dashboard SQL queries
--   Category wise revenue
--   Daily and monthly trends
--   Top selling pizzas
-- Finish all SQL analysis
-- Start building Excel Dashboard
-- Upload SQL + EXCEL PROJECT to GitHub