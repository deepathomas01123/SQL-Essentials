-- EDA with SQL

SELECT * 
from layoff_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM 
layoff_staging2;

SELECT  country, total_laid_off
FROM layoff_staging2
ORDER BY total_laid_off DESC;

SELECT SUM(total_laid_off), country, company
FROM layoff_staging2
GROUP BY country, company
ORDER BY SUM(total_laid_off) DESC;

SELECT SUM(total_laid_off), industry
FROM layoff_staging2
GROUP BY industry
ORDER BY SUM(total_laid_off) DESC;

SELECT SUM(total_laid_off), country
FROM layoff_staging2
GROUP BY country
ORDER BY SUM(total_laid_off) DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;

SELECT substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY `MONTH`;

-- Rolling total

WITH Rolling_Total AS
(
		SELECT substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
		FROM layoff_staging2
        GROUP BY `MONTH`
        ORDER BY 2 ASC
) 
SELECT `MONTH`, total_off,
 SUM(total_off)
OVER (ORDER BY `MONTH`)
FROM Rolling_Total;


WITH CTE (company, years, total_laid_off) AS
(
	SELECT company, YEAR(`date`), SUM(total_laid_off)
    FROM layoff_staging2
    GROUP BY company, YEAR(`date`)
)
SELECT * ,
DENSE_RANK() OVER (PARTITION BY  years oRDER BY total_laid_off DESC ) AS Ranking
FROM CTE
WHERE years is NOT NULL
ORDER By RANKING ASC;
