USE employee;

Show tables;

SELECT * FROM emp_table;

CREATE VIEW emp_view
AS
SELECT * FROM emp_table;

SELECT * FROM emp_view;

CREATE OR REPLACE VIEW emp_view AS
SELECT * FROM emp_table
WHERE Salary > 1000000;

SELECT * FROM emp_view;

CREATE VIEW emp_manager_view
AS
SELECT * FROM emp_table
WHERE JobDesc = 'MANAGER';

SELECT * FROM emp_manager_view;

CREATE OR REPLACE VIEW one_emp AS
SELECT * FROM Emp_table 
WHERE EMP_ID = 1;

SELECT * FROM one_emp;

DROP VIEW one_emp;

SHOW FULL TABLES IN employee WHERE Table_type = 'VIEW';


