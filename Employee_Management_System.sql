# sql-practice
  
  --create_tables.sql
  
-- Employee Management System - Table Creation
CREATE TABLE departments (dept_id INT PRIMARY KEY, dept_name VARCHAR(50));
SELECT 'Table created successfully!' AS status;
-- Then view the data
SELECT * FROM departments;
CREATE TABLE employees (emp_id INT PRIMARY KEY, emp_name VARCHAR(100), dept_id INT, joining_date DATE, salary INT, FOREIGN KEY (dept_id) REFERENCES departments(dept_id));

--🔗 Understanding Foreign Key
--In our project, we use the following line:
--```sql
--FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
-- This means that the dept_id column in the employees table must match a value in the departments table. It helps to:
--(1) Connect related tables
--(2)Ensure data accuracy
--(3)Prevent assigning employees to non-existing departments
--For example: ✅ Valid: dept_id = 1 (exists in departments)
--❌ Invalid: dept_id = 9 (doesn’t exist)
--This is called referential integrity in SQL.

--insert_data.sql

-- Data for Employees and Departments
INSERT INTO departments VALUES (1, 'HR'), (2, 'Finance'), (3, 'IT'), (4, 'Marketing');
INSERT INTO employees VALUES
(101, 'Amit Sharma', 1, '2021-06-01', 50000),
(102, 'Priya Jha', 2, '2022-01-15', 60000),
(103, 'Neha Verma', 3, '2020-03-10', 80000),
(104, 'Ravi Kumar', 4, '2023-02-20', 45000),
(105, 'Sneha Gupta', 3, '2022-08-05', 75000),
(106, 'Karan Mehta', 1, '2020-11-12', 52000),
(107, 'Isha Malhotra', 2, '2023-01-10', 61000),
(108, 'Nitin Sinha', 4, '2019-09-25', 47000),
(109, 'Divya Raj', 3, '2021-04-17', 72000),
(110, 'Rohit Das', 2, '2020-06-08', 55000),
(111, 'Anjali Roy', 1, '2022-03-14', 58000),
(112, 'Manish Yadav', 3, '2023-05-18', 79000),
(113, 'Simran Kaur', 4, '2021-12-07', 46000),
(114, 'Gaurav Singh', 2, '2019-07-13', 63000),
(115, 'Megha Rani', 1, '2020-10-28', 51000),
(116, 'Sahil Jain', 3, '2023-08-01', 77000),
(117, 'Pooja Mishra', 4, '2021-05-06', 48000),
(118, 'Yash Thakur', 2, '2022-09-30', 59000),
(119, 'Ritika Bansal', 1, '2023-04-11', 56000),
(120, 'Alok Dubey', 3, '2020-01-25', 81000),
(121, 'Neeraj Chopra', 1, '2021-06-22', 53000),
(122, 'Tanya Arora', 2, '2022-10-19', 60000),
(123, 'Rahul Bose', 4, '2023-03-15', 49000),
(124, 'Swati Saxena', 3, '2021-11-04', 76000),
(125, 'Dev Patel', 2, '2020-07-12', 62000),
(126, 'Ira Sengupta', 1, '2022-12-18', 57000),
(127, 'Kunal Joshi', 4, '2019-08-03', 44000),
(128, 'Aarushi Nair', 3, '2023-06-27', 74000),
(129, 'Tarun Bhatia', 1, '2021-01-09', 52000),
(130, 'Preeti Jain', 2, '2020-05-14', 61000),
(131, 'Arjun Kapoor', 4, '2022-04-21', 47000),
(132, 'Naina Pandey', 3, '2019-12-30', 79000),
(133, 'Harsh Chauhan', 1, '2023-07-25', 55000),
(134, 'Vidya Iyer', 2, '2021-08-05', 64000),
(135, 'Siddharth Reddy', 3, '2020-02-17', 80000),
(136, 'Kiara Sen', 4, '2022-06-12', 45000),
(137, 'Mohit Narayan', 1, '2020-09-11', 53000),
(138, 'Reena Kapoor', 2, '2023-01-29', 59000),
(139, 'Jay Sinha', 3, '2021-10-10', 78000),
(140, 'Tanvi Bhatt', 4, '2022-11-22', 46000),
(141, 'Ashwin Rao', 1, '2020-03-18', 50000),
(142, 'Mira Chopra', 2, '2019-06-06', 62000),
(143, 'Viraj Mehra', 3, '2023-02-02', 82000),
(144, 'Shruti Rawal', 4, '2021-09-27', 47000),
(145, 'Kritika Das', 1, '2022-05-23', 54000),
(146, 'Zaid Ahmed', 2, '2020-08-31', 60000),
(147, 'Lavanya Tiwari', 3, '2023-03-09', 77000),
(148, 'Sameer Khan', 4, '2021-02-14', 49000),
(149, 'Anushka Joshi', 2, '2020-04-03', 65000),
(150, 'Parth Jain', 1, '2023-08-15', 57000);

-- SQL Queries for Practice
-- 1. List all employees with their department names
SELECT emp_id, emp_name, dept_name FROM employees JOIN departments ON employees.dept_id=departments.dept_id;
--JOIN combines both tables, and ON tells SQL to match them based on dept_id.

-- 2. Find employees who joined after 2021
SELECT * FROM employees WHERE joining_date > '2021';

-- 3. Get department-wise average salary
 SELECT dept_id, AVG(salary) AS Avg_sal FROM employees GROUP BY dept_id; 
--AVG() is a SQL aggregate function that calculates the average (mean) of a numeric column.
--AS is used to give a temporary name to a column or a table, just for display.

---- 4. Find the highest paid employee
 SELECT TOP 1 emp_name, salary FROM employees ORDER BY salary DESC;

--WHERE – Employees who joined after 2022
SELECT emp_name, joining_date FROM employees WHERE joining_date > '2022-01-01';

--AND – Employees in department 3 with salary above 70000
SELECT emp_name, dept_id, salary FROM employees WHERE dept_id = 3 AND salary > 70000;

--OR – Employees in department 1 or 2
SELECT emp_name, dept_id FROM employees WHERE dept_id = 1 OR dept_id = 2;

--NOT – Employees who are not in department 4
SELECT emp_name, dept_id FROM employees WHERE dept_id NOT IN (4);

--Employees with salary between 50000 and 80000, sorted by joining date
SELECT emp_name, salary, joining_date FROM employees WHERE salary >= 50000 AND salary <= 80000 ORDER BY joining_date ASC;





