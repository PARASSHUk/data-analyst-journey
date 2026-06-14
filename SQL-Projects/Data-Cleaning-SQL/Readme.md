# Data Cleaning with SQL - Layoffs Dataset

## Project Overview
- Tool Used: MySQL
- Database: world_layoffs
- Status: Completed ✅
- Original Table: layoffs
- Cleaned Table: layoffs_staging2

## Problem Statement
The raw layoffs dataset contains duplicates,
inconsistent text formatting, wrong data types,
and missing values. This project cleans the data
step by step to make it analysis ready.

## Data Cleaning Steps Followed

### Step 1 - Remove Duplicates
- Created staging table copy using CREATE TABLE LIKE
- Copied all data using INSERT SELECT
- Used ROW_NUMBER with PARTITION BY across
  all columns to identify exact duplicates
- Since CTE delete is not allowed in MySQL,
  created a second staging table with row_num
  as a real column
- Deleted all rows where row_num > 1

### Step 2 - Standardize the Data
- Removed extra spaces from company names using TRIM
- Fixed inconsistent industry names
  (Crypto, Crypto Currency, CryptoCurrency to Crypto)
- Checked location column for inconsistencies
- Removed trailing full stop from
  "United States." to "United States"
- Converted date column from TEXT to DATE
  using STR_TO_DATE and ALTER TABLE MODIFY COLUMN

### Step 3 - Handle NULL and Blank Values
- Identified rows with NULL total_laid_off
  and percentage_laid_off
- Converted blank industry values to NULL
- Used SELF JOIN on company and location
  to fill missing industry values from
  matching rows
- Identified unfixable NULL (single record
  with no reference data - Bally company)

### Step 4 - Remove Unnecessary Columns
- Dropped row_num helper column after
  duplicates were removed using
  ALTER TABLE DROP COLUMN

## SQL Skills Used
- CREATE TABLE LIKE (copy table structure)
- INSERT SELECT (copy table data)
- ROW_NUMBER with PARTITION BY (CTE)
- TRIM and TRIM TRAILING
- STR_TO_DATE for date conversion
- ALTER TABLE MODIFY COLUMN
- ALTER TABLE CHANGE COLUMN
- ALTER TABLE DROP COLUMN
- SELF JOIN to fill missing values
- SQL_SAFE_UPDATES handling
- UPDATE with JOIN

## Before and After Comparison

| Issue | Before | After |
|-------|--------|-------|
| Duplicates | Multiple exact duplicate rows | Removed all duplicates |
| Company names | "  Company Name  " with spaces | "Company Name" trimmed |
| Industry | Crypto, Crypto Currency, CryptoCurrency | Crypto (standardized) |
| Country | "United States." | "United States" |
| Date | Text format MM/DD/YYYY | Proper DATE data type |
| Industry NULLs | Blank or NULL values | Filled using matching company data |
| Extra Columns | row_num helper column | Removed after use |

## Files in This Project
- data-cleaning.sql = All cleaning queries
- data/layoffs_raw.csv = Original messy data
- data/layoffs_cleaned.csv = Cleaned final data
- README.md = Project description

## How to Run
1. Import layoffs_raw.csv into MySQL as table layoffs
2. Open data-cleaning.sql in MySQL Workbench
3. Run queries step by step in order
4. Final cleaned table will be layoffs_staging2

## Key Takeaway
Always work on a staging copy of data,
never clean data directly in the original
table. This protects raw data and allows
you to redo cleaning if mistakes happen.