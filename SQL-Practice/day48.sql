-- ================================================
-- Day 48 - SQL Learning Notes
-- Topic: SQL Revision and Pizza Dashboard
--        Project - Charts and KPIs Built
-- ================================================

-- -----------------------------------------------

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Revised all SQL topics
-- Continued Pizza Dashboard Project
-- Created all required Charts in Excel
-- Built complete KPI Set on Dashboard
-- Dashboard visual layer nearly complete!

-- ================================================
-- SQL REVISION TODAY
-- ================================================

-- Revised all SQL Commands DDL DML DQL
-- Revised all Clauses and Operators
-- Revised all Built-in Functions
-- Revised JOINS all 4 types
-- Revised Subqueries all 3 types
-- Revised CTE Simple and Multiple
-- Revised Window Functions
-- Revised DATEPART FORMAT functions
-- Revised RANK and percentage calculations

-- ================================================
-- PIZZA DASHBOARD PROJECT - DAY 3
-- ================================================

-- ------------------------------------------------
-- CHARTS BUILT IN EXCEL DASHBOARD
-- ------------------------------------------------

-- Based on SQL queries from Day 49
-- the following charts were created:

-- Chart 1 = Daily Trend for Total Orders
--   Bar Chart showing orders by day name
--   Sunday through Saturday in correct order

-- Chart 2 = Hourly Trend for Total Orders
--   Line Chart showing orders by hour
--   Helps identify peak ordering times

-- Chart 3 = Percentage of Sales by Category
--   Pie Chart showing category contribution
--   Classic Veggie Supreme Chicken etc

-- Chart 4 = Percentage of Sales by Size
--   Pie Chart showing size distribution
--   Small Medium Large XL XXL

-- Chart 5 = Total Pizzas Sold per Category
--   Bar Chart comparing category volumes

-- Chart 6 = Top 5 Best Sellers
--   Horizontal Bar Chart showing
--   highest selling pizza names

-- Chart 7 = Bottom 5 Sellers
--   Horizontal Bar Chart showing
--   lowest selling pizza names

-- ------------------------------------------------
-- KPI CARDS FINALIZED ON DASHBOARD
-- ------------------------------------------------

-- All 5 KPI cards now built and styled:

-- KPI 1 = Total Revenue
-- KPI 2 = Total Orders (using 1/COUNT trick)
-- KPI 3 = Average Pizzas per Order
-- KPI 4 = Average Order Value
-- KPI 5 = Total Pizzas Sold

-- Each KPI card formatted with:
-- Bold large number
-- Clear label underneath
-- Consistent color theme

-- ================================================
-- KEY REVISION NOTES
-- ================================================

-- DATEPART FUNCTIONS RECAP
-- DATEPART(WEEKDAY, date) = day number
-- DATEPART(HOUR, time)    = hour value
-- DATEPART(QUARTER, date) = quarter number

-- WINDOW FUNCTION PERCENTAGE RECAP
-- SUM(SUM(col)) OVER() = grand total
-- Used to calculate % share by group

-- RANK FOR TOP AND BOTTOM RECAP
-- RANK() OVER(ORDER BY col DESC) = top values
-- RANK() OVER(ORDER BY col)      = bottom values

-- EXCEL PIVOT TABLE TRICK RECAP
-- =1/COUNT(order_id) then SUM
-- Prevents double counting unique orders

-- ================================================
-- PIZZA DASHBOARD PROJECT STATUS
-- ================================================

-- SQL Analysis Phase                  ✅ Done
-- Excel Pivot Tables                  ✅ Done
-- Excel KPI Cards                     ✅ Done
-- Excel Charts                        ✅ Done
-- Dashboard Layout Arrangement        🔄 In Progress
-- Slicers for Interactivity           ⏳ Next
-- Final Polish and Formatting         ⏳ Next

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Revised complete SQL knowledge base
-- Built all 7 charts in Excel dashboard
-- Finalized all 5 KPI cards
-- Dashboard visuals nearly complete


-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Arrange all charts and KPIs on
--   one clean Dashboard sheet
-- Add Slicers for Category Size
--   Day Quarter filtering
-- Apply final colors and formatting
-- Complete Pizza Dashboard Project!
-- Write README and upload to GitHub