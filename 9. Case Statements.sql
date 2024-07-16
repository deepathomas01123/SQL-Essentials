-- Case statements

SELECT first_name, last_name, age,
CASE
			WHEN age < 30 THEN 'Young'
END
FROM employee_demographics;

-- Multiple cases

SELECT first_name, last_name, age,
CASE
			WHEN age < 30 THEN 'Young'
            WHEN age BETWEEN 31 AND 50 THEN ' Middle-aged'
END
FROM employee_demographics;

SELECT first_name, last_name, age,
CASE
			WHEN age < 30 THEN 'Young'
            WHEN age BETWEEN 31 AND 50 THEN ' Middle-aged'
            WHEN age >= 50 THEN 'Old'
END AS Age_Bracket
FROM employee_demographics;


-- Use Case

SELECT * FROM parks_departments;

SELECT first_name, last_name, salary,dept_id,
CASE 
			WHEN salary < 50000 THEN  salary + (0.05*salary)
            WHEN salary >= 50000 THEN salary + ( 0.07*salary)
END AS New_Salary,
CASE
			WHEN dept_id  = 6 THEN Salary *0.10
END AS Bonus
FROM employee_salary e;





