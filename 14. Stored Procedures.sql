-- Stored Procedures

CREATE PROCEDURE large_salaries()
SELECT * FROM employee_salary
WHERE salary >= 50000;

-- Calling procedure

CALL large_salaries();

-- Using Delimiters

DELIMITER $$
CREATE PROCEDURE procedure2()
BEGIN
			SELECT * FROM
			employee_salary
			WHERE salary >= 50000;
			SELECT * FROM
			employee_salary
			WHERE salary > 10000;
END $$

DELIMITER ;
call procedure2();

-- Parameter

DROP PROCEDURE IF EXISTS `employee_salary3`;
DELIMITER $$
CREATE PROCEDURE employee_salary3(emp_id INT)
BEGIN
			SELECT * FROM 
            employee_salary
            WHERE employee_id = emp_id;
END $$

CALL employee_salary3(2);