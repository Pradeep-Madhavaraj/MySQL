CREATE DATABASE Practice;

USE Practice;

CREATE TABLE Employee(
EmployeeID int AUTO_INCREMENT,
FirstName varchar(255) NOT NULL,
LastName varchar(255) NOT NULL,
Department varchar(255) DEFAULT 'Unassigned',
Position varchar(255) DEFAULT 'Unassigned',
Salary double(10,2),
HireDate date NOT NULL,
CONSTRAINT employee_key PRIMARY KEY (EmployeeID),
CHECK (Salary>50000)
);

INSERT INTO Employee (FirstName,LastName,Department,Position,Salary,HireDate)
Values
('John','Doe','HR','Manager',60000,'2020-05-15'),
('Jane','Smith','IT','Developer',75000,'2019-08-22'),
('Michael','Johnson','Sales','Salesperson',55000,'2021-02-10'),
('Emily','Brown','Finance','Accountant',62000,'2018-11-30'),
('David','Lee','IT','System Analyst',70000,'2020-09-14'),
('Sarah','Williams','HR','Recruiter',55000,'2017-06-05'),
('Robert','Taylor','Finance','Financial Analyst',68000,'2019-04-18'),
('Megan','Anderson','Sales','Manager',72000,'2016-10-12'),
('William','Martinez','IT','Developer',78000,'2019-12-29'),
('Olivia','Harris','Finance','Accountant',60000,'2022-03-05'),
('James','Moore','Sales','Salesperson',53000,'2020-01-20'),
('Ava','Taylor','HR','Recruiter',56000,'2017-09-28'),
('Joseph','White','IT','System Analyst',71000,'2018-05-17'),
('Sophia','Thomas','Finance','Financial Analyst',70000,'2019-07-02'),
('Daniel','Davis','IT','Manager',80000,'2016-08-10');

SELECT * FROM Employee;

SELECT FirstName,LastName FROM Employee WHERE Salary > 70000;
SELECT * FROM Employee WHERE Salary > 70000;

SELECT * FROM Employee WHERE FirstName LIKE 'J%';

SELECT * FROM Employee WHERE LastName LIKE '%son%';

SELECT * FROM Employee WHERE Department = 'Finance' AND Salary BETWEEN 60000 AND 70000;

SELECT * FROM Employee WHERE Department = 'IT' OR Department = 'HR';

SELECT * FROM Employee WHERE HireDate BETWEEN '2019-01-01' AND '2020-12-31';

SELECT * FROM Employee WHERE Department = 'Sales' AND Salary < 60000;

SELECT * FROM Employee WHERE FirstName = 'Michael' OR LastName = 'Smith';

SELECT * FROM Employee ORDER BY Salary DESC;

SELECT * FROM Employee WHERE Department = 'IT' AND LastName LIKE 'T%';

SELECT * FROM Employee WHERE Salary NOT BETWEEN 60000 AND 70000;

SELECT * FROM Employee WHERE LastName = 'Taylor' OR LastName = 'Brown';

SELECT * FROM Employee WHERE Department <> 'HR';

SELECT * FROM Employee WHERE Department = 'IT' OR Salary > 70000;

SELECT * FROM Employee WHERE Department = 'Sales' AND Salary < 55000;

SELECT * FROM Employee WHERE HireDate < '2018-01-01';

SELECT * FROM Employee WHERE LastName NOT LIKE "%a%";

SELECT * FROM Employee WHERE FirstName > 'Megan';

SELECT * FROM Employee ORDER BY HireDate DESC;


