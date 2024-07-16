SELECT * FROM  employee_salary
WHERE first_name = 'Leslie';

SELECT * FROM  employee_salary
WHERE salary > 50000;

SELECT * FROM employee_demographics
WHERE gender != 'Female';

SELECT * FROM employee_demographics
WHERE  birth_date > '1985-01-01';

-- AND OR NOT -- Logical Operators

SELECT * FROM employee_demographics
WHERE  birth_date > '1985-01-01'
AND gender ='Male';

SELECT * FROM employee_demographics
WHERE  birth_date > '1985-01-01'
OR gender ='Male';

SELECT * FROM employee_demographics
WHERE  birth_date > '1985-01-01'
OR NOT gender ='Male';

-- LIKE Statement

SELECT * FROM employee_demographics
WHERE first_name LIKE 'Jer%';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'Jerr_';

SELECT * FROM employee_demographics
WHERE first_name LIKE '%er%';


SELECT * FROM employee_demographics
WHERE first_name LIKE 'A%';


