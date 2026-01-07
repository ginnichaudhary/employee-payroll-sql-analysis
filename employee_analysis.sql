CREATE DATABASE employee_system;
USE employee_system;
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50),
  salary INT,
  join_date DATE
);
INSERT INTO employees VALUES
(1,'Amit','IT',50000,'2022-01-10'),
(2,'Neha','HR',40000,'2021-03-15'),
(3,'Rahul','IT',60000,'2020-07-20'),
(4,'Priya','Sales',45000,'2023-02-01');
CREATE TABLE attendance (
  att_id INT PRIMARY KEY,
  emp_id INT,
  present_days INT,
  absent_days INT
);
INSERT INTO attendance VALUES
(1,1,22,2),
(2,2,20,4),
(3,3,24,0),
(4,4,18,6);
CREATE TABLE performance (
  perf_id INT PRIMARY KEY,
  emp_id INT,
  rating INT
);
INSERT INTO performance VALUES
(1,1,4),
(2,2,3),
(3,3,5),
(4,4,2);
SELECT * FROM employees;
SELECT * FROM performance;
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
SELECT e.emp_name, a.present_days, a.absent_days
FROM employees e
JOIN attendance a ON e.emp_id = a.emp_id;

SELECT e.emp_name, p.rating
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
WHERE p.rating >= 4;
SELECT e.emp_name, e.salary, p.rating
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id;
SELECT emp_name, salary,
CASE
  WHEN salary >= 55000 THEN 'High Salary'
  WHEN salary BETWEEN 40000 AND 54999 THEN 'Medium Salary'
  ELSE 'Low Salary'
END AS salary_category
FROM employees;



