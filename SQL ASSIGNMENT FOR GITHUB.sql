create database company_db;

USE company_db;

create table skills(skills_id int identity(1,1) primary key,skills_name varchar(50)Not null,category varchar(100));

Select*from skills;

select *from INFORMATION_SCHEMA.tables;

select * from employee;

EXEC sp_rename 'employee','staff';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO staff
(first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES
('john','doe','john.goe@company.com','2025-01-10',69000,2,'male');

DROP TABLE staff;

CREATE TABLE staff(
emp_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT,
gender VARCHAR(10)
);


CREATE TABLE project(
project_id INT IDENTITY(1,1) PRIMARY KEY,
project_name VARCHAR(100),
budget DECIMAL(10,2),
dept_id INT
);

INSERT INTO project (project_name, budget, dept_id)
VALUES
('Mobile App',60000,2),
('Training Program',25000,1);

 CREATE TABLE department(
dept_id INT IDENTITY(1,1) PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);

INSERT INTO department (dept_name, location)
VALUES
('Sales','Boston');

INSERT INTO staff (first_name, email)
VALUES
('Tom','tom@company.com');

select *from staff;

select * from project;

select *from department;
--------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select *from staff;

select emp_id AS Employee_ID,first_name AS Employee_name,salary AS Employee_salary from staff;

SELECT *
FROM staff
WHERE hire_date > '2023-01-01';

SELECT*FROM project WHERE budget > 40000 ORDER BY budget DESC;

SELECT DISTINCT location FROM department;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE staff ADD phone_number VARCHAR(15);

UPDATE staff SET salary = 65000 WHERE first_name = 'John' AND last_name = 'Doe';

select *from staff;

UPDATE staff
SET gender = 'Other'
WHERE dept_id = 2;


ALTER TABLE staff
ADD phone_number VARCHAR(15);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM staff
WHERE salary BETWEEN 60000 AND 80000;

SELECT *
FROM staff
WHERE first_name LIKE 'J%';

SELECT *
FROM project
WHERE dept_id IN (1,2);

SELECT *
FROM staff
WHERE email IS NOT NULL;

SELECT *
FROM department
WHERE location NOT IN ('New York','Chicago');

SELECT *
FROM staff
WHERE YEAR(hire_date) = 2023;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT SUM(salary) AS Total_Salary FROM staff;

SELECT AVG(budget) AS Average_Budget FROM project;

SELECT MAX(salary) AS Highest_Salary FROM staff;

SELECT COUNT(*) AS IT_Employees FROM staff WHERE dept_id = 2;

SELECT MIN(budget) AS Minimum_Budget FROM project;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT s.first_name, s.last_name, d.dept_name
FROM staff s
INNER JOIN department d
ON s.dept_id = d.dept_id;

SELECT d.dept_name, COUNT(s.emp_id) AS employee_count
FROM department d
LEFT JOIN staff s
ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

SELECT p.project_name, d.dept_name
FROM project p
INNER JOIN department d
ON p.dept_id = d.dept_id;

SELECT s.first_name, s.last_name
FROM staff s
INNER JOIN department d
ON s.dept_id = d.dept_id
WHERE d.location = 'San Francisco';

SELECT d.dept_name
FROM department d
LEFT JOIN project p
ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;



