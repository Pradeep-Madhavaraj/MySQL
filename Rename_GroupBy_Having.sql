USE Practice;
SELECT * FROM employee;

#Renaming TABLE NAME
RENAME TABLE employee TO `Employee_DB`;
ALTER TABLE Employee_DB RENAME TO employee;

#Rename COLUMN name
ALTER TABLE employee CHANGE EmployeeID Employee_ID int NOT NULL AUTO_INCREMENT;
ALTER TABLE employee CHANGE Employee_ID EmployeeID int NOT NULL AUTO_INCREMENT;

#GROUP BY
SELECT Count(EmployeeID) AS Employees, Position FROM employee
GROUP BY Position;
SELECT Count(EmployeeID) AS Employees, Department FROM employee
GROUP BY Department;

#HAVING
SELECT Count(EmployeeID) AS Employees, Department FROM employee
GROUP BY Department
HAVING Count(EmployeeID)>3;

SELECT Count(EmployeeID) AS Employees, Position FROM employee
GROUP BY Position
HAVING Count(EmployeeID)>=3;

#SEQUENCE -> SELECT - FROM - WHERE - GROUP BY - HAVING - ORDER BY
SELECT Count(EmployeeID) AS Employees, Position FROM employee
WHERE salary > 50000
GROUP BY Position
HAVING Count(EmployeeID)=2
ORDER BY Position DESC;

SELECT Count(EmployeeID) AS Employees, Position FROM employee
WHERE salary > 50000
GROUP BY Position
HAVING Position='System Analyst' OR Position = 'Salesperson'
ORDER BY Position DESC;

DESCRIBE Employee;