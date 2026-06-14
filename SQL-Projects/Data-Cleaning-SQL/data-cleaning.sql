-- ================================================
-- Data Cleaning with SQL - Layoffs Dataset
-- Database: world_layoffs
-- ================================================

USE world_layoffs;

-- Preview original data
SELECT * FROM layoffs;

-- 4 Steps of Data Cleaning:
-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Handle NULL or Blank Values
-- 4. Remove Unnecessary Columns

-- ================================================
-- CREATE STAGING TABLE (Best Practice)
-- ================================================

-- Copy table structure only
CREATE TABLE layoffs_staging
LIKE layoffs;

-- Copy all data into staging table
INSERT INTO layoffs_staging
SELECT * FROM layoffs;

SELECT * FROM layoffs_staging;

-- ================================================
-- STEP 1 - REMOVE DUPLICATES
-- ================================================

-- Find duplicates using ROW_NUMBER
WITH duplicate_cte AS
(
    SELECT *,
        ROW_NUMBER() OVER(
            PARTITION BY
                company, location, industry,
                total_laid_off, date, stage,
                country, funds_raised_millions
        ) AS row_num
    FROM layoffs_staging
)
SELECT * FROM duplicate_cte
WHERE row_num > 1;

-- CTE cannot be used with DELETE in MySQL
-- So create a second staging table with row_num column

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert data with row numbers
INSERT INTO layoffs_staging2
SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY
            company, location, industry,
            total_laid_off, date, stage,
            country, funds_raised_millions
    ) AS row_num
FROM layoffs_staging;

-- Delete duplicate rows
DELETE FROM layoffs_staging2
WHERE row_num > 1;

-- ================================================
-- STEP 2 - STANDARDIZE THE DATA
-- ================================================

-- Fix company column extra spaces
UPDATE layoffs_staging2
SET company = TRIM(company);

-- Fix industry naming inconsistencies
-- Crypto, Crypto Currency, CryptoCurrency -> Crypto
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Check location column (no issues found)
SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

-- Fix country column trailing full stop
-- "United States." -> "United States"
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- Convert date column from text to date
UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

-- Change column data type from text to DATE
ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;

-- ================================================
-- STEP 3 - HANDLE NULL AND BLANK VALUES
-- ================================================

-- Check rows where both layoff numbers are NULL
SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Check industry NULL or blank values
SELECT * FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

-- Convert blank industry to NULL
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Fill NULL industry using SELF JOIN
-- match same company and location
SET SQL_SAFE_UPDATES = 0;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;

-- Verify remaining NULLs
SELECT * FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';
-- Bally has only 1 record, cannot be fixed

-- ================================================
-- STEP 4 - REMOVE UNNECESSARY COLUMNS
-- ================================================

-- Drop row_num helper column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

-- ================================================
-- FINAL CLEANED TABLE
-- ================================================

SELECT * FROM layoffs_staging2;