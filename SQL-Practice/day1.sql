-- ================================================
-- Day 1 - SQL Learning Notes
-- Topic: DDL Commands, DQL Commands and Constraints
-- Database Used: pwsqlpractice
-- ================================================

-- ------------------------------------------------
-- STEP 1 - Created Database
-- ------------------------------------------------

-- Created a new database
CREATE DATABASE pwsqlpractice;

-- Selected the database to use
USE pwsqlpractice;

-- ------------------------------------------------
-- STEP 2 - Created Table
-- ------------------------------------------------

-- Created a table called courses
CREATE TABLE courses
(
    course_id        CHAR(10),
    course_name      VARCHAR(30),
    mode_of_delivery VARCHAR(10),
    student_Intake   INT,
    Faculty          VARCHAR(30)
);

-- ------------------------------------------------
-- STEP 3 - DDL Commands Practiced
-- ------------------------------------------------

-- DROP TABLE - deletes entire table
DROP TABLE courses;

-- ALTER - change column name
-- changed mode_of_delivery to delivery_mode
ALTER TABLE courses
CHANGE COLUMN mode_of_delivery delivery_mode VARCHAR(10);

-- ALTER - add new column to table
ALTER TABLE courses
ADD COLUMN location VARCHAR(20);

-- ALTER - drop a column from table
ALTER TABLE courses
DROP COLUMN location;

-- ------------------------------------------------
-- STEP 4 - DQL Command
-- ------------------------------------------------

-- SELECT - view all data in table
SELECT * FROM courses;

-- ------------------------------------------------
-- STEP 5 - CONSTRAINTS LEARNED
-- ------------------------------------------------

-- There are 6 Constraints in SQL
-- 1. PRIMARY KEY
-- 2. FOREIGN KEY
-- 3. NOT NULL
-- 4. UNIQUE
-- 5. DEFAULT
-- 6. CHECK

-- UNIQUE Constraint Example
-- course_id cannot have duplicate values
CREATE TABLE courses
(
    course_id        CHAR(10) UNIQUE,
    course_name      VARCHAR(30),
    mode_of_delivery VARCHAR(10),
    student_Intake   INT,
    Faculty          VARCHAR(30)
);

-- ------------------------------------------------
-- STEP 6 - DML Commands - INSERT
-- ------------------------------------------------

-- INSERT single row
INSERT INTO courses VALUES
("PW101", "Data Analytics", "Recorded", 100, "Suraj");

-- INSERT multiple rows at once
INSERT INTO courses VALUES
("PW102", "fs Data",         "Recorded", 120, "Vijay"),
("PW103", "fs Data Science", "Live",     300, "Saurabh"),
("PW104", "fs Data",         "Recorded", 120, "Vijay");

-- View inserted data
SELECT * FROM courses;

-- ------------------------------------------------
-- WHAT I LEARNED TODAY
-- ------------------------------------------------

-- DDL Commands = CREATE, DROP, ALTER
--   CREATE  = makes new table or database
--   DROP    = deletes table completely
--   ALTER   = changes table structure

-- DQL Commands = SELECT
--   SELECT * = shows all columns and rows

-- DML Commands = INSERT, UPDATE
--   INSERT  = adds new rows to table

-- CONSTRAINTS = rules applied on columns
--   UNIQUE  = no duplicate values allowed
--   NOT NULL = column cannot be empty
--   CHECK   = value must meet a condition
--   PRIMARY KEY = unique + not null combined
--   FOREIGN KEY = links two tables together
--   DEFAULT = sets automatic default value

-- ------------------------------------------------
-- TOMORROW I WILL PRACTICE
-- ------------------------------------------------

-- UPDATE command
-- DELETE command
-- WHERE clause
-- SELECT with conditions
-- More constraints practice