USE employee;


DELIMITER $$
CREATE PROCEDURE alldatas ()
BEGIN
SELECT * FROM emp_table;
END$$

CREATE PROCEDURE getEmployeeByJobDesc(IN position VARCHAR(255))
BEGIN
SELECT * FROM emp_table
WHERE JobDesc = position;
END$$

CREATE PROCEDURE getEmployeeBySalary ( IN sal INT)
BEGIN
SELECT * FROM emp_table WHERE Salary = sal;
END$$
DELIMITER ;

-- DELETING a STORED PROCEDURE
DROP PROCEDURE getEmployeeBySalary;

DELIMITER //
CREATE PROCEDURE getEmployeeBySalary (IN sal INT)
BEGIN
SELECT * FROM emp_table WHERE Salary >= sal;
END//
DELIMITER ;



CALL alldatas();

CALL getEmployeeByJobDesc('MANAGER');
CALL getEmployeeByJobDesc('SALES');
CALL getEmployeeByJobDesc('HR');
CALL getEmployeeByJobDesc('ENGINEER');

CALL getEmployeeBySalary(1000000);
CALL getEmployeeBySalary(2000000);
CALL getEmployeeBySalary(3000000);

-- getting stored procedures
SHOW PROCEDURE STATUS WHERE Db = 'employee';
