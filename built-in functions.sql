show databases;

use employee;

CREATE TABLE Functions (
name varchar(255) NOT NULL,
numbers int NOT NULL,
Dates date NOT NULL
);

SHOW TABLES;

INSERT INTO Functions
VALUES ('Pradeep Madhavaraj', 23, '2002-04-13'),
('Madhavaraj', 54, '1970-05-13'),
('Sujitha Madhavaraj', 46, '1978-04-13');

SELECT * FROM Functions;

#STRING FUNCTIONS
SELECT ASCII('A');

SELECT name, LENGTH(NAME) FROM Functions;

SELECT CONCAT('Pradeep',' ', 'Madhavaraj');

SELECT CONCAT_WS(" ","Pradeep",'Madhavaraj');

SELECT FIELD('a','c','d','a','b','v');

SELECT FIND_IN_SET("i","a,b,c,d,e,f,g,h,i");

SELECT FORMAT('24567.8765',2);

SELECT INSERT('Pradeep ',8,1,' Madhavaraj');

SELECT LOCATE('Madhavaraj','Sujitha Madhavaraj',1), POSITION('Madhavaraj' IN 'Sujitha Madhavaraj'), INSTR("Sujitha Madhavaraj","Madhavaraj");

SELECT LCASE('SUJITHA MADHAVARAJ');
SELECT LOWER('SUJITHA MADHAVARAJ');

SELECT UCASE('sujitha madhavaraj');
SELECT UPPER('sujitha madhavaraj');

SELECT LEFT('Pradeep',5);
SELECT RIGHT('Pradeep',5);

SELECT 'PRADEEP', LPAD('PRADEEP',10,'*'), RPAD('PRADEEP',10,'*');

SELECT '   P    ', LTRIM('     P'), RTRIM('P     '), TRIM('   P    ');

SELECT 'PRADEEP', MID('PRADEEP',4,4), SUBSTR('PRADEEP',4,4), SUBSTRING('PRADEEP',4,4);

SELECT REPEAT('Pradeep ',3);

SELECT 'pRADEEp', REPLACE('pRADEEp','p','P');

SELECT 'Pradeep', REVERSE('Pradeep');

SELECT  SPACE(2);

SELECT STRCMP('a','A'), STRCMP('A','B'), STRCMP('B','A');

SELECT SUBSTRING_INDEX('P-R-A-D-E-E-P-','-',7);

#Number Function

SELECT ABS(-10), ABS(10);

SELECT AVG(numbers) FROM functions;

SELECT TRUNCATE(40.825364,2), TRUNCATE(42.3,0), CEIL(42.3), CEILING(42.3), 10 DIV 2, FLOOR(42.9), MOD(5,2), 5 MOD 2, 5 % 2, POW(3,2), POWER(3,3);

SELECT GREATEST(1,2,3,4,5,6,7,8,9,10), LEAST(1,2,3,4,5,6,7,8,9,10);

SELECT RAND();

SELECT ROUND(42.25422,3), ROUND(42.25422,2), ROUND(42.25422,1), ROUND(42.75422,0);

SELECT SIGN(-244), SIGN(244);

SELECT SQRT(4), SQRT(3);

#Date Functions

SELECT ADDDATE('2002-04-13',19);

SELECT current_date(), curdate(), curtime(), current_time(), current_timestamp(), now(), localtime(), sysdate(), localtimestamp();




