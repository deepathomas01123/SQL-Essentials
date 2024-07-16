-- TEMP Tables
-- Visible only to the session they are created.

CREATE TEMPORARY TABLE temp_table
( first_name varchar(50),
  last_name varchar(50),
  favourite_movie varchar(100)
);

INSERT INTO temp_table
VALUES
('Deepa', 'Thomas','Harry Potter');

SELECT * FROM temp_table;

-- Creating temp table from already existing table

CREATE TEMPORARY TABLE temp_table3
SELECT * FROM 
employee_salary
WHERE salary >= 50000;

SELECT * FROM temp_table3;