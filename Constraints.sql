CREATE DATABASE Employee;
USE Employee;
CREATE TABLE Emp_table (
EMP_id int AUTO_INCREMENT PRIMARY KEY,
E_name varchar(255) NOT NULL,
JobDesc varchar(255) DEFAULT "Unassiged",
Salary int,
CONSTRAINT sal_constraint CHECK(Salary>1000000)
);

INSERT INTO Emp_table (E_name,JobDesc,Salary)
VALUES 
('Ram','ADMIN',1000000),
('Harini',"MANAGER",2500000),
('George','SALES',2000000),
('Ramya','SALES',1300000),
('Meena','HR',2000000),
('Ashok','MANAGER',3000000),
('Abdul','HR',2000000),
('Ramya','ENGINEER',1000000),
('RAGU','CEO',8000000),
('Aravind','MANAGER',2800000);

CREATE TABLE Branch (
Branch_ID int PRIMARY KEY,
Location varchar(255) DEFAULT 'Unassigned',
ADDRESS varchar(255) UNIQUE,
Manager_ID int,
CONSTRAINT Manager_Foriegn FOREIGN KEY(Manager_ID) REFERENCES EMP_table(Emp_ID));

ALTER TABLE Branch
MODIFY Branch_ID int AUTO_INCREMENT;

INSERT INTO Branch (Location,Address,Manager_ID)
VALUES 
('Chennai','16, ABC Road',6),
('Mumbai','17 20th Block',2),
('Kolkatta','25, XYZ Street',10);

ALTER TABLE EMP_table
ADD COLUMN Branch_ID int;

ALTER TABLE Emp_table
ADD FOREIGN KEY(Branch_ID) REFERENCES Branch(Branch_ID);

UPDATE EMP_table
SET Branch_ID = 1
WHERE JobDesc= 'MANAGER' OR JobDesc = 'CEO';

UPDATE EMP_table
SET Branch_ID = 2
WHERE JobDesc = 'ADMIN' OR JobDesc = 'HR';

UPDATE EMP_table
SET Branch_ID = 3
WHERE JobDesc = 'ENGINEER' OR JobDesc = 'SALES';

CREATE INDEX emp_index ON EMP_table (E_name);

SELECT * FROM Branch;
SELECT * FROM Emp_table;

DESCRIBE EMP_table;
DESCRIBE Branch;