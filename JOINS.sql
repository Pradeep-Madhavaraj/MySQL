CREATE SCHEMA newPractice;
USE newPractice;
CREATE TABLE employee (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(255),
department_ID INT,
salary INT,
FOREIGN KEY (department_id) REFERENCES departments(department_id));

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO employee (employee_id, employee_name, department_id, salary) VALUES
(1, 'John Doe', 1, 50000.00),
(2, 'Jane Smith', 2, 60000.00),
(3, 'Michael Johnson', 1, 55000.00),
(4, 'Emily Davis', 2, 62000.00),
(5, 'David Brown', 3, 70000.00),
(6, 'Sarah Wilson', 3, 72000.00),
(7, 'Daniel Taylor', 1, 53000.00),
(8, 'Rachel Martinez', 2, 61000.00),
(9, 'Christopher Anderson', 4, 65000.00),
(10, 'Amanda Thompson', 5, 75000.00),
(11, 'Matthew Thomas', 1, 52000.00),
(12, 'Lauren White', 2, 59000.00),
(13, 'Kevin Harris', 3, 68000.00),
(14, 'Jessica Clark', 4, 64000.00),
(15, 'Brian Walker', 5, 73000.00),
(16, 'Ashley Hall', 1, 51000.00),
(17, 'Andrew Allen', 2, 63000.00),
(18, 'Elizabeth Green', 3, 71000.00),
(19, 'Joshua Baker', 4, 66000.00),
(20, 'Megan Carter', 5, 74000.00),
(21, 'Robert Adams', 1, 54000.00),
(22, 'Samantha Young', 2, 58000.00),
(23, 'William King', 3, 69000.00),
(24, 'Victoria Scott', 4, 67000.00),
(25, 'Ryan Nelson', 5, 72000.00),
(26, 'Olivia Ramirez', 1, 55000.00),
(27, 'Tyler Wright', 2, 59000.00),
(28, 'Jennifer Hill', 3, 70000.00),
(29, 'Jason Roberts', 4, 66000.00),
(30, 'Kimberly Lee', 5, 75000.00),
(31, 'Christopher Morgan', 1, 53000.00),
(32, 'Emily Murphy', 2, 61000.00),
(33, 'David Garcia', 3, 69000.00),
(34, 'Alexis Perez', 4, 65000.00),
(35, 'James Evans', 5, 73000.00),
(36, 'Stephanie Baker', 1, 52000.00),
(37, 'Nicholas Torres', 2, 60000.00),
(38, 'Kayla Gonzalez', 3, 68000.00),
(39, 'Daniel Rivera', 4, 64000.00),
(40, 'Michelle Hall', 5, 72000.00),
(41, 'Brandon Lopez', 1, 54000.00),
(42, 'Maria Rodriguez', 2, 57000.00),
(43, 'Jacob Martinez', 3, 67000.00),
(44, 'Natalie Diaz', 4, 63000.00),
(45, 'Justin Wright', 5, 71000.00),
(46, 'Alyssa Thompson', 1, 55000.00),
(47, 'William Hernandez', 2, 62000.00),
(48, 'Melissa Adams', 3, 70000.00),
(49, 'Michael Lee', 4, 66000.00),
(50, 'Katherine Hall', 5, 74000.00);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'Engineering'),
(5,'Sales');

INSERT INTO departments (department_id, department_name) VALUES (6,'IT');

SELECT * FROM employee;
SELECT * FROM departments;

SELECT employee_name, departments.department_name FROM employee
CROSS JOIN departments
ON employee.department_id = departments.department_id;

SELECT employee_name FROM employee
CROSS JOIN departments
ON employee.department_id = departments.department_id
WHERE departments.department_name = 'Finance';

INSERT INTO employee (employee_name, salary) VALUES ('Pradeep',80000);

SELECT employee_name, departments.department_name FROM employee
LEFT JOIN departments
ON employee.department_id = departments.department_id;

SELECT COUNT(Employee_id) AS Employees, department_name FROM employee 
JOIN departments
ON employee.department_id = departments.department_id
GROUP BY Department_name;

SELECT COUNT(Employee_id) AS Employees, department_name FROM employee 
RIGHT JOIN departments
ON employee.department_id = departments.department_id
GROUP BY Department_name
ORDER BY COUNT(Employee_id);

SELECT COUNT(Employee_id) AS Employees, department_name FROM employee 
RIGHT JOIN departments
ON employee.department_id = departments.department_id
GROUP BY Department_name
ORDER BY COUNT(Employee_id) DESC 
LIMIT 1;

SELECT TRUNCATE(AVG(salary),2) AS AVERAGE_SALARY, Department_name FROM employee
CROSS JOIN departments
ON employee.department_id = departments.department_id
GROUP BY department_name
ORDER BY AVG(salary) DESC;

---------

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT
);

INSERT INTO orders (order_id, order_date, customer_id) VALUES
(101, '2024-05-01', 1),
(102, '2024-05-02', 2),
(103, '2024-05-03', 3),
(104, '2024-05-04', 4),
(105, '2024-05-05', 5),
(106, '2024-05-06', 6),
(107, '2024-05-07', 7),
(108, '2024-05-08', 8),
(109, '2024-05-09', 9),
(110, '2024-05-10', 10),
(111, '2024-05-11', 11),
(112, '2024-05-12', 12),
(113, '2024-05-13', 13),
(114, '2024-05-14', 14),
(115, '2024-05-15', 15),
(116, '2024-05-16', 16),
(117, '2024-05-17', 17),
(118, '2024-05-18', 18),
(119, '2024-05-19', 19),
(120, '2024-05-20', 20),
(121, '2024-05-21', 21),
(122, '2024-05-22', 22),
(123, '2024-05-23', 23),
(124, '2024-05-24', 24),
(125, '2024-05-25', 25),
(126, '2024-05-26', 26),
(127, '2024-05-27', 27),
(128, '2024-05-28', 28),
(129, '2024-05-29', 29),
(130, '2024-05-30', 30),
(131, '2024-05-31', 31),
(132, '2024-06-01', 32),
(133, '2024-06-02', 33),
(134, '2024-06-03', 34),
(135, '2024-06-04', 35),
(136, '2024-06-05', 36),
(137, '2024-06-06', 37),
(138, '2024-06-07', 38),
(139, '2024-06-08', 39),
(140, '2024-06-09', 40),
(141, '2024-06-10', 41),
(142, '2024-06-11', 42),
(143, '2024-06-12', 43),
(144, '2024-06-13', 44),
(145, '2024-06-14', 45),
(146, '2024-06-15', 46),
(147, '2024-06-16', 47),
(148, '2024-06-17', 48),
(149, '2024-06-18', 49),
(150, '2024-06-19', 50);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 999.99),
(2, 'Smartphone', 599.99),
(3, 'Tablet', 299.99),
(4, 'Headphones', 99.99),
(5, 'Speaker', 149.99),
(6, 'Monitor', 299.99),
(7, 'Keyboard', 49.99),
(8, 'Mouse', 29.99),
(9, 'Printer', 199.99),
(10, 'Scanner', 149.99);

SELECT * FROM Orders;
SELECT * FROM products;