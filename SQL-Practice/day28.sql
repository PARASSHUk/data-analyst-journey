-- ================================================
-- Day 28 - SQL Learning Notes
-- Topic: Practice Questions on
--        JOINS, Subqueries and GROUP BY
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Solved practice questions on JOINS
--   INNER JOIN
--   LEFT JOIN
--   RIGHT JOIN
-- Solved practice questions on Subqueries
--   Single Row Subquery
--   Multi Row Subquery
--   Correlated Subquery
-- Solved practice questions on GROUP BY
--   GROUP BY with Aggregate Functions
--   GROUP BY with HAVING clause
--   GROUP BY with multiple columns

-- ================================================
-- SECTION 1 - JOINS PRACTICE QUESTIONS
-- ================================================

-- Tables Used for Practice:
-- customers  (customer_id, name, city, country)
-- orders     (order_id, customer_id, amount, date)
-- products   (product_id, product_name, category, price)
-- order_items(item_id, order_id, product_id, quantity)

-- ------------------------------------------------
-- INNER JOIN QUESTIONS
-- ------------------------------------------------

-- Q1. Find all customers who have placed orders
--     Show customer name and order amount
SELECT
    c.name              AS customer_name,
    o.order_id          AS order_id,
    o.amount            AS order_amount,
    o.date              AS order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- ------------------------------------------------

-- Q2. Find all orders with product details
--     Show order id product name and quantity
SELECT
    o.order_id          AS order_id,
    p.product_name      AS product_name,
    p.category          AS category,
    oi.quantity         AS quantity,
    p.price             AS unit_price,
    oi.quantity * p.price AS total_price
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id
ORDER BY total_price DESC;

-- ------------------------------------------------

-- Q3. Find customer name city and
--     total amount they spent
SELECT
    c.name              AS customer_name,
    c.city              AS city,
    COUNT(o.order_id)   AS total_orders,
    SUM(o.amount)       AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name, c.city
ORDER BY total_spent DESC;

-- ------------------------------------------------
-- LEFT JOIN QUESTIONS
-- ------------------------------------------------

-- Q4. Find all customers even those
--     who have NOT placed any orders
SELECT
    c.name              AS customer_name,
    c.city              AS city,
    o.order_id          AS order_id,
    o.amount            AS order_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- ------------------------------------------------

-- Q5. Find customers who have
--     NEVER placed any order
SELECT
    c.name              AS customer_name,
    c.city              AS city,
    c.country           AS country
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- ------------------------------------------------
-- RIGHT JOIN QUESTIONS
-- ------------------------------------------------

-- Q6. Find all orders even those with
--     no matching customer record
SELECT
    c.name              AS customer_name,
    o.order_id          AS order_id,
    o.amount            AS order_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- ================================================
-- SECTION 2 - SUBQUERIES PRACTICE QUESTIONS
-- ================================================

-- ------------------------------------------------
-- SINGLE ROW SUBQUERY QUESTIONS
-- ------------------------------------------------

-- Q7. Find customers who spent more than
--     the average order amount
SELECT
    c.name              AS customer_name,
    o.amount            AS order_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > (
    SELECT AVG(amount)
    FROM orders
)
ORDER BY o.amount DESC;

-- ------------------------------------------------

-- Q8. Find the most expensive product
--     and its details
SELECT
    product_id,
    product_name,
    category,
    price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);

-- ------------------------------------------------

-- Q9. Find orders placed on the
--     most recent order date
SELECT *
FROM orders
WHERE date = (
    SELECT MAX(date)
    FROM orders
);

-- ------------------------------------------------
-- MULTI ROW SUBQUERY QUESTIONS
-- ------------------------------------------------

-- Q10. Find customers who have placed
--      orders worth more than 1000
SELECT
    name                AS customer_name,
    city                AS city
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE amount > 1000
);

-- ------------------------------------------------

-- Q11. Find products that have
--      never been ordered
SELECT
    product_id,
    product_name,
    category,
    price
FROM products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM order_items
);

-- ------------------------------------------------

-- Q12. Find customers from cities where
--      at least one order above 500 exists
SELECT DISTINCT
    name                AS customer_name,
    city                AS city
FROM customers
WHERE city IN (
    SELECT DISTINCT c.city
    FROM customers c
    INNER JOIN orders o
    ON c.customer_id = o.customer_id
    WHERE o.amount > 500
);

-- ------------------------------------------------
-- CORRELATED SUBQUERY QUESTIONS
-- ------------------------------------------------

-- Q13. Find customers who spent more than
--      average spending of their city
SELECT
    c.name              AS customer_name,
    c.city              AS city,
    o.amount            AS order_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > (
    SELECT AVG(o2.amount)
    FROM orders o2
    INNER JOIN customers c2
    ON o2.customer_id = c2.customer_id
    WHERE c2.city = c.city
);

-- ================================================
-- SECTION 3 - GROUP BY PRACTICE QUESTIONS
-- ================================================

-- ------------------------------------------------
-- GROUP BY WITH AGGREGATE FUNCTIONS
-- ------------------------------------------------

-- Q14. Find total orders and revenue
--      per customer
SELECT
    c.name                      AS customer_name,
    COUNT(o.order_id)           AS total_orders,
    SUM(o.amount)               AS total_revenue,
    ROUND(AVG(o.amount), 2)     AS avg_order_value,
    MAX(o.amount)               AS highest_order,
    MIN(o.amount)               AS lowest_order
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_revenue DESC;

-- ------------------------------------------------

-- Q15. Find total revenue per product category
SELECT
    p.category                  AS category,
    COUNT(oi.item_id)           AS total_orders,
    SUM(oi.quantity)            AS total_quantity,
    ROUND(SUM(
        oi.quantity * p.price
    ), 2)                       AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- ------------------------------------------------

-- Q16. Find total orders per city per country
SELECT
    c.country                   AS country,
    c.city                      AS city,
    COUNT(o.order_id)           AS total_orders,
    SUM(o.amount)               AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.country, c.city
ORDER BY 1, 4 DESC;

-- ------------------------------------------------
-- GROUP BY WITH HAVING CLAUSE
-- ------------------------------------------------

-- Q17. Find customers who have placed
--      more than 3 orders
SELECT
    c.name                      AS customer_name,
    COUNT(o.order_id)           AS total_orders,
    SUM(o.amount)               AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 3
ORDER BY total_orders DESC;

-- ------------------------------------------------

-- Q18. Find categories with total revenue
--      above 5000
SELECT
    p.category                  AS category,
    ROUND(SUM(
        oi.quantity * p.price
    ), 2)                       AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
HAVING SUM(oi.quantity * p.price) > 5000
ORDER BY total_revenue DESC;

-- ------------------------------------------------

-- Q19. Find cities with more than
--      2 customers who placed orders
SELECT
    c.city                      AS city,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(o.order_id)           AS total_orders,
    SUM(o.amount)               AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING COUNT(DISTINCT c.customer_id) > 2
ORDER BY total_revenue DESC;

-- ------------------------------------------------

-- Q20. Find products ordered more than
--      10 times with high revenue
SELECT
    p.product_name              AS product_name,
    p.category                  AS category,
    COUNT(oi.item_id)           AS times_ordered,
    SUM(oi.quantity)            AS total_quantity,
    ROUND(SUM(
        oi.quantity * p.price
    ), 2)                       AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name, p.category
HAVING COUNT(oi.item_id) > 10
ORDER BY total_revenue DESC;

-- ================================================
-- SUMMARY - WHAT I PRACTICED TODAY
-- ================================================

-- JOINS PRACTICED
-- INNER JOIN = only matching rows
-- LEFT JOIN  = all left and matching right
-- RIGHT JOIN = all right and matching left
-- Used JOIN with 3 tables together

-- SUBQUERIES PRACTICED
-- Single Row  = with MAX AVG MIN
-- Multi Row   = with IN and NOT IN
-- Correlated  = comparing with group average

-- GROUP BY PRACTICED
-- With COUNT SUM AVG MAX MIN
-- With HAVING to filter groups
-- With multiple columns
-- Combined with JOINS

-- ================================================
-- LAST EXAM DAY MAY 15
-- ================================================

-- Last semester exam tomorrow
-- After exam SQL projects begin!
-- Project 1 = EDA with SQL
-- Project 2 = Data Cleaning with SQL
-- Project 3 = E-Commerce Own Project
-- Excited to start building projects!