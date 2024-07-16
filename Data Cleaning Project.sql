-- DATA CLEANING PROJECTS

SELECT * FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize data
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns

-- Creating a duplicate table

CREATE TABLE layoff_staging
LIKE layoffs;

INSERT layoff_staging
SELECT *
FROM layoffs;

SELECT * FROM layoff_staging;

-- Creating Row Number

SELECT *,
ROW_number() OVER( 
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) as Row_num
FROM layoff_staging;

-- Selecting duplicate rows using CTE

WITH duplicate_rows_cte AS
(		SELECT * ,
		 ROW_NUMBER() OVER( 
         PARTITION BY company,location,industry, total_laid_off, percentage_laid_off,`date`,stage,country,funds_raised_millions) AS Row_num
         FROM layoff_staging
)
SELECT * FROM duplicate_rows_cte
WHERE Row_num > 1;

SELECT * FROM
layoff_staging
WHERE company = 'Yahoo';

-- Removing Duplicate Rows by first copying the rows into a new Table - the CTE Result 
-- And then deleting those rows with Row_num > 2
CREATE TABLE `layoff_staging2` (
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

INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`,stage, country, funds_raised_millions) AS Row_num
FROM layoff_staging;

SELECT *
FROM layoff_staging2
WHERE row_num>1;

DELETE FROM layoff_staging2
WHERE row_num>1;

-- Dropping the Row_num column

ALTER TABLE layoff_staging2
DROP COLUMN row_num;

-- 2. STANDARDISING DATA

UPDATE layoff_staging2
SET company = TRIM(company);

SELECT * FROM layoff_staging2;
SELECT DISTINCT(industry)
FROM layoff_staging2
ORDER BY industry;

-- Changing Crypto industry to be all uniform

UPDATE layoff_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country, TRIM(TRAILING  '.' FROM country)
FROM layoff_staging2
ORDER BY 1;

UPDATE layoff_staging2
SET Country = 'United States'
WHERE country LIKE 'United States%';

SELECT DISTINCT country
FROM layoff_staging2
ORDER BY 1;

-- Changing date

UPDATE layoff_staging2
SET `date` = str_to_date(`date`,'%m/%d/%Y');

SELECT `date`
FROM layoff_staging2;

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;

-- DEALING with Missing values

SELECT * FROM layoff_staging2
WHERE industry IS NULL or industry = '';

SELECT * FROM layoff_staging2
WHERE company IN('Airbnb',"Bally's Interactive",'Carvana','Juul');

UPDATE layoff_staging2
SET industry = null
WHERE industry = '';

SELECT *
FROM layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL OR t1.industry = ''
	AND t2.industry is not null;
    
UPDATE layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Dealing with missing values in lay-offs columns

DELETE FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

