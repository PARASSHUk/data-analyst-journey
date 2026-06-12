# EDA Project - Exploratory Data Analysis with SQL

## Project Overview
- Tool Used: SQL Server
- Database: DataWarehouse
- Status: Completed ✅
- Tables Used: customer, products, sales

## What is EDA
Exploratory Data Analysis is the process of
understanding data before building reports
or dashboards. It helps find patterns trends
and anomalies in raw data.

## EDA Steps Completed

### Step 1 - Database Exploration
- Explored all tables using INFORMATION_SCHEMA
- Explored all columns and data types
- Understood full database structure

### Step 2 - Dimension Exploration
- Found all unique countries of customers
- Explored product categories and subcategories
- Identified all dimensions in dataset

### Step 3 - Date Exploration
- Found first and last order dates
- Found shipping date boundaries
- Found youngest and oldest customers
- Calculated age range of customers

### Step 4 - Measure Exploration
- Found total sales revenue
- Found total items sold
- Found average selling price
- Found total orders customers products
- Built complete business metrics report

### Step 5 - Magnitude Analysis
- Analyzed total customers by country
- Analyzed total customers by gender
- Analyzed total products by category
- Analyzed average cost by category
- Analyzed total revenue by category
- Analyzed revenue by each customer
- Analyzed sold items by country

### Step 6 - Ranking Analysis
- Found top 5 products by revenue
- Found 5 worst performing products
- Found top 5 best subcategories
- Found top 10 customers by revenue
- Found top 3 customers with fewest orders
- Used both TOP keyword and Window Functions

## Key Concepts Learned
- Dimension vs Measure identification
- INFORMATION_SCHEMA for database exploration
- UNION ALL for combining metrics
- Low vs High Cardinality dimensions
- TOP keyword vs LIMIT keyword
- Subquery alias requirement in SQL Server

## Key Business Insights
- Total revenue and order volume identified
- Top performing products found
- Best and worst customers identified
- Country wise sales distribution found
- Category wise performance analyzed

## Files in This Project
- eda-analysis.sql = All EDA queries
- README.md = Project description

## How to Run
1. Open SQL Server Management Studio
2. Connect to DataWarehouse database
3. Open eda-analysis.sql file
4. Run queries section by section