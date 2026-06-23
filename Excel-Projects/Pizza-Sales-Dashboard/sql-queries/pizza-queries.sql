USE [Pizza DB];

-- PIZZA DASHBOARD PROJECT USING SQL + EXCEL--
EXECUTE  SP_RENAME 'dbo.pizza_sales_new', 'pizza_sales';
select * from pizza_sales;                    --- WE CAN NOT IMPORT EXCEL FILE TO THE SQL SERVOR, ONLY CSV (COMMA SEPRATED FILE WEILL)


--Q1. Find out the total revenue
select round(sum(total_price),1) as Total_revenue from pizza_sales;
-- Q2. AVERAGE ORDER VALUE
SELECT * FROM pizza_sales;
select 
sum(total_price)/count(distinct order_id) as avg_order_value
from pizza_sales;

-- Q3. total pizza sold
select * from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

-- Q4.Totoal orders placed
select * from pizza_sales;
select count(distinct order_id) as totoal_orders from pizza_sales;

-- Q5. Average pizzas per order
select * from pizza_sales;
select round(sum(cast(quantity as float)) / count(distinct order_id),1) as avg_pizzas_per_order from pizza_sales;

-- CHARTS REQUIREMENT 

-- DAILY TREND FOR TOTAL ORDERS OVER A SPECIFIC TIME PERIOD
SELECT * FROM pizza_sales;
SELECT format(order_date, 'dddd') as DAYS, count(distinct order_id) as total_pizza_sale FROM pizza_sales -- another way is datename() in servor
group by format(order_date, 'dddd'), DATEPART(WEEKDAY, order_date) -- why this we get week days in order like  sunday,monday....saturday 
order by DATEPART(WEEKDAY, order_date);                           --to do same thing in mysql do DAYNAME(order_date) and for formating 
                                                             -- do DAYOFWEEK(order_date)


-- HOURLY TREND FOR TOTTAL ORDERS OVER A SPECIFIC 
SELECT datepart(hour,order_time) as order_hours , count(distinct order_id) as total_orders
FROM pizza_sales                -- to get the time from hour or minute from the time then use datepart(hour, '2023-04-09 12:34:45:00')
group by datepart(hour, order_time)
order by order_hours;

-- PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT * FROM pizza_sales;

with duplicate as(
select pizza_category, 
        ROUND(sum(total_price),0) as total_sales,
        ROUND(sum(sum(total_price)) over (),0) as over_all_sales
        from pizza_sales
        where month(order_date) =1    -- 1 indicate the month 1 since january
        group by pizza_category)

        select pizza_category, 
        total_sales ,
        over_all_sales ,
        concat(round((cast(total_sales as float)/over_all_sales)*100,1),'%') as  category_percent_sales from duplicate;


-- PERCENTAGE OF SALES BY PIZZA SIZE


with duplicate as(
select pizza_size, 
        ROUND(sum(total_price),0) as total_sales,
        ROUND(sum(sum(total_price)) over (),0) as over_all_sales
        from pizza_sales
        group by pizza_size)

        select pizza_size, 
        total_sales ,
        over_all_sales ,
        concat(round((cast(total_sales as float)/over_all_sales)*100,1),'%') as  category_percent_sales from duplicate
        order by category_percent_sales desc;


-- show this why quarter
        
        with duplicate as(
select pizza_size, 
        ROUND(sum(total_price),0) as total_sales,
        ROUND(sum(sum(total_price)) over (),0) as over_all_sales
        from pizza_sales
        where datepart(quarter, order_date) =1    -- 1 quarter indicates here 3 month
        group by pizza_size)

        select pizza_size, 
        total_sales ,
        over_all_sales ,
        concat(round((cast(total_sales as float)/over_all_sales)*100,1),'%') as  category_percent_sales from duplicate
        order by category_percent_sales desc;


        -- total pizzas sold per pizza category
        select * from pizza_sales;

        select pizza_category, sum(quantity) as total_pizzas from pizza_sales
        group by pizza_category
        order by total_pizzas desc;

-- TOP 5 BEST SELLERS BY TOTAL PIZZA SOLD:

SELECT * FROM pizza_sales;

select top 5
pizza_name, sum(quantity) as total_sold 
from pizza_sales 
group by pizza_name
order by total_sold desc;


-- show the bottom 5 by window function
select * from pizza_sales;

select * from(
select pizza_name, sum(quantity) as total_quantity, rank() over (order by sum(quantity)) as ranking
from pizza_sales
group by pizza_name)t
where ranking <=5;

select * ,datediff(month, new_date, oldest) as diff from (
select max(order_date) as new_date, min(order_date) as oldest from pizza_sales)t;