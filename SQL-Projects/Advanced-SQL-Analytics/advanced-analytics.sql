-- advanced analytical project

use DataWarehouseAnalytics;
select * from customers;
select * from products;
select * from sales;

-- the name of the tables is too long lets change them 
execute sp_rename 'dbo.dim_customers' , 'customers';   -- sp_rename is a system stored procedure provided by SQL Server to rename:
select *  from customers;


-- in my sql for changing the name of table we need to do like this
-- alter table  dbo.dim_products rename to products;

execute sp_rename 'dbo.dim_products' , 'products';

select * from products;

execute sp_rename 'dbo.fact_sales' , 'sales';
select * from sales;

-- ADVANCED ANALYSIS PROJECT
-- step 1-- CHANGE OVER TIME
-- Analyze how a measure evolVes over time.
-- Helps track treands and identify seasonality in your data.
-- [Measure] by [Date Dimension]
-- ex . total sales by year
-- Average cost by month


-- sales performance over time    -- this creates a high level overview insight that helps with strategic decision making
select year(order_date) as order_year,
sum(sales_amount) as total_sales,
count(distinct customer_key) as total_customer,
sum(quantity) as toal_quantity
from sales
where order_date is not null
group by year(order_date)
order by year(order_date);


-- now checking sales performance over month -- detail insight to discover seasonality in your data

select year(order_date) as order_year ,month(order_date) as order_month, 
sum(sales_amount) as total_sales, count(distinct customer_key) as total_customer,
sum(quantity) as toal_quantity
from sales
where order_date is not null
group by year(order_date),month(order_date)
order by order_year,order_month;

-- for checking total month sales generated of every month where selling of quantity is more than 5000
with duplicate as (
select month(order_date) as total_month,     -- in sql servor you can not use order by inside the cte table use it to main query;
sum(sales_amount) as total_sales,
count(distinct customer_key) as total_customer,       -- in my sql you can use it
sum(quantity) as total_quantity
from sales
where order_date is not null
group by month(order_date)
) 
select total_month, total_sales, total_quantity from duplicate where total_quantity > 5000
order by total_month;


-- we can use datetrunc to avoid the writing year and month 2 times

select DATETRUNC(MONTH, order_date) as order_year,    --datatrunc round the date or timestamp to a specified date part
sum(sales_amount) as total_amount,
count(distinct customer_key) as total_customers,
sum(quantity) as total_quantinty
from sales
where order_date is not null
group by datetrunc(MONTH, order_date)
order by datetrunc(MONTH, order_date);


-- if you change the format so you can so by the format(order_date, 'YYYY-MMM') in gives the month in string but here the month will be not in sorted form

SELECT FORMAT(order_date, 'yyyy-MMM') as order_month,
sum(sales_amount) as total_amount,
COUNT(customer_key) as total_customer,
sum(quantity) as total_quantity
from sales                                      
where order_date is not null
group by format(order_date,'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');

-- step 2. cumulative analysis;   -- THIS IS VERY IMPORTANT TECNIQUE WHICH HELP IN UNDERSTANDING HOW OUR
-- AGGREGATING THE DATA PROGRESSIVELY OVER TIME
-- THIS IS VERY IMPORTANT TECNIQUE WHICH HELP IN UNDERSTANDING  OUR BUSSINESS IS GROWING OR DECLINING.
-- {CUMULATIVE MEASURE} BY {DATE DIMENSION}
-- EX. Running Total Sales by Year
-- Moving Average of sales by Month


-- Calculate the total sales per month and 
-- the running total of sales over time
select month_date, total_sales, 
-- using window function sum()
sum(total_sales) over ( order by month_date) as running_total -- adding each row values as a sum of previous value and this is 
                                         -- happening because of Default window frame -->between unbounded preceding and current row
from
(select datetrunc(month, order_date) as month_date,
sum(sales_amount) as total_sales
from sales
where order_date is not null
group by datetrunc(month, order_date)) t
order by month_date ;

-- calculate the average price pr year and running avg price per year
select 
years, 
total_sales, 
sum(total_sales) over (order by years ) as running_total_sales, 
avg(average_price) over (order by years) as average_running_price
from 
(select 
datetrunc(year, order_date) as years,
sum(sales_amount) as total_sales,
avg(price) as average_price
from sales
where order_date is not null
group by datetrunc(year, order_date))t;


-- Step 3. Performance analysis
-- comparing the current value with target value.
-- HEALPS TO MEASURE SUCCESS AND COMPARE PERFORMANCE.
-- CURRENT[Measure] - Target[Measure]
-- current sales - Average Sales
-- ex. current sales - Average Sales

-- Analyze the yearly performance of products by comparing each
-- product's sales to both its average sales performance and the previous
-- year's sales

with duplicate as (
select year(s.order_date) as year, p.product_name as product, sum(s.sales_amount) as total_sales
from products p left join sales s
on p.product_key = s.product_key 
where year(order_date) is not null
group by year(order_date), product_name)

select year, product, total_sales,
avg(total_sales) over (partition by product) as average_sales,
total_sales - avg(total_sales) over (partition by product)  as average_differnce,
CASE 
	WHEN total_sales - avg(total_sales) over (partition by product)   > 0 THEN 'is_above'
	when total_sales - avg(total_sales) over (partition by product) <0 then 'is_below'
	else 'avg'
end as sales_avg_difference,
--year over year analysis  --- yoy is good for long term trends analysis and MOM is short term trends analyser
lag(total_sales) over (partition by product order by year) as lag_TOTALSALES,
total_sales - lag(total_sales) over (partition by product order by year) as previous_year_diff,
CASE
	WHEN total_sales - lag(total_sales) over (partition by product order by year) > 0 THEN 'ABOVE'
	WHEN total_sales - lag(total_sales) over (partition by product order by year) < 0 THEN 'BELOW'
	else 'no chamge'
END AS PREVIOUS_YR_DIFF
from
duplicate
order by product, year;

-- Step 4. Part-To-Whole Analysis
-- or proportional analysis
-- how an individual part is performing compare to the overall,
-- allowing us to usnderstand which category has the greatest impact on the business;
-- formula ((Measure)/(total measure)) * 100 by [dimension].
-- ex. (sales/ total sales) * 100 by category
-- quantity / total quantity) * 100 by country

-- Which categories contribute the most to overall sales?
with duplicates as (
select category , sum(sales_amount) as total_sales 
from sales s left join products p
on s.product_key = p.product_key
where category is not null
group by category)
select category, total_sales,  sum(total_sales) over () as overall_sales ,
concat(round((cast(total_sales as float) / sum(total_sales) over ()) * 100,2),'%') as percentage_coverd   -- here i am getting 0 as percentage because both are in int
from duplicates                                                     -- 0*100=0 so we have to convert one in float by cast(total_sales as float)
order by total_sales desc;
	
--Step 5. Data Segmentation
-- group the data based on specific range
-- helps in understanding corelation between 2 measures
-- [Measure] by [Measure];
--ex. quantity by sale
    -- customer by age

--Q1. segment products into cost ranges and count how many products fall into each segment

WITH DUPLICATE AS (
select product_key, product_name, cost, 
CASE 
	WHEN COST < 100 THEN 'BELOW 100'
	WHEN COST BETWEEN 100 AND 500 THEN '100-500'
	WHEN COST BETWEEN 500 AND 1000 THEN '500-1000'
	ELSE 'ABOVE 1000'
END AS PRODUCT_COST
from products)
SELECT PRODUCT_COST , COUNT(product_key) as total_product
from DUPLICATE
GROUP BY PRODUCT_COST
ORDER BY total_product desc;

/*--Q2. segment customer into 3 segments based on their spending behavior:
  - VIP: Customer with at least 12 month of history and spending more than $5000.
  -Regular: Customer with at lest 12 month of history but spendign 5000 or less.
  - NEW: Customers with a lifespan less than 12 months
  and find the total numbers of customers by each group*/

  with duplicates as(
  select c.customer_key as customer, sum(s.sales_amount) as total_spending, min(s.order_date) as first_date, max(order_date) as last_date,
  datediff(month, min(s.order_date), max(s.order_date)) as lifespan
  from sales s left join customers c
  on s.customer_key =c.customer_key
  group by c.customer_key)
  
  select customer_segment, count(customer) as total_customer  
  from(
  select customer,
  CASE	
	  WHEN lifespan >= 12 and total_spending >5000 then 'VIP'
	  WHEN lifespan >= 12 and total_spending < 5000 then 'Regular'
	  else 'new'
  END AS customer_segment
  from duplicates) t
  group by customer_segment
  order by total_customer desc; 
  
 
 -- Step 6.Build customer report.

 /* 
 ========================================================================================
 Customer Report
 ========================================================================================
 Purpose :
			- This report consolidaes key customer metrics and behaviors

			Highlights:

1. Gathers essential fields such as names, ages, and transaction details.

2. Segments customers into categories (VIP, Regular, New) and age groups.

3. Aggregates customer-level metrics:
   - total orders
   - total sales
   - total quantity purchased
   - total products
   - lifespan (in months)

4. Calculates valuable KPIs:
   - recency (months since last order)
   - average order value
   - average monthly spend  */

   CREATE VIEW dbo.customer_report as  -- here the error is coming because this command must be in starting no othe query must be 
   with base_query as
   -- Gathers essential fields such as names, ages, and transaction details.
   (select 
   c.customer_number,
   s.order_number, 
   s.product_key,
   s.order_date,
   s.sales_amount,
   s.quantity, 
   c.customer_key,
   concat(c.first_name, ' ', c.last_name) as customer_name,
   datediff(year, birthdate, getdate()) as age
   from 
   sales s left join customers c
   on s.customer_key = c.customer_key
   where order_number is not null)
   
   , customer_aggrigation as(
   -- Aggregates customer-level metrics:
   select 
   customer_key, 
   customer_number,
   customer_name,
   age,
   count(distinct order_number) as total_orders,
   sum(sales_amount) as total_sales,
   sum(quantity) as total_quantity,
   count(distinct product_key) as total_product,
   datediff(month,min(order_date), max(order_date)) as lifespan,
   max(order_date) as lastorder
   from base_query
   group by customer_key, 
   customer_number,
   customer_name,
   age )

    -- Segments customers into categories (VIP, Regular, New) and age groups;
   select customer_key,
   customer_number,
   customer_name,
   age,
   CASE 
		WHEN age<20 then 'UNDER 20'
		WHEN age between 20 and 29 then '20-29'
		WHEN age between 30 and 39 then '30-39'
		when age between 40 and 49 then '40-49'
		ELSE 'ABOVE - 50'
   END AS age_segmentation,
   total_product,
   total_orders,
   total_sales,
   total_quantity,
   lifespan,
   CASE 
		WHEN lifespan>12 and total_sales >5000 then 'VIP'
		WHEN lifespan >12 and total_sales <=5000 then 'REGULAR'
		ELSE 'NEW'
   END AS customer_segmentation,
   lastorder ,
   datediff(month, lastorder, getdate()) as recency,
   -- COMPUTE AVERAGE ORDER VALUES
   total_sales/total_orders as avg_order_value,           -- if the total_orders may be 0 then it will give to avoid the we use case
   CASE 
		WHEN total_orders =0 then 0
		ELSE  total_sales/total_orders
   END AS avg_order_spending,
   -- COMPUTE AVERAGE MONTLY VALUES
   CASE 
		WHEN lifespan = 0 then total_sales       -- i did not do 0 because a customer can we for one day o
		ELSE total_sales/lifespan
   END AS AVG_MONTHL_spend
   FROM customer_aggrigation;
   
   
   -- BUILD PRODUCT REPORT
   /*
======================================================================
Product Report
======================================================================

Purpose:

    - This report consolidates key product metrics and behaviors.

Highlights:

    1. Gathers essential fields such as product name, category,
       subcategory, and cost.

    2. Segments products by revenue to identify High-Performers,
       Mid-Range, or Low-Performers.

    3. Aggregates product-level metrics:
       - total orders
       - total sales
       - total quantity sold
       - total customers (unique)
       - lifespan (in months)

    4. Calculates valuable KPIs:
       - recency (months since last sale)
       - average order revenue (AOR)
       - average monthly revenue

======================================================================
*/
--   1. Gathers essential fields such as product name, category,
   --    subcategory, and cost
   CREATE VIEW dbo.product_report as
   with base_table as (
   select 
   p.product_key,
   p.product_name,
   p.category,
   p.subcategory,
   p.cost,
   s.order_number,
   s.customer_key, 
   s.order_date,
   s.sales_amount,
   s.quantity
   from products p left join sales s
   on p.product_key = s.product_key
   where order_date is not null)
   
   , aggrigated_table as(
   --Aggregates product-level metrics:
   select 
   product_key,
   product_name,
   category,
   subcategory,
   cost,
   count(distinct order_number) as total_order,
   count(distinct customer_key) as total_customer,
   max(order_date) as last_order_date,
   datediff(month,min(order_date), max(order_date)) as lifespan,
   sum(sales_amount) as total_revenue,
   sum(quantity) as total_quantity,
   round(avg(cast(sales_amount as float)/nullif(quantity,0)),1) as avg_selling_price -- this is done because to know avg selling price per product
   from base_table
   group by
   product_key,
   product_name,
   category,
   subcategory,
   cost )
   
  

   --Segments products by revenue to identify High-Performers,
     --  Mid-Range, or Low-Performers.
    select *,
	CASE 
		WHEN total_revenue > 50000 then 'HIGH-PERFORMERS'
		WHEN total_revenue >= 10000 THEN 'MID-RANGE '
		ELSE 'LOW-PERFORMER'
    END AS Revenue_Segment,
	-- Calculate recency
	datediff(month,last_order_date, getdate()) as recency,
	-- Calculate avereage revenue value
	total_revenue/total_order as avg_order_value,
	CASE 
		WHEN total_order = 0 then 0
		ELSE  total_revenue/total_order 
    end as avg_order_revenue,

	-- - average monthly revenue
	total_revenue/lifespan as avg_monthly_value,
	CASE 
		WHEN lifespan = 0 then total_revenue
		else total_revenue/lifespan
    end as avg_monthly_revenue

	
	from aggrigated_table;

	select * from product_report