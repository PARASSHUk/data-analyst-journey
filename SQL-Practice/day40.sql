-- ================================================
-- Day 40 - SQL Learning Notes
-- Topic: Data Cleaning with SQL - Day 1
--        Remove Duplicates and
--        Standardize Data
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Started Data Cleaning Project with SQL
-- Learned 4 steps of Data Cleaning
-- Learned how to create staging tables
-- Learned how to find duplicates
-- Learned how to remove duplicates
-- Learned why we need staging tables
-- Started Step 2 Standardize Data
-- Database Used: world_layoffs
-- Table Used: layoffs

-- ================================================
-- DATA CLEANING PROJECT - DAY 1
-- ================================================

-- Project Name: Data Cleaning with SQL
-- Database: world_layoffs
-- Table: layoffs
-- Status: In Progress

USE world_layoffs;

-- Preview original data
SELECT * FROM layoffs;

-- ================================================
-- 4 STEPS OF DATA CLEANING
-- ================================================

-- Step 1 = Remove Duplicates
-- Step 2 = Standardize the Data
-- Step 3 = Handle NULL and Blank Values
-- Step 4 = Remove Unnecessary Columns

-- ================================================
-- BEST PRACTICE - CREATE STAGING TABLE
-- ================================================

-- Why Create Staging Table?
-- Never work directly on original data!
-- If something goes wrong original is safe
-- Staging table = working copy of data
-- This is professional best practice!

-- ------------------------------------------------
-- Create Staging Table - Copy Structure Only
-- ------------------------------------------------

-- LIKE keyword copies structure of table
-- No data is copied only column definitions
CREATE TABLE layoffs_staging
LIKE layoffs;

-- Verify staging table is empty
SELECT * FROM layoffs_staging;

-- ------------------------------------------------
-- Copy All Data to Staging Table
-- ------------------------------------------------

-- INSERT SELECT copies all data
-- from layoffs to layoffs_staging
INSERT INTO layoffs_staging
SELECT * FROM layoffs;

-- Verify data is copied correctly
SELECT * FROM layoffs_staging;

-- ================================================
-- STEP 1 - REMOVE DUPLICATES
-- ================================================

-- Goal:
-- Find rows that appear more than once
-- Remove duplicate rows from dataset
-- Keep only one copy of each unique row

-- ------------------------------------------------
-- Method 1 - Find Duplicates Using CTE
-- ------------------------------------------------

-- ROW_NUMBER assigns number to each row
-- PARTITION BY groups same combinations
-- If row_num > 1 then it is a duplicate

WITH duplicate_cte AS
(
    SELECT *,
        ROW_NUMBER() OVER(
            PARTITION BY
                company,
                location,
                industry,
                total_laid_off,
                date,
                stage,
                country,
                funds_raised_millions
        ) AS row_num
    FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- Verify specific company has duplicates
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- ------------------------------------------------
-- Why We Cannot Delete Directly from CTE
-- ------------------------------------------------

-- This does NOT work in MySQL!
-- DELETE inside CTE is not allowed
-- because DELETE is an UPDATE type statement
-- CTE is read only in MySQL

WITH duplicate_cte AS
(
    SELECT *,
        ROW_NUMBER() OVER(
            PARTITION BY
                company,
                location,
                industry,
                total_laid_off,
                date,
                stage,
                country,
                funds_raised_millions
        ) AS row_num
    FROM layoffs_staging
)
DELETE
FROM duplicate_cte
WHERE row_num > 1;
-- ERROR! Cannot delete from CTE in MySQL

-- ------------------------------------------------
-- Solution - Create Second Staging Table
-- ------------------------------------------------

-- Add row_num as a permanent column
-- Then we can DELETE rows using WHERE

-- Get CREATE statement by:
-- Right click layoffs_staging table
-- Go to Clipboard
-- Click Create Statement
-- Add row_num column at the end

CREATE TABLE layoffs_staging2
(
    company                 TEXT,
    location                TEXT,
    industry                TEXT,
    total_laid_off          INT DEFAULT NULL,
    percentage_laid_off     TEXT,
    date                    TEXT,
    stage                   TEXT,
    country                 TEXT,
    funds_raised_millions   INT DEFAULT NULL,
    row_num                 INT              -- new column added!
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;

-- Verify new table is empty
SELECT * FROM layoffs_staging2;

-- ------------------------------------------------
-- Insert Data with Row Numbers
-- ------------------------------------------------

-- INSERT INTO is same as INSERT
-- INTO keyword is optional in both
-- MySQL and SQL Server

INSERT INTO layoffs_staging2
SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY
            company,
            location,
            industry,
            total_laid_off,
            date,
            stage,
            country,
            funds_raised_millions
    ) AS row_num
FROM layoffs_staging;

-- Verify data inserted correctly
SELECT * FROM layoffs_staging2;

-- ------------------------------------------------
-- Delete Duplicate Rows
-- ------------------------------------------------

-- Now we can delete because
-- row_num is a real column
-- WHERE clause works on real columns

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

-- Verify no more duplicates
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;
-- Should return 0 rows = no duplicates!

-- ================================================
-- STEP 2 - STANDARDIZE DATA
-- ================================================

-- Goal:
-- Fix inconsistent data in columns
-- Fix spelling errors and spacing
-- Make data consistent and uniform
-- Started today will continue tomorrow

-- Preview data to find issues
SELECT * FROM layoffs_staging2;

-- ================================================
-- KEY LEARNINGS FROM DATA CLEANING TODAY
-- ================================================

-- STAGING TABLE
--   Always create copy before cleaning
--   Never modify original raw data
--   Use LIKE to copy table structure
--   Use INSERT SELECT to copy data

-- CREATE TABLE LIKE
--   Copies only structure not data
--   Fast way to create identical table

-- ROW_NUMBER with PARTITION BY
--   Groups rows by combination of columns
--   Assigns number within each group
--   row_num = 1 means first occurrence
--   row_num > 1 means duplicate!

-- WHY CTE DELETE FAILS IN MYSQL
--   CTE is read only in MySQL
--   Cannot run DELETE on CTE
--   Solution = create new table with row_num
--   Then DELETE where row_num > 1

-- INSERT vs INSERT INTO
--   Both work the same way
--   INTO keyword is optional
--   INSERT INTO is more readable

-- ================================================
-- DATA CLEANING STEPS STATUS
-- ================================================

-- Step 1 = Remove Duplicates        ✅ Done
-- Step 2 = Standardize Data         🔄 Started
-- Step 3 = Handle NULL Blank Values ⏳ Tomorrow
-- Step 4 = Remove Columns           ⏳ Tomorrow

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Started Data Cleaning Project
-- Created staging tables safely
-- Found and removed all duplicates
-- Learned why CTE delete fails
-- Learned staging table best practice
-- Started standardization process


-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Complete Step 2 Standardize Data
--   Fix company name spacing
--   Fix industry inconsistencies
--   Fix country name issues
--   Fix date column format
-- Complete Step 3 Handle NULLs
-- Complete Step 4 Remove Columns
-- Finish Data Cleaning Project!