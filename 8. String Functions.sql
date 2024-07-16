-- String Functions

SELECT first_name, length(first_name)
FROM employee_demographics;

SELECT UPPER('sky');
SELECT TRIM('        SKY        ');

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name,4)
FROM employee_demographics;


-- SUBSTRING


SELECT first_name,
SUBSTRING(first_name, 2,2)
FROM employee_demographics;

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name,4),
birth_date, substring(birth_date,6,2) AS birth_month
FROM employee_demographics;


-- REPLACE


SELECT first_name, REPLACE(first_name, 'a', 'AZ')
FROM employee_demographics;


-- Locate

SELECT LOCATE('x', 'ALEX');


SELECT first_name, last_name,
CONCAT(first_name, '  ', last_name)
FROM employee_demographics;