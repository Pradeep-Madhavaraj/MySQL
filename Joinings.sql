CREATE DATABASE Joins;
USE joins;

CREATE TABLE Employees (
    employee_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees (employee_id, name, department, salary)
VALUES 
    (1, 'Alice', 'HR', 50000),
    (2, 'Bob', 'IT', 60000),
    (3, 'Charlie', NULL, 55000),
    (4, 'Diana', 'Marketing', 52000),
    (5, 'Emily', 'IT', NULL);


CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name)
VALUES 
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance'),
    (4, NULL);

SELECT * FROM Employees;
SELECT * FROM Departments;


-- a. List all employees along with their names, departments, and salaries. If an employee's department is not specified, still include their information.
SELECT e.name, e.department, e.salary
FROM Employees e
LEFT JOIN Departments d
ON e.department = d.department_name;

SELECT e.employee_id, e.name, e.department, e.salary, d.department_name
FROM Employees e
LEFT JOIN Departments d ON e.department = d.department_name;

-- b. How many employees are there in each department, including those with no specified department?
SELECT e.department, COUNT(e.name) FROM Employees e
LEFT JOIN Departments d ON e.department = d.department_name
GROUP BY e.Department;

-- c.Find the names of employees who don't have a department specified.
SELECT e.name
FROM Employees e
LEFT JOIN Departments d ON e.department = d.department_name
WHERE d.department_name IS NULL;

-- a. List all departments along with their names and employees. Include departments even if there are no employees assigned to them.
SELECT d.department_name, e.name
FROM Employees e
RIGHT JOIN departments d
ON e.department = d.department_name;

-- b. How many employees are there in each department, including those with no employees assigned?
SELECT d.department_name, count(e.name)
FROM Employees e
RIGHT JOIN departments d
ON e.department = d.department_name
WHERE d.department_name is not null
GROUP BY d.department_name;

-- c. Find the names of departments with no employees assigned.
SELECT d.department_name, count(e.name) FROM employees e
RIGHT JOIN departments d
ON e.department = d.department_name
WHERE d.department_name is not null
GROUP BY d.department_name
HAVING count(e.name)=0;


-- a. List all employees along with their names, departments, and salaries. Exclude employees without a specified department.
SELECT e.name, e.department, e.salary FROM employees e
INNER JOIN departments d
ON e.department = d.department_name;

-- b. Find the names of employees who have a department specified.
SELECT e.name
FROM Employees e
INNER JOIN Departments d ON e.department = d.department_name;

-- c. How many employees are there in each department, excluding those with no specified department?
SELECT d.department_name, count(e.name) FROM Employees e
INNER JOIN Departments d ON e.department = d.department_name
GROUP BY d.department_name;

SELECT * FROM Employees CROSS JOIN Departments;


SELECT department FROM Employees 
UNION
SELECT department_name FROM Departments;

SELECT e.department FROM Employees e
LEFT JOIN Departments d ON e.department = d.department_name
UNION ALL
SELECT e.department FROM Employees e
RIGHT JOIN Departments d ON e.department = d.department_name
WHERE e.department IS NULL;

