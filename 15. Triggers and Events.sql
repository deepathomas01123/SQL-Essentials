-- Triggers and Events

SELECT * from
employee_demographics;

SELECT * from
employee_SALARY;

-- CREATING TRIGGERS

DELIMITER $$
CREATE TRIGGER insert_trigger
		AFTER INSERT ON employee_salary
        FOR EACH ROW
BEGIN
		INSERT INTO employee_demographics (employee_id, first_name, last_name)
        VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- testing TRIGGER
INSERT INTO employee_salary 
VALUES (13,'Jone', 'Jacob','Entertainment',1000000,NULL);

SELECT * FROM employee_salary;

SELECT * FROM employee_demographics;


UPDATE employee_demographics
SET age = 32,
		 gender = 'Male',
		birth_date = '1986-09-10'
WHERE employee_id = 13;

SELECT * FROM employee_demographics;


-- EVENTS

DELIMITER $$
CREATE EVENT delete_event2
ON SCHEDULE EVERY 30 SECOND
DO
		BEGIN
        DELETE FROM employee_demographics
        WHERE AGE >=60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'EVENT%';
