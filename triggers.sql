USE employee;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE AuditTrail (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    ActionType VARCHAR(20),
    ActionDateTime DATETIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

DELIMITER //

CREATE TRIGGER EmployeeAuditTrigger
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO AuditTrail (EmployeeID, ActionType, ActionDateTime)
    VALUES (NEW.EmployeeID, 'INSERT', NOW());
END //

CREATE TRIGGER EmployeeAuditUpdateTrigger
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO AuditTrail (EmployeeID, ActionType, ActionDateTime)
    VALUES (NEW.EmployeeID, 'UPDATE', NOW());
END //

CREATE TRIGGER EmployeeAuditDeleteTrigger
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO AuditTrail (EmployeeID, ActionType, ActionDateTime)
    VALUES (OLD.EmployeeID, 'DELETE', NOW());
END //

DELIMITER ;

-- INSERTING VALUES 
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES
    (1, 'John', 'Doe', 50000.00),
    (2, 'Jane', 'Smith', 60000.00),
    (3, 'Michael', 'Johnson', 70000.00);

-- UPDATING VALUE
UPDATE Employees
SET Salary = 55000.00
WHERE EmployeeID = 1;

-- DELETEING VALUE 
DELETE FROM Employees
WHERE EmployeeID = 1;



SELECT * FROM Employees;
SELECT * FROM AuditTrail;



