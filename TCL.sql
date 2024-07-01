USE practice;

SELECT * FROM employee;

SET AUTOCOMMIT = 0;

INSERT INTO employee (FirstName,LastName,Department,Position,Salary,HireDate)
Values ('Pradeep','Madhavaraj','IT','Developher',800000,'2024-07-01'),('Preethi','Madhavaraj','IT','Tester',600000,'2022-07-01');

COMMIT;
rollback;

START TRANSACTION;

SAVEPOINT deletion;
DELETE FROM Employee Where FirstName = 'Pradeep' OR FirstName = 'Preethi';
COMMIT;
ROLLBACK TO SAVEPOINT deletion;

SET AUTOCOMMIT = 1;