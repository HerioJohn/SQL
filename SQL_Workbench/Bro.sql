-- Create Database
Create Database mydb;

-- Create Table
CREATE TABLE employees (
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE 
);

-- Select Table
SELECT * FROM employees;

-- Rename Table 
RENAME TABLE employees TO workers;
RENAME TABLE workers TO employees;

-- Drop Table
DROP Table employees;

-- Alter (改變) Table
Alter Table employees
ADD phone_number VARCHAR(15);

-- Rename Column
ALTER TABLE employees
RENAME COLUMN phone_number TO email;

-- Modify
Alter Table employees
MODIFY COLUMN email VARCHAR(100);

-- Move Column
ALTER TABLE employees
MODIFY email VARCHAR(100)
AFTER last_name;

-- Move Column to First Position
ALTER TABLE employees
MODIFY email VARCHAR(100)
FIRST;

-- Drop Column
ALTER TABLE employees
DROP COLUMN email;

-- Insert row
INSERT INTO employees
VALUES(1, "Eugene", "Krabs", 25.50, "2023-01-02");

-- Insert multiple row
INSERT INTO employees
VALUES (2, "Squidward", "Tentacles", 15.00, "2023-01-03"),
	   (3, "Spongebob", "Squarepants", 12.50, "2023-01-04"),
       (4, "Patrick", "Star", 12.50, "2023-01-05"),
       (5, "Sandy", "Cheeks", 17.25, 2023-01-10);

 