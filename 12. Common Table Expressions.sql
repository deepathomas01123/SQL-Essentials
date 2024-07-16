-- CTE - Query within  a query

WITH CTE_Example AS
(
	SELECT gender, AVG(salary), COUNT(salary), MAX(salary), MIN(salary)
	FROM 
	employee_demographics e1
	JOIN employee_salary e2
		ON e1.employee_id = e2.employee_id
	GROUP BY gender
)
SELECT * FROM
CTE_Example;


WITH CTE_Example AS
(
	SELECT gender, AVG(salary), COUNT(salary), MAX(salary), MIN(salary)
	FROM 
	employee_demographics e1
	JOIN employee_salary e2
		ON e1.employee_id = e2.employee_id
	GROUP BY gender
)
SELECT  AVG(`AVG(salary)`)FROM
CTE_Example;


-- Multiple CTEs

WITH CTE_Example AS
(
	SELECT employee_id, gender, birth_date
    FROM employee_demographics
    WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(	SELECT	employee_id, salary
	FROM employee_salary
    WHERE salary > 50000
)
SELECT * FROM
CTE_Example 
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id;
    
-- Using Alias in the CTE expression


WITH CTE_Example (Gender, Average_Salary, Count_Salary, Max_Salary, Min_Salary) AS
(
	SELECT gender, AVG(salary), COUNT(salary), MAX(salary), MIN(salary)
	FROM 
	employee_demographics e1
	JOIN employee_salary e2
		ON e1.employee_id = e2.employee_id
	GROUP BY gender
)
SELECT  * FROM
CTE_Example;