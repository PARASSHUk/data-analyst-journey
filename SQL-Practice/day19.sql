-- ================================================
-- Day 19 - SQL Learning Notes
-- Topic: Built-in Functions Complete Revision
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Complete revision of all Built-in Functions
--   Aggregate Functions
--   String Functions
--   Logical Functions
--   Date and Time Functions
--   Numeric Functions
--   Window Functions

-- ------------------------------------------------
-- 1. AGGREGATE FUNCTIONS REVISION
-- ------------------------------------------------

-- COUNT   = counts total rows
-- SUM     = adds all values
-- AVG     = finds average value
-- MAX     = finds highest value
-- MIN     = finds lowest value
-- COUNT DISTINCT = counts unique values only

SELECT
    COUNT(*)                    AS total_rows,
    COUNT(DISTINCT department)  AS unique_departments,
    SUM(salary)                 AS total_salary,
    ROUND(AVG(salary), 2)       AS avg_salary,
    MAX(salary)                 AS highest_salary,
    MIN(salary)                 AS lowest_salary
FROM employees;

-- With GROUP BY
SELECT
    department,
    COUNT(*)                    AS total_employees,
    SUM(salary)                 AS dept_total_salary,
    ROUND(AVG(salary), 2)       AS dept_avg_salary,
    MAX(salary)                 AS dept_highest_salary,
    MIN(salary)                 AS dept_lowest_salary
FROM employees
GROUP BY department
ORDER BY dept_avg_salary DESC;

-- ------------------------------------------------
-- 2. STRING FUNCTIONS REVISION
-- ------------------------------------------------

-- UPPER    = converts to UPPERCASE
-- LOWER    = converts to lowercase
-- LENGTH   = counts number of characters
-- LEFT     = extracts from left side
-- RIGHT    = extracts from right side
-- SUBSTRING= extracts middle part
-- TRIM     = removes extra spaces
-- REVERSE  = reverses the text

SELECT
    emp_name,
    UPPER(emp_name)              AS upper_name,
    LOWER(emp_name)              AS lower_name,
    LENGTH(emp_name)             AS name_length,
    LEFT(emp_name, 4)            AS first_4_chars,
    RIGHT(emp_name, 4)           AS last_4_chars,
    SUBSTRING(emp_name, 2, 4)    AS middle_chars,
    TRIM("   Paras Shukla   ")   AS trimmed_name,
    REVERSE(emp_name)            AS reversed_name
FROM employees;

-- Real use case
-- Find employees whose name starts with P
SELECT emp_name
FROM employees
WHERE emp_name LIKE "P%";

-- Find employees whose name is longer than 10 chars
SELECT emp_name, LENGTH(emp_name) AS name_length
FROM employees
WHERE LENGTH(emp_name) > 10
ORDER BY name_length DESC;

-- ------------------------------------------------
-- 3. LOGICAL FUNCTIONS REVISION
-- ------------------------------------------------

-- IF       = simple true or false condition
-- IFNULL   = replace NULL with a value
-- NULLIF   = return NULL if two values equal
-- COALESCE = return first non NULL value
-- CASE     = multiple conditions like if else

SELECT
    emp_name,
    salary,
    department,

    -- IF Function
    IF(salary > 55000,
        "High Salary",
        "Normal Salary")             AS salary_category,

    -- IFNULL Function
    IFNULL(department,
        "No Department")             AS dept_name,

    -- NULLIF Function
    NULLIF(salary, 0)                AS safe_salary,

    -- COALESCE Function
    COALESCE(department,
        city, "Unknown")             AS location,

    -- CASE Statement
    CASE
        WHEN salary >= 70000 THEN "Level 4 Senior"
        WHEN salary >= 60000 THEN "Level 3 Mid Senior"
        WHEN salary >= 50000 THEN "Level 2 Mid"
        WHEN salary >= 40000 THEN "Level 1 Junior"
        ELSE                       "Trainee"
    END                              AS emp_level
FROM employees;

-- ------------------------------------------------
-- 4. DATE AND TIME FUNCTIONS REVISION
-- ------------------------------------------------

-- CURRENT_DATE = today date
-- CURRENT_TIME = current time
-- NOW          = date and time together
-- DAY          = extract day number
-- MONTH        = extract month number
-- YEAR         = extract year number
-- HOUR         = extract hour
-- MINUTE       = extract minute
-- DATE_ADD     = add days months years
-- DATE_SUB     = subtract days months years
-- DATEDIFF     = days between two dates

SELECT
    emp_name,
    join_date,

    -- Current date and time
    CURRENT_DATE()                          AS today,
    NOW()                                   AS current_datetime,

    -- Extract parts of date
    DAY(join_date)                          AS join_day,
    MONTH(join_date)                        AS join_month,
    YEAR(join_date)                         AS join_year,

    -- Extract parts of time
    HOUR(CURRENT_TIME())                    AS current_hour,
    MINUTE(CURRENT_TIME())                  AS current_minute,

    -- Date calculations
    DATEDIFF(CURRENT_DATE(), join_date)     AS days_in_company,
    DATE_ADD(join_date, INTERVAL 1 YEAR)    AS first_anniversary,
    DATE_ADD(join_date, INTERVAL 6 MONTH)   AS six_month_mark,
    DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) AS thirty_days_ago
FROM employees;

-- Real use case
-- Find employees who joined in last 1 year
SELECT emp_name, join_date
FROM employees
WHERE join_date >= DATE_SUB(
    CURRENT_DATE(), INTERVAL 1 YEAR
)
ORDER BY join_date DESC;

-- ------------------------------------------------
-- 5. NUMERIC FUNCTIONS REVISION
-- ------------------------------------------------

-- ABS   = absolute value removes negative sign
-- CEIL  = always rounds UP
-- FLOOR = always rounds DOWN
-- MOD   = remainder after division
-- ROUND = rounds to given decimal places
-- POWER = raises number to a power

SELECT
    salary,

    -- ABS
    ABS(salary - 60000)         AS diff_from_60k,

    -- CEIL and FLOOR
    CEIL(salary / 1000.0)       AS ceil_in_thousands,
    FLOOR(salary / 1000.0)      AS floor_in_thousands,

    -- MOD
    MOD(salary, 1000)           AS remainder,

    -- ROUND
    ROUND(salary / 1000.0, 2)   AS salary_in_thousands,

    -- POWER
    POWER(2, 10)                AS two_power_ten,
    POWER(salary, 0)            AS any_power_zero

FROM employees;

-- Difference between CEIL FLOOR ROUND
-- CEIL(4.1)  = 5  always goes up
-- CEIL(4.9)  = 5  always goes up
-- FLOOR(4.1) = 4  always goes down
-- FLOOR(4.9) = 4  always goes down
-- ROUND(4.4) = 4  rounds to nearest
-- ROUND(4.5) = 5  rounds to nearest

-- ------------------------------------------------
-- 6. WINDOW FUNCTIONS REVISION
-- ------------------------------------------------

-- ROW_NUMBER  = unique number for each row
-- RANK        = rank with gaps for ties
-- DENSE_RANK  = rank without gaps for ties
-- NTILE       = divide rows into n groups
-- LAG         = value from previous row
-- LEAD        = value from next row
-- PARTITION BY= resets function per group

SELECT
    emp_name,
    department,
    salary,

    -- Row numbering
    ROW_NUMBER() OVER(
        ORDER BY salary DESC)        AS row_num,

    -- Ranking overall
    RANK() OVER(
        ORDER BY salary DESC)        AS overall_rank,

    -- Dense ranking overall
    DENSE_RANK() OVER(
        ORDER BY salary DESC)        AS overall_dense_rank,

    -- Divide into 4 quartiles
    NTILE(4) OVER(
        ORDER BY salary DESC)        AS quartile,

    -- Previous and next salary
    LAG(salary, 1, 0) OVER(
        ORDER BY salary DESC)        AS prev_salary,
    LEAD(salary, 1, 0) OVER(
        ORDER BY salary DESC)        AS next_salary,

    -- Rank within department
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC)        AS rank_in_dept,

    -- Dense rank within department
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC)        AS dense_rank_in_dept
FROM employees;

-- Difference RANK vs DENSE_RANK
-- Scores: 100, 90, 90, 80
-- RANK()       = 1, 2, 2, 4  skips 3
-- DENSE_RANK() = 1, 2, 2, 3  no skip

-- ------------------------------------------------
-- ALL FUNCTIONS SUMMARY TABLE
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS
-- COUNT(*)              = count all rows
-- COUNT(DISTINCT col)   = count unique values
-- SUM(col)              = sum of all values
-- AVG(col)              = average value
-- MAX(col)              = highest value
-- MIN(col)              = lowest value

-- STRING FUNCTIONS
-- UPPER(col)            = to uppercase
-- LOWER(col)            = to lowercase
-- LENGTH(col)           = character count
-- LEFT(col, n)          = first n chars
-- RIGHT(col, n)         = last n chars
-- SUBSTRING(col, s, n)  = extract part
-- TRIM(col)             = remove spaces
-- REVERSE(col)          = reverse text

-- LOGICAL FUNCTIONS
-- IF(cond, t, f)        = true or false
-- IFNULL(col, val)      = replace null
-- NULLIF(v1, v2)        = null if equal
-- COALESCE(c1, c2)      = first non null
-- CASE WHEN THEN ELSE   = multi condition

-- DATE TIME FUNCTIONS
-- CURRENT_DATE()        = today
-- CURRENT_TIME()        = now time
-- NOW()                 = date and time
-- DAY MONTH YEAR        = extract parts
-- HOUR MINUTE           = extract time parts
-- DATE_ADD              = add interval
-- DATE_SUB              = subtract interval
-- DATEDIFF              = days between

-- NUMERIC FUNCTIONS
-- ABS(n)                = no negative
-- CEIL(n)               = round up
-- FLOOR(n)              = round down
-- MOD(n, d)             = remainder
-- ROUND(n, d)           = round decimals
-- POWER(n, e)           = n to power e

-- WINDOW FUNCTIONS
-- ROW_NUMBER()          = unique row num
-- RANK()                = rank with gaps
-- DENSE_RANK()          = rank no gaps
-- NTILE(n)              = n equal groups
-- LAG()                 = previous row
-- LEAD()                = next row
-- PARTITION BY          = reset per group

-- ------------------------------------------------
-- SUMMARY - WHAT I DID TODAY
-- ------------------------------------------------

-- Revised all 6 categories of functions
-- Practiced each function with examples
-- Understood real use cases of each function
-- Ready to start SQL projects tomorrow

-- ------------------------------------------------
-- TOMORROW I WILL START
-- ------------------------------------------------

-- Day 20 - Projects Begin!
-- Continue EDA Project with SQL
-- Start Data Cleaning Project with SQL
-- Start E-Commerce Own Project
-- Upload projects to SQL-Projects folder