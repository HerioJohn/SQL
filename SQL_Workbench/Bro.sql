-- -------------------------------------------- [Ch. 2] How to create a DATABASE

-- Create Database
CREATE DATABASE mydb;

-- Use Specific Database (set it to default)
USE mydb;

-- Set Database to Read Only / Editable
ALTER DATABASE mydb READ ONLY = 1;
ALTER DATABASE mydb READ ONLY = 0;

-- -------------------------------------------- [Ch. 3] How to create a TABLE

-- Create Table
CREATE TABLE employees (
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2), -- 5 is maximum 5 digit, 2 is maximum 2 decimal digit
    hire_date DATE 
);

-- Select Table
SELECT * FROM employees; -- * means "All"

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

-- -------------------------------------------- [Ch. 4] How to INSERT rows into a TABLE

-- Insert empty row
INSERT INTO employees
VALUES();

-- Insert row
INSERT INTO employees
VALUES(1, "Eugene", "Krabs", 25.50, "2023-01-02");

-- Insert multiple row at once
INSERT INTO employees
VALUES (2, "Squidward", "Tentacles", 15.00, "2023-01-03"),
	   (3, "Spongebob", "Squarepants", 12.50, "2023-01-04"),
       (4, "Patrick", "Star", 12.50, "2023-01-05"),
       (5, "Sandy", "Cheeks", 17.25, "2023-01-10");
       
-- Insert row but with not completed data
INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");

-- -------------------------------------------- [Ch. 5] How to SELECT data from a TABLE

-- Show only last_name and first_name column
SELECT last_name, first_name
FROM employees;

-- Show the specific employee who have employee_id is 1
SELECT * FROM employees
WHERE employee_id = 1;

-- Show employee who have hourly_pay more than or equal 13
SELECt * FROM employees
WHERE hourly_pay >= 13;

-- Show employee whos hire_date is before or equal to 2023-01-04
SELECt * FROM employees
WHERE hire_date <= "2023-01-04";

-- Show employee whos hire_date is null
SELECT * FROM employees
WHERE hire_date IS NULL;

-- Show employee whos hire_date is not null
SELECT * FROM employees
WHERE hire_date IS NOT NULL;

-- -------------------------------------------- [Ch. 6] How to UPDATE and DELETE data from a TABLE

-- Update field
UPDATE employees
SET hourly_pay = 17
WHERE employee_id = 5;

-- Update multiple field
UPDATE employees
SET hourly_pay = 12
    hire_date = "2023-01-07"
WHERE employee_id = 6;

-- Delete row with condition (specific data)
DELETE FROM employees
WHERE employee_id = 6;

-- Delete row with condition (null)
DELETE FROM employees
WHERE first_name IS null;

-- -------------------------------------------- [Ch. 7] AUTOCOMMIT, COMMIT, ROLLBACK

SET AUTOCOMMIT = OFF;

COMMIT;

ROLLBACK;

-- -------------------------------------------- [Ch. 8] CURRENT_DATE() & CURRENT_TIME()

CREATE TABLE test(
	my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

SELECt * FROM test;

INSERT INTO test
VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());

-- -------------------------------------------- [Ch. 9] UNIQUE constraint

-- Create Table with a unique data
CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(25) UNIQUE,
    price DECIMAL(4, 2)
);

SELECt * FROM products;

-- Adjust a data to unique
ALTER TABLE products
ADD CONSTRAINT
UNIQUE(product_name);

INSERT INTO products
VALUES (1, "Hamburger", 3.99),
	   (2, "fries", 1.89),
	   (3, "soda", 1.00),
	   (4, "ice cream", 1.49);
       
INSERT INTO products
VALUES (5, "Hamburger", 3.99); -- Unable to add because there is already a hunique data - hamburger exist 

-- -------------------------------------------- [Ch. 10] NOT NULL constraint


-- Create a table with data that cannot set to be null
CREATE TABLE game_products (
	product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4, 2) NOT NULL 
);

-- set a data to not null
ALTER TABLE game_products
MODIFY product_name VARCHAR(25) NOT NULL;

-- -------------------------------------------- [Ch. 11] CHECK constraint is easy

CREATE TABLE employees (
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2), -- 5 is maximum 5 digit, 2 is maximum 2 decimal digit
    hire_date DATE,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00)    
);

INSERT INTO employees
VALUES (1, "Tommy", "Anderson", 9.00, "2024-1-14"); -- Unable to proceed because we set the hourly pay must higher than or equal to 10.00

-- Delete check
ALTER TABLE employees
DROP CHECK chk_hourly_pay;

-- -------------------------------------------- [Ch. 12] DEFAULT constraint is easy

SELECT * FROM products;

INSERT INTO products
VALUES (5, "straw", 0.00),
	   (6, "napkin", 0.00),
	   (7, "fork", 0.00),
       (8, "spoon", 0.00); -- It is a bit trouble some if we are going to add a bunch of item that is same price.
	
-- Create Table with default data
CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(25) UNIQUE,
    price DECIMAL(4, 2) DEFAULT 0
);

-- set a data with default values
ALTER TABLE products
ALTER price SET DEFAULT 0;

-- -------------------------------------------- [Ch. 13] PRIMARY KEYS are easy

-- (PRIMARY KEY: Cannot be null + Must be Unique)
-- (Each Table have only one primary key)

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5, 2)
);

INSERT INTO transactions
VALUES (1000, 4.99);

SELECT * FROM transactions;

-- set a data to primary key (if there is no yet)
ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY(transaction_id);

-- -------------------------------------------- [Ch. 14] AUTO_INCREMENT is awesome

-- (AUTO Increment can be set to the one which is already a primary key)

DROP TABLE transactions;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2)
);

SELECT * FROM transactions;

INSERT INTO transactions (amount)
VALUE (4.99); -- System already help us deal with the transaction_id data, we just need to tell what 4.99 is refer to

-- Set the Auto_Increment : transaction_id to start from 1000
ALTER TABLE transactions
AUTO_INCREMENT = 1000;

-- -------------------------------------------- [Ch. 15] FOREIGN KEYS are easy (kind of)alter

CREATE TABLE customer (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO customer (first_name, last_name)
VALUES ("John", "Anderson"),
	   ("Mary", "Jane"),
	   ("Peter", "Parker");
       
SELECT * FROM customer;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) -- Building a bound connection between two table's own column
);

DELETE FROM transactions;
SELECT * FROM transactions;

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

-- Drop Foreign Key
ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1;

-- Set Foreign Key a unique name
ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES customer(customer_id) 

INSERT INTO transactions (amount, customer_id)
VALUES (4.99, 3),
	   (2.89, 2),
	   (3.38, 3),
	   (4.99, 1);
       
DELETE FROM customer
WHERE customer_id = 3; -- can't do this because customer_id is already a foreign key, can't delete this unless we remove the foreign key

-- -------------------------------------------- [Ch. 16] JOINS are easy (INNER, LEFT, RIGHT)

-- INNER JOIN
SELECT transaction_id, amount,
FROM transactions INNER JOIN customers
ON transactions customer_id = customers.customer_id;

-- INNER JOIN but hide customer id
SELECT transaction_id, amount, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions customer_id = customers.customer_id;

-- LEFT JOIN
SELECT *
FROM transactions LEFT JOIN customers
ON transactions customer_id = customers.customer_id;

-- RIGHT JOIN
SELECT *
FROM transactions RIGHT JOIN customers
ON transactions customer_id = customers.customer_id;

-- -------------------------------------------- [Ch. 17] Functions in MySQL are easy

SELECT * FROM transactions;

INSERT INTO transactions
VALUES (1001, 5),
	   (1002, 8),
	   (1003, 2),
	   (1004, 12);

SELECT COUNT(amount)
FROM transactions;

SELECT MAX(amount)
FROM transactions;

SELECT MIN(amount)
FROM transactions;

SELECT AVG(amount)
FROM transactions;

SELECT SUM(amount)
FROM transactions;

SELECT * FROM employees

SELECT CONCAT(first_name," ",last_name) AS full_name
FROM employees;

-- -------------------------------------------- [Ch. 18] logical operators are easy

ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;
SELECT * FROM employees; 

UPDATE employees 
SET job = "astt. manager"
WHERE employee_id = 5;
SELECT * FROM employees;

SELECT * FROM employees
WHERE hire_date < "2023-01-05" AND job = "cook";

-- -------------------------------------------- [Ch. 19] wild cards are easy

-- Wild Card: % And _ 

SELECT * FROM employees
WHERE first_name LIKE "s%"; -- seachh first_name that is begin with "s"

SELECT * FROM employees
WHERE job LIKE "_ook"; -- _ means random character

SELECT * FROM employees
WHERE hire_date LIKE "____-01-__"; -- example 2 of using _

-- -------------------------------------------- [Ch. 20] ORDER BY clause is easy

SELECT * FROM employees
ORDER BY last_name ASC; -- order from A - Z , 1 - 100

SELECT * FROM employees
ORDER BY last_name DESC; -- order from Z - A, 100 - 1

SELECT * FROM employees
ORDER BY amount, customer_id; -- add one more compare incase there are same value

-- -------------------------------------------- [Ch. 21] LIMIT clause is easy

-- LIMIT cluase is used to limit the number of records.
-- Useful if you are working with a lot of data.
-- Can be used to display a large data on pages (pagination).

SELECT * FROM customers
LIMIT 1; -- display onyly the first row

SELECT * FROM customers
ORDER BY last_name LIMIT 2; -- combine with ORDER BY method

SELECT * FROM customers
LIMIT 10 , 10; -- display row 11 - 20






       










 