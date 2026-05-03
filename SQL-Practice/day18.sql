-- ================================================
-- Day 18 - SQL Learning Notes
-- Topic: SQL Commands and Functions Revision
-- ================================================

-- ------------------------------------------------
-- WHAT I PRACTICED TODAY
-- ------------------------------------------------

-- Revised all SQL Commands
--   DDL - CREATE DROP ALTER
--   DML - INSERT UPDATE DELETE
--   DQL - SELECT
-- Revised all Built-in Functions
--   Aggregate Functions
--   String Functions
--   Logical Functions
--   Date and Time Functions
--   Numeric Functions
--   Window Functions
-- SQL Projects delayed to Day 20
--   Reason: College Farewell Event

-- ------------------------------------------------
-- SQL COMMANDS REVISION
-- ------------------------------------------------

-- DDL COMMANDS - Data Definition Language

-- CREATE - make new database or table
CREATE DATABASE practice;
USE practice;

CREATE TABLE students
(
    student_id   INT          PRIMARY KEY,
    student_name VARCHAR(50)  NOT NULL,
    course       VARCHAR(30),
    marks        INT,
    join_date    DATE
);

-- ALTER - modify table structure
ALTER TABLE students
ADD COLUMN city VARCHAR(30);

ALTER TABLE students
DROP COLUMN city;

ALTER TABLE students
CHANGE COLUMN course subject VARCHAR(30);

-- DROP - delete table completely
DROP TABLE students;

-- DML COMMANDS - Data Manipulation Language

-- INSERT - add new rows
INSERT INTO students VALUES
(1, "Paras Shukla",  "Data Analytics", 95, "2024-01-10"),
(2, "Rahul Sharma",  "Python",         88, "2024-02-15"),
(3, "Priya Singh",   "SQL",            92, "2024-03-20"),
(4, "Amit Kumar",    "Data Analytics", 78, "2024-04-05"),
(5, "Neha Gupta",    "Power BI",       85, "2024-05-12");

-- UPDATE - modify existing data
UPDATE students
SET marks = marks + 5
WHERE course = "Data Analytics";

-- DELETE - remove rows
DELETE FROM students
WHERE marks < 80;

-- DQL COMMANDS - Data Query Language

-- SELECT - retrieve data
SELECT * FROM students;

SELECT student_name, course, marks
FROM students
WHERE marks > 85
ORDER BY marks DESC;

-- ------------------------------------------------
-- ALL BUILT-IN FUNCTIONS REVISION
-- ------------------------------------------------

-- AGGREGATE FUNCTIONS
SELECT
    COUNT(*)                AS total_students,
    SUM(marks)              AS total_marks,
    ROUND(AVG(marks), 2)    AS avg_marks,
    MAX(marks)              AS highest_marks,
    MIN(marks)              AS lowest_marks,
    COUNT(DISTINCT course)  AS total_courses
FROM students;

-- STRING FUNCTIONS
SELECT
    student_name,
    UPPER(student_name)             AS name_upper,
    LOWER(student_name)             AS name_lower,
    LENGTH(student_name)            AS name_length,
    LEFT(student_name, 5)           AS first_5,
    RIGHT(student_name, 5)          AS last_5,
    SUBSTRING(student_name, 1, 5)   AS sub_name,
    TRIM(student_name)              AS trimmed,
    REVERSE(student_name)           AS reversed
FROM students;

-- LOGICAL FUNCTIONS
SELECT
    student_name,
    marks,
    IF(marks >= 90,
        "Distinction",
        "Pass")                     AS result,
    IFNULL(course, "No Course")     AS course_name,
    CASE
        WHEN marks >= 90 THEN "Distinction"
        WHEN marks >= 80 THEN "First Class"
        WHEN marks >= 70 THEN "Second Class"
        ELSE                  "Pass"
    END                             AS grade
FROM students;

-- DATE AND TIME FUNCTIONS
SELECT
    student_name,
    join_date,
    DAY(join_date)                          AS join_day,
    MONTH(join_date)                        AS join_month,
    YEAR(join_date)                         AS join_year,
    DATEDIFF(CURRENT_DATE(), join_date)     AS days_enrolled,
    DATE_ADD(join_date, INTERVAL 6 MONTH)   AS course_end_date
FROM students;

-- NUMERIC FUNCTIONS
SELECT
    student_name,
    marks,
    ROUND(marks, 0)         AS rounded_marks,
    CEIL(marks / 10)        AS ceil_result,
    FLOOR(marks / 10)       AS floor_result,
    MOD(marks, 10)          AS remainder,
    ABS(marks - 85)         AS diff_from_85,
    POWER(2, 5)             AS power_example
FROM students;

-- WINDOW FUNCTIONS
SELECT
    student_name,
    course,
    marks,
    ROW_NUMBER() OVER(
        ORDER BY marks DESC)        AS row_num,
    RANK() OVER(
        ORDER BY marks DESC)        AS rank_num,
    DENSE_RANK() OVER(
        ORDER BY marks DESC)        AS dense_rank,
    NTILE(3) OVER(
        ORDER BY marks DESC)        AS tier,
    LAG(marks) OVER(
        ORDER BY marks DESC)        AS prev_marks,
    LEAD(marks) OVER(
        ORDER BY marks DESC)        AS next_marks,
    RANK() OVER(
        PARTITION BY course
        ORDER BY marks DESC)        AS rank_in_course
FROM students;

-- ------------------------------------------------
-- COMPLETE FUNCTIONS SUMMARY
-- ------------------------------------------------

-- AGGREGATE  = SUM AVG MAX MIN COUNT
-- STRING     = UPPER LOWER LENGTH LEFT RIGHT
--              SUBSTRING TRIM REVERSE
-- LOGICAL    = IF IFNULL NULLIF CASE COALESCE
-- DATE TIME  = CURRENT_DATE NOW DAY MONTH YEAR
--              DATE_ADD DATE_SUB DATEDIFF
-- NUMERIC    = ABS CEIL FLOOR MOD ROUND POWER
-- WINDOW     = ROW_NUMBER RANK DENSE_RANK
--              NTILE LAG LEAD PARTITION BY

-- ------------------------------------------------
-- PROJECT PLAN UPDATE
-- ------------------------------------------------

-- Today  = Day 18 - Revision done
-- Day 19 = College Farewell - Rest day
-- Day 20 = Projects start!

-- Projects Planned for This Week
-- Project 1 = EDA with SQL           - continue
-- Project 2 = Data Cleaning with SQL - start
-- Project 3 = SQL Project            - start
-- Project 4 = SQL with Dashboard     - start
-- Project 5 = E-Commerce Own Project - start

-- ------------------------------------------------
-- SUMMARY - WHAT I DID TODAY
-- ------------------------------------------------

-- Revised all DDL DML DQL commands
-- Revised all 6 categories of functions
-- Practiced all functions on students table
-- Projects delayed due to college farewell
-- Strong revision completed
-- Ready to start projects on Day 20

-- ------------------------------------------------
-- DAY 20 I WILL START
-- ------------------------------------------------

-- Continue EDA Project with SQL
-- Start Data Cleaning Project
-- Start E-Commerce Own Project
-- Upload all to SQL-Projects folder on GitHub