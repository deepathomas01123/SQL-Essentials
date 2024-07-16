
-- Window Functions

SELECT  gender, AVG(salary) AS Avergae_Salary
FROM
employee_demographics e1
JOIN employee_salary e2
		ON e1.employee_id = e2.employee_id
GROUP BY gender;


-- Using Window Functions.

-- This one just calculates avergae salary of everyone irrespective of gender
SELECT  gender, AVG(salary)  OVER()
FROM
employee_demographics e1
JOIN employee_salary e2
		ON e1.employee_id = e2.employee_id
;

-- This one calculates avg salary specific to gender

SELECT  e1.first_name, e1.last_name,gender, AVG(salary)  OVER(partition by gender)
FROM
employee_demographics e1
JOIN employee_salary e2
		ON e1.employee_id = e2.employee_id
;


-- Rolling total
SELECT e1.first_name, e1.last_name, gender, salary,
SUM(salary) OVER(partition by gender ORDER BY e1.employee_id) AS Rolling_Total
FROM employee_demographics e1
JOIN employee_salary e2
	ON e1.employee_id = e2.employee_id;
    
    
-- ROW NUMBER

SELECT first_name, last_name,
ROW_NUMBER() OVER()
FROM employee_demographics;


-- ROW NUMBER OVER Gender

SELECT e1.first_name, e1.last_name, salary, gender, e1.employee_id,
ROW_NUMBER() OVER (PARtiTION BY gender)
FROM 
employee_demographics e1
JOIN employee_salary e2
	ON e1.employee_id = e2.employee_id;
    
-- RANKING BASED ON SALARY
SELECT e1.first_name, e1.last_name, salary, gender, e1.employee_id,
ROW_NUMBER() OVER (PARtiTION BY gender ORDER BY salary DESC)
FROM 
employee_demographics e1
JOIN employee_salary e2
	ON e1.employee_id = e2.employee_id;
    
-- USING RANK
SELECT e1.first_name, e1.last_name, salary, gender, e1.employee_id,
ROW_NUMBER() OVER (PARtiTION BY gender ORDER BY salary DESC) as Row_Num,
RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM 
employee_demographics e1
JOIN employee_salary e2
	ON e1.employee_id = e2.employee_id;

-- DENSE RANK
SELECT e1.first_name, e1.last_name, salary, gender, e1.employee_id,
ROW_NUMBER() OVER (PARtiTION BY gender ORDER BY salary DESC) as Row_Num,
RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM 
employee_demographics e1
JOIN employee_salary e2
	ON e1.employee_id = e2.employee_id;
