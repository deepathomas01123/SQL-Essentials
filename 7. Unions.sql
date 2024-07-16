-- Unions

SELECT * 
FROM employee_demographics
UNION
SELECT *
FROM employee_salary;


SELECT  first_name, last_name
FROM employee_demographics
UNION 
SELECT  first_name, last_name
FROM employee_salary;


SELECT  first_name, last_name
FROM employee_demographics
UNION ALL
SELECT  first_name, last_name
FROM employee_salary;

SELECT * FROM employee_salary;

-- Use case
-- Finding aged and higly paid ppl in a company

SELECT  first_name, last_name, age, 'Old' AS Label
FROM employee_demographics e1
WHERE age > 45
UNION
SELECT first_name, last_name, salary ,'High' AS Highest_Salary
FROM employee_salary e2
WHERE salary > 50000;


SELECT  first_name, last_name, age, gender, 'Old' AS Label
FROM employee_demographics e1
WHERE age > 45 AND gender = 'Male'
UNION
SELECT  first_name, last_name, age,gender, 'Old' AS Label
FROM employee_demographics e1
WHERE age > 45 AND gender = 'Female'
UNION
SELECT first_name, last_name, salary ,occupation,'High' AS Highest_Salary
FROM employee_salary e2
WHERE salary > 50000
ORDER By first_name, last_name;


