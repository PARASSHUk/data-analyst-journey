# Advanced SQL Analytics Project

## Project Overview
- Tool Used: SQL Server
- Database: DataWarehouseAnalytics
- Status: Completed ✅
- Tables: customers, products, sales

## Problem Statement
Build an advanced analytics project using SQL
to analyze sales trends, customer behavior,
and product performance, and create reusable
SQL Views for ongoing business reporting.

## Steps Completed

### Step 1 - Change Over Time Analysis
- Analyzed yearly sales performance
- Analyzed monthly sales performance
- Filtered months with high quantity sold
- Used DATETRUNC and FORMAT for date grouping

### Step 2 - Cumulative Analysis
- Calculated running total of sales by month
- Calculated running total and running average
  of sales by year using window functions

### Step 3 - Performance Analysis
- Compared each product's sales to its own
  average sales performance
- Compared each product's sales to the
  previous year's sales using LAG()
  (Year over Year analysis)

### Step 4 - Part-To-Whole Analysis
- Calculated each category's percentage
  contribution to total overall sales

### Step 5 - Data Segmentation
- Segmented products into cost ranges
  (Below 100, 100-500, 500-1000, Above 1000)
- Segmented customers into VIP, Regular,
  and New based on lifespan and spending

### Step 6 - Customer Report (SQL View)
- Built a reusable VIEW called customer_report
- Includes customer demographics, age
  segmentation, customer segmentation
  (VIP/Regular/New), recency, average order
  value, and average monthly spend

### Step 7 - Product Report (SQL View)
- Built a reusable VIEW called product_report
- Includes product details, revenue
  segmentation (High/Mid/Low Performer),
  recency, average order revenue, and
  average monthly revenue

## SQL Skills Used
- Table renaming using sp_rename
- Window Functions: SUM, AVG, LAG with
  PARTITION BY and OVER()
- DATETRUNC and FORMAT for date analysis
- Multiple CTEs combined in a single query
- CREATE VIEW for reusable reporting
- CASE WHEN for segmentation logic
- CAST and NULLIF for safe calculations
- Division by zero protection

## Key Business Insights
- Identified yearly and monthly sales trends
- Identified which products are growing or
  declining year over year
- Identified which product categories
  contribute most to total revenue
- Segmented customers into VIP, Regular,
  and New for targeted marketing
- Segmented products into performance tiers
  for inventory and pricing decisions
- Built two production-ready SQL Views
  that can be reused for live dashboards

## Files in This Project
- advanced-analytics.sql = All project queries
- data/customers.csv = Customer dimension data
- data/products.csv = Product dimension data
- data/sales.csv = Sales fact data
- data/customer_report.csv = Final customer report output
- data/product_report.csv = Final product report output
- README.md = Project description

## How to Run
1. Import customers.csv, products.csv, and
   sales.csv into SQL Server as tables
2. Open advanced-analytics.sql
3. Run queries section by section in order
4. The two CREATE VIEW statements will
   create customer_report and product_report
5. Query the views directly for instant insights:
   SELECT * FROM customer_report;
   SELECT * FROM product_report;

## Key Takeaway
This project demonstrates a complete
analytics workflow: trend analysis,
cumulative analysis, performance comparison,
proportional analysis, segmentation, and
finally packaging insights into reusable
SQL Views for business reporting.