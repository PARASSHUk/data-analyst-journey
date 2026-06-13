-- ================================================
-- Day 41 - SQL Learning Notes
-- Topic: Data Cleaning Project - Day 2
--        Step 2 - Standardize the Data
-- ================================================

-- ------------------------------------------------
-- WHAT I DID TODAY
-- ------------------------------------------------

-- Revised EDA Project concepts
-- Revised Data Cleaning Project Day 1
-- Continued Data Cleaning Project
-- Completed Step 2 Standardize Data
--   Fixed extra spaces in company column
--   Fixed industry name inconsistencies
--   Fixed country name issues
--   Converted date column from text to date
-- Learned TRIM TRAILING method
-- Learned STR_TO_DATE function
-- Learned ALTER TABLE MODIFY COLUMN

-- ================================================
-- DATA CLEANING PROJECT - DAY 2
-- ================================================

-- Project Name: Data Cleaning with SQL
-- Database: world_layoffs
-- Table: layoffs_staging2
-- Status: In Progress

USE world_layoffs;

-- ================================================
-- STEP 2 - STANDARDIZE THE DATA
-- ================================================

-- Goal:
-- Find issues in data and fix them
-- Make data consistent and uniform
-- Fix spelling errors and formatting
-- Fix wrong data types

-- ------------------------------------------------
-- 2A - FIX COMPANY COLUMN
-- ------------------------------------------------

-- Check company names have extra spaces
SELECT
    company,
    TRIM(company) AS trimmed_company
FROM layoffs_staging2;

-- TRIM removes spaces from both sides
-- Found extra spaces in company names
-- Need to update all company names

-- Update company column to remove spaces
UPDATE layoffs_staging2
SET company = TRIM(company)
LIMIT 2356;

-- Verify fix worked
SELECT DISTINCT company
FROM layoffs_staging2
ORDER BY 1;

-- ------------------------------------------------
-- 2B - FIX INDUSTRY COLUMN
-- ------------------------------------------------

-- Check all unique industry names
-- Looking for spelling errors or inconsistencies
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

-- Found issue: Crypto Currency has multiple names
-- Crypto, Crypto Currency, CryptoCurrency
-- All should be just Crypto

-- Check how many crypto variations exist
SELECT industry
FROM layoffs_staging2
ORDER BY 1;

-- Update all crypto variations to Crypto
-- LIKE Crypto% catches all variations
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
LIMIT 102;

-- Verify all crypto fixed
SELECT COUNT(*)
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';
-- Should show only one Crypto now

-- ------------------------------------------------
-- 2C - FIX LOCATION COLUMN
-- ------------------------------------------------

-- Check all unique locations
SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;
-- Looks fine no major issues found

-- ------------------------------------------------
-- 2D - FIX COUNTRY COLUMN
-- ------------------------------------------------

-- Check all unique countries
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;
-- Found issue: United States has a full stop
-- United States and United States.
-- Both exist but should be same!

-- This query was not finding the issue
SELECT COUNT(*)
FROM layoffs_staging2
WHERE industry LIKE 'United States%';

-- Better way to find the issue
-- TRIM TRAILING removes specific character
-- from the end of a string
SELECT DISTINCT
    country,
    TRIM(TRAILING '.' FROM country) AS fixed_country
FROM layoffs_staging2
ORDER BY 1;
-- Shows United States. becoming United States

-- Update country to remove trailing full stop
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%'
LIMIT 2356;

-- Verify fix worked
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;
-- Should show only United States now

-- ------------------------------------------------
-- 2E - FIX DATE COLUMN
-- ------------------------------------------------

-- Check date column format
SELECT date
FROM layoffs_staging2;
-- Found issue: date is stored as TEXT
-- Format is MM/DD/YYYY as text string
-- Need to convert to proper DATE type

-- STR_TO_DATE converts text to date
-- '%m/%d/%Y' tells MySQL the format
-- %m = month %d = day %Y = 4 digit year
SELECT
    date,
    STR_TO_DATE(date, '%m/%d/%Y') AS proper_date
FROM layoffs_staging2;

-- Update date column with proper date values
UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y')
LIMIT 2356;

-- Verify dates look correct
SELECT date FROM layoffs_staging2;

-- ------------------------------------------------
-- IMPORTANT NOTE
-- ------------------------------------------------

-- After UPDATE the VALUES are correct
-- But the COLUMN TYPE is still TEXT!
-- We need to change the column data type
-- Use ALTER TABLE MODIFY COLUMN for this

-- Change date column type from TEXT to DATE
-- MODIFY is a DDL command
ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;

-- Alternative way using CHANGE COLUMN
-- CHANGE COLUMN can rename and retype
ALTER TABLE layoffs_staging2
CHANGE COLUMN date date DATE;

-- Verify column type is now DATE
SELECT date FROM layoffs_staging2;

-- ================================================
-- KEY LEARNINGS FROM TODAY
-- ================================================

-- TRIM(column)
--   Removes spaces from both sides
--   Very useful for fixing text columns
--   UPDATE with SET column = TRIM(column)

-- TRIM(TRAILING '.' FROM column)
--   Removes specific character from end
--   TRAILING = from the right side end
--   LEADING  = from the left side start
--   BOTH     = from both sides

-- LIKE 'Crypto%'
--   Finds all values starting with Crypto
--   Used to catch all variations
--   UPDATE with LIKE to fix all at once

-- STR_TO_DATE(column, format)
--   Converts text date to proper DATE
--   Format tells MySQL how to read text
--   '%m/%d/%Y' = month/day/4digit year
--   '%d/%m/%Y' = day/month/4digit year
--   '%Y-%m-%d' = year-month-day

-- ALTER TABLE MODIFY COLUMN
--   Changes the data type of a column
--   MODIFY = change existing column type
--   CHANGE = rename and change type both
--   This is a DDL command

-- DIFFERENCE MODIFY vs CHANGE
--   MODIFY COLUMN col DATE
--     = change type only keep same name
--   CHANGE COLUMN col col DATE
--     = can rename and change type both

-- ================================================
-- DATA CLEANING STEPS STATUS
-- ================================================

-- Step 1 = Remove Duplicates          ✅ Done
-- Step 2 = Standardize Data           ✅ Done
--   Company names trimmed             ✅
--   Industry names standardized       ✅
--   Location checked no issues        ✅
--   Country trailing dot removed      ✅
--   Date converted to DATE type       ✅
-- Step 3 = Handle NULL Blank Values   ⏳ Tomorrow
-- Step 4 = Remove Columns             ⏳ Tomorrow

-- ================================================
-- SUMMARY - WHAT I DID TODAY
-- ================================================

-- Revised EDA Project completely
-- Revised Data Cleaning Day 1
-- Completed standardization of all columns
-- Fixed company extra spaces
-- Fixed crypto industry name variations
-- Fixed United States trailing dot
-- Converted date from text to DATE type
-- Learned TRIM TRAILING method
-- Learned STR_TO_DATE function
-- Learned ALTER MODIFY vs CHANGE

-- ================================================
-- TOMORROW I WILL
-- ================================================

-- Step 3 Handle NULL and Blank Values
--   Find NULL values in all columns
--   Decide to fill or remove NULLs
--   Handle blank string values
-- Step 4 Remove Unnecessary Columns
--   Remove row_num column
--   Remove any other unwanted columns
-- Complete Data Cleaning Project!
-- Write README for project
-- Upload to SQL-Projects on GitHub