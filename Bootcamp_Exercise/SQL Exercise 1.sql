-- 1. Create tables

CREATE TABLE regions (
Region_ID NUMERIC PRIMARY KEY,
Region_Name VARCHAR(25)
)

CREATE TABLE countries (
Country_ID NUMERIC PRIMARY KEY,
Country_Name VARCHAR(40),
Region_ID NUMERIC REFERENCES regions(Region_ID) 
)

CREATE TABLE locations(
Location_ID NUMERIC PRIMARY KEY,
Street_Address VARCHAR(25),
Postal_Code VARCHAR(12),
City VARCHAR(30),
State_Province VARCHAR(12),
Country_ID NUMERIC REFERENCES countries(Country_ID)
)

CREATE TABLE departments(
Department_ID NUMERIC PRIMARY KEY,
Department_Name VARCHAR(30),
Manager_ID NUMERIC,
Location_ID NUMERIC
)

CREATE TABLE job_history(
Employee_ID NUMERIC PRIMARY KEY,
Start_Date DATE,
END_Date DATE,
Job_ID VARCHAR REFERENCES jobs(Job_ID),
Department_ID NUMERIC REFERENCES departments(Department_ID)
)
	
CREATE TABLE jobs(
Job_ID VARCHAR(10) PRIMARY KEY,
Job_Title VARCHAR(35),
Min_Salary NUMERIC,
Max_Salary NUMERIC
)
	
CREATE TABLE employees (
Employee_ID NUMERIC PRIMARY KEY,
First_Name VARCHAR(20),
Last_Name VARCHAR(25),
Email VARCHAR(25),
Phone_Number Varchar(20),
Hire_Date DATE,
Job_ID VARCHAR(10) REFERENCES jobs(Job_ID),
SALARY Numeric,
Commission_Pct Numeric,
Manager_ID Numeric,
Department_ID Numeric
)

-- 2. INSERT Data

INSERT INTO regions (Region_ID,Region_Name) VALUES 
(1, 'Asia'),
(2, 'Europe'),
(3, 'Africa');

INSERT INTO countries (Country_ID, Country_Name, Region_ID) VALUES
(100, 'China', 1),
(101, 'Italy', 2),
(102, 'Morocco', 3);

INSERT INTO locations (Location_ID, Street_Address, Postal_Code, City, State_Province, Country_ID) VALUES
(50, 'HappyStreet', 6000, 'CityA', 'StateA', 100),
(85, 'WonderStreet', 7000, 'CityB', 'StateB', 100),
(100, 'KingStreet', 8000, 'CityC', 'StateC', 101);

INSERT INTO departments (Department_ID, Department_Name, Manager_ID, Location_ID) VALUES
(1, 'Marketing', 1, 50),
(2, 'Design', 2, 85),
(3, 'Development', 3, 100 );

INSERT INTO jobs (Job_ID, Job_Title, Min_Salary, Max_Salary) VALUES
('0001', 'Marketing Analysist', 18000, 30000),
('0002', 'Marketing Assistant', 15000, 23000),
('0003', 'Designer', 23000, 38000);

INSERT INTO job_history (Employee_ID, Start_Date, Job_ID, Department_ID) VALUES
(1, '2024-01-01', '0001', 1),
(2, '2024-01-05', '0001', 1),
(3, '2024-02-03', '0003', 2);










