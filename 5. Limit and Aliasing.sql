SELECT * FROM
employee_demographics;

-- 3 oldest employees

SELECT first_name, last_name, birth_date, age
FROM employee_demographics
ORDER BY birth_date ASC
LIMIT 1,1;

-- Aliasing

SELECT gender, AVG(age) AS Average_Age
FROM employee_demographics
GROUP BY gender
HAVING Average_Age > 40;