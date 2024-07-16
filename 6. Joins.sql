-- JOINS
SELECT * FROM
employee_demographics
INNER JOIN employee_salary 
		ON employee_demographics.employee_id = employee_salary.employee_id;
        
-- Using Aliases
SELECT * FROM
employee_demographics AS t1
INNER JOIN employee_salary  AS t2
		ON t1.employee_id = t2.employee_id;

SELECT t1.employee_id, age, salary 
FROM employee_demographics AS t1
INNER JOIN employee_salary  AS t2
		ON t1.employee_id = t2.employee_id;
        
        
        
-- Outer Join - > LEFT and RIGHT
SELECT *
FROM employee_demographics AS t1
LEFT  JOIN employee_salary  AS t2
		ON t1.employee_id = t2.employee_id;
        
SELECT *
FROM employee_demographics AS t1
RIGHT  JOIN employee_salary  AS t2
		ON t1.employee_id = t2.employee_id;
        
-- SELF Join

SELECT * FROM employee_demographics e1
JOIN employee_demographics e2
	ON e1.employee_id = e2.employee_id;

SELECT * FROM employee_salary e1
JOIN employee_salary e2
	ON e1.employee_id = e2.employee_id;

SELECT * FROM employee_salary e1
JOIN employee_salary e2
	ON e1.employee_id + 1 = e2.employee_id;
    
SELECT  e1.employee_id AS secret_santa_id,
e1.first_name AS santa_name,
e2. employee_id AS secret_child_id,
e2.first_name AS child_name
FROM employee_salary e1
JOIN employee_salary e2
	ON e1.employee_id + 1 = e2.employee_id;
    
    
    
    -- JOINING multiple tables
SELECT * from employee_demographics;
SELECT * from employee_salary;

SELECT * FROM
employee_demographics e1
JOIN employee_salary e2
	ON e1.employee_id = e2.employee_id
JOIN parks_departments p 
	ON e2.dept_id = p.department_id;
    
    
        
