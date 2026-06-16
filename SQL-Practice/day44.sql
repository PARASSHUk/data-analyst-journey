# Day 44 - Advanced SQL Analytics Project

## Topics Covered

### Step 3 - Performance Analysis ✅

Analyzed yearly product performance by comparing:

* Current year sales vs Average product sales
* Current year sales vs Previous year sales (YoY Analysis)

### Key Concepts Learned

* `AVG() OVER(PARTITION BY)`
* `LAG() OVER(PARTITION BY ORDER BY)`
* Year-over-Year (YoY) Analysis
* Performance Benchmarking
* Variance Analysis using Window Functions

---

### Step 4 - Part-to-Whole Analysis ✅

Analyzed category contribution to overall sales.

#### Formula

```sql
(Measure / Total Measure) * 100
```

#### Example

```sql
(total_sales / overall_sales) * 100
```

### Key Concepts Learned

* Percentage Contribution Analysis
* `SUM() OVER()`
* Window Aggregate Functions
* Integer Division vs Float Division
* Using `CAST()` to calculate percentages correctly

---

### Step 5 - Data Segmentation ✅

Segmented data into meaningful groups for business analysis.

#### Product Segmentation

Products were grouped into cost bands:

* Below 100
* 100 - 500
* 500 - 1000
* Above 1000

#### Customer Segmentation

Customers were classified based on spending behavior:

* VIP Customers
* Regular Customers
* New Customers

### Key Concepts Learned

* CASE Expressions
* Customer Segmentation
* Product Segmentation
* Business Rule Based Classification
* Customer Lifetime Analysis using `DATEDIFF()`

---

## SQL Concepts Practiced Today

* Window Functions
* AVG()
* SUM()
* LAG()
* PARTITION BY
* CASE Statements
* CTEs
* Year-over-Year Analysis
* Part-to-Whole Analysis
* Data Segmentation
* Percentage Calculations
* Customer Analytics

---

## Project Progress

* Change Over Time Analysis ✅
* Cumulative Analysis ✅
* Performance Analysis ✅
* Part-to-Whole Analysis ✅
* Data Segmentation ✅

### Next Step

Step 6 - Build Customer Report
-- AND FINISH THIS PROJECT BY TOMMAROW 
-- AND UPLOAD IT TO GIT HUB
-- START NEW PROJECT EXCEL + SQL DASHBOARD PROJECT.



