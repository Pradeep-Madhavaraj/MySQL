USE employee;

-- mistaken one so will de deleted next
DELIMITER //
CREATE FUNCTION helloWorld ( str1 VARCHAR(255), str2 VARCHAR(255) )
RETURNS VARCHAR(255)
BEGIN
DECLARE str3 VARCHAR(255);
SET str3 = str1 + " " + str2;
RETURN str3;
END//
DELIMITER ;

-- DROPPING A FUNCTION
DROP FUNCTION helloworld;

-- Creating a new one 
DELIMITER //
CREATE FUNCTION helloWorld ( str1 VARCHAR(255), str2 VARCHAR(255) )
RETURNS VARCHAR(255)
BEGIN
DECLARE str3 VARCHAR(255);
SET str3 = CONCAT(str1, str2);
RETURN str3;
END//
DELIMITER ;


DELIMITER //
CREATE FUNCTION concatenate_strings(str1 VARCHAR(255), str2 VARCHAR(255))
RETURNS VARCHAR(510)
BEGIN
    DECLARE result VARCHAR(510);
    SET result = CONCAT(str1, str2);
    RETURN result;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION get_average_salary() RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE avg_salary DECIMAL(10, 2);
    SELECT AVG(salary) INTO avg_salary FROM emp_table;
    RETURN avg_salary;
END //
DELIMITER ;

SELECT get_average_salary(); -- This will return the average salary from the employees table

SELECT helloWorld ('Hello',' world'); -- will return hello world

SELECT concatenate_strings('Hello, ', 'world!'); -- This will return 'Hello, world!'
