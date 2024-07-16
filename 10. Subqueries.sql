-- Subqueries

-- selecting employees who work in parks and rec dept

SELECT * FROM parks_departments;

SELECT * 
FROM employee_demographics
WHERE employee_id IN (
												SELECT employee_id
                                                FROM employee_salary
                                                WHERE dept_id = 1);
                                                
-- Selecting salary > avg salary
SELECT first_name, last_name, salary
FROM employee_salary
WHERE salary > ( 
								SELECT AVG(salary) as Avg_Salary
                                FROM employee_salary
);

SELECT first_name, last_name, salary,
 ( 
								SELECT AVG(salary)
                                FROM employee_salary
)
FROM employee_salary;



-- Using aggregated functions

SELECT gender, AVG(`Max(Age)`)
FROM 
(SELECT gender, AVG(age) As Averrage_Age, MAX(age), COUNT(age)
FROM employee_demographics
GROUP By gender) AS Agg_Table
GROUP BY gender;
                                                