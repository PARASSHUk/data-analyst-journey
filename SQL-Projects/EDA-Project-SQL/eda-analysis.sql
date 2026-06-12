-- ================================================
-- EDA Project - Complete Analysis Queries
-- Tool: SQL Server
-- Database: DataWarehouse
-- ================================================

USE datawarehouse;

-- ================================================
-- DIMENSION VS MEASURE IDENTIFICATION
-- ================================================

-- DIMENSIONS
SELECT DISTINCT category FROM products;
SELECT DISTINCT product_name FROM products;
SELECT DISTINCT customer_id FROM customer;

-- MEASURES
SELECT DISTINCT sales_amount FROM sales;
SELECT DISTINCT quantity FROM sales;
SELECT DISTINCT
    DATEDIFF(YEAR, birthdate, GETDATE()) AS age
FROM customer;

-- ================================================
-- STEP 1 - DATABASE EXPLORATION
-- ================================================

SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer';

-- ================================================
-- STEP 2 - DIMENSION EXPLORATION
-- ================================================

SELECT DISTINCT country FROM customer;
SELECT DISTINCT category FROM products;
SELECT DISTINCT category, subcategory FROM products;

SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM products
ORDER BY 1, 2, 3;

-- ================================================
-- STEP 3 - DATE EXPLORATION
-- ================================================

SELECT
    MIN(order_date)     AS first_order_date,
    MAX(order_date)     AS last_order_date,
    ABS(DATEDIFF(
        YEAR,
        MAX(order_date),
        MIN(order_date))) AS order_range_years
FROM sales;

SELECT
    MIN(shipping_date)  AS first_shipping_date,
    MAX(shipping_date)  AS last_shipping_date,
    ABS(DATEDIFF(
        DAY,
        MAX(shipping_date),
        MIN(shipping_date))) AS shipping_range_days
FROM sales;

SELECT
    MIN(birthdate)                          AS oldest_birthdate,
    DATEDIFF(YEAR, MIN(birthdate),
        GETDATE())                          AS oldest_age,
    MAX(birthdate)                          AS youngest_birthdate,
    DATEDIFF(YEAR, MAX(birthdate),
        GETDATE())                          AS youngest_age,
    DATEDIFF(YEAR, MIN(birthdate),
        MAX(birthdate))                     AS age_difference
FROM customer;

-- ================================================
-- STEP 4 - MEASURE EXPLORATION
-- ================================================

SELECT SUM(sales_amount)            AS total_sales FROM sales;
SELECT SUM(quantity)                AS total_items_sold FROM sales;
SELECT AVG(price)                   AS avg_price FROM sales;
SELECT COUNT(DISTINCT order_number) AS total_orders FROM sales;
SELECT COUNT(DISTINCT product_key)  AS total_products FROM products;
SELECT COUNT(customer_key)          AS total_customers FROM customer;
SELECT COUNT(DISTINCT customer_key) AS customers_with_orders FROM sales;

-- Business Key Metrics Report
SELECT 'Total Sales'        AS measure_name,
       SUM(sales_amount)    AS measure_value FROM sales
UNION ALL
SELECT 'Total Quantity',    SUM(quantity) FROM sales
UNION ALL
SELECT 'Average Price',     AVG(price) FROM sales
UNION ALL
SELECT 'Total Orders',
       COUNT(DISTINCT order_number) FROM sales
UNION ALL
SELECT 'Total Products',
       COUNT(product_key) FROM products
UNION ALL
SELECT 'Total Customers',
       COUNT(customer_key) FROM customer;

-- ================================================
-- STEP 5 - MAGNITUDE ANALYSIS
-- ================================================

SELECT country,
       COUNT(DISTINCT customer_key) AS total_customers
FROM customer
GROUP BY country
ORDER BY total_customers DESC;

SELECT gender,
       COUNT(customer_key) AS total_customers
FROM customer
GROUP BY gender
ORDER BY total_customers DESC;

SELECT category,
       COUNT(product_key) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

SELECT category,
       AVG(cost) AS avg_cost
FROM products
GROUP BY category
ORDER BY avg_cost DESC;

SELECT p.category,
       SUM(s.sales_amount) AS total_revenue
FROM sales s
LEFT JOIN products p
ON p.product_key = s.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT c.customer_key,
       c.first_name, c.last_name,
       SUM(s.sales_amount) AS total_revenue
FROM customer c
LEFT JOIN sales s
ON c.customer_key = s.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue DESC;

SELECT country,
       SUM(quantity) AS total_sold_items
FROM customer c
LEFT JOIN sales s
ON c.customer_key = s.customer_key
GROUP BY country
ORDER BY total_sold_items DESC;

-- ================================================
-- STEP 6 - RANKING ANALYSIS
-- ================================================

-- Top 5 Products by Revenue
SELECT TOP 5
    p.product_name,
    SUM(s.sales_amount) AS total_revenue
FROM sales s
LEFT JOIN products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 5 Worst Performing Products
SELECT TOP 5
    p.product_name,
    SUM(s.sales_amount) AS total_revenue
FROM sales s
LEFT JOIN products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;

-- Top 5 Subcategories
SELECT TOP 5
    p.subcategory,
    SUM(s.sales_amount) AS total_revenue
FROM sales s
LEFT JOIN products p
ON s.product_key = p.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC;

-- Top 5 using Window Function
SELECT *
FROM
(
    SELECT
        p.product_name,
        SUM(s.sales_amount)     AS total_revenue,
        ROW_NUMBER() OVER(
            ORDER BY SUM(s.sales_amount) DESC
        )                       AS rank_products
    FROM sales s
    LEFT JOIN products p
    ON s.product_key = p.product_key
    GROUP BY p.product_name
) t
WHERE rank_products <= 5;

-- Top 10 Customers by Revenue
SELECT TOP 10
    c.customer_key,
    c.first_name, c.last_name,
    SUM(s.sales_amount) AS total_revenue
FROM sales s
LEFT JOIN customer c
ON c.customer_key = s.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue DESC;

-- Top 3 Customers with Fewest Orders
SELECT TOP 3
    c.customer_key,
    c.first_name, c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM sales s
LEFT JOIN customer c
ON c.customer_key = s.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders ASC;