SELECT *
FROM employee_demographics;

SELECT  COUNT(first_name), gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT  salary  FROM
employee_salary
GROUP BY salary;

SELECT  salary, occupation FROM
employee_salary
GROUP BY salary, occupation;

SELECT gender,MAX(age), AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT gender,MAX(age), AVG(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name, last_name DESC;

SELECT *
FROM employee_demographics
ORDER BY 5, 4;

