USE practice;

CREATE TABLE cat (
ID int UNIQUE AUTO_INCREMENT,
name varchar(255) NOT NULL,
Breed varchar(255) Default 'Unknown',
Age int NOT NULL,
Sex varchar(255) NOT NULL,
fav_toy varchar(255) NOT NULL Default 'Unknown'
);

ALTER TABLE cat ADD COLUMN Coloration varchar(255) NOT NULL;

UPDATE cat
SET Coloration = 'Black'
WHERE name = 'Whiskers';

UPDATE cat
SET Coloration = 'White'
WHERE name = 'Mittens';

UPDATE cat
SET Coloration = 'Gray'
WHERE name = 'Felix';

UPDATE cat
SET Coloration = 'Brown'
WHERE name = 'Luna';

UPDATE cat
SET Coloration = 'Black'
WHERE name = 'Oreo';

UPDATE cat
SET Coloration = 'Brown'
WHERE name = 'Bella';

UPDATE cat
SET Coloration = 'Brown'
WHERE name = 'Simba';

UPDATE cat
SET Coloration = 'Gray'
WHERE name = 'Smokey';

UPDATE cat
SET Coloration = 'White'
WHERE name = 'Cleo';

UPDATE cat
SET Coloration = 'Gray'
WHERE name = 'Max';


INSERT INTO cat (name, Breed, Age, Sex, fav_toy) VALUES
('Whiskers', 'Siamese', 3, 'Male', 'Feather toy'),
('Mittens', 'Maine Coon', 5, 'Female', 'Ball of yarn'),
('Felix', 'Tabby', 2, 'Male', 'Mouse toy'),
('Luna', 'Persian', 4, 'Female', 'String toy'),
('Oreo', 'Domestic Shorthair', 1, 'Male', 'Catnip mouse'),
('Bella', 'Ragdoll', 6, 'Female', 'Scratching post'),
('Simba', 'Bengal', 3, 'Male', 'Laser pointer'),
('Smokey', 'British Shorthair', 8, 'Male', 'Catnip ball'),
('Cleo', 'Sphynx', 2, 'Female', 'Blanket'),
('Max', 'Russian Blue', 4, 'Male', 'Fishing rod toy');

UPDATE cat
SET fav_toy = NULL
WHERE ID IN (4,5,9,10);
UPDATE cat
SET fav_toy = NULL
WHERE ID = 6;
UPDATE cat
SET fav_toy = 'Ball'
WHERE ID = 6;

SELECT * FROM cat;

SELECT * FROM cat WHERE age< 5;

SELECT ID, Name FROM cat WHERE breed = 'Ragdoll';

ALTER TABLE cat 
MODIFY COLUMN fav_toy varchar(255);

SELECT * FROM cat WHERE Breed LIKE 'R%' AND Fav_toy LIKE 'Ball%' AND Coloration LIKE '%m';
SELECT * FROM cat WHERE Breed LIKE 'R%' OR Fav_toy LIKE 'Ball%' OR Coloration LIKE '%m';

SELECT * FROM cat WHERE age >= 1 AND (breed = 'Ragdoll' OR breed = 'Abyssinian') AND fav_toy IS NOT NULL;

CREATE TABLE games (
id int UNIQUE AUTO_INCREMENT,
title Varchar(255),
Company Varchar(255),
type varchar(255),
productionYear int,
system varchar(255),
productionCost int,
revenue int,
rating float(1,1)
);

ALTER TABLE games
MODIFY rating float(2,1);

ALTER TABLE games
MODIFY revenue bigint;


INSERT INTO games (title, Company, type, productionYear, system, productionCost, revenue, rating) VALUES
('The Witcher 3: Wild Hunt', 'CD Projekt', 'RPG', 2015, 'PC', 80000000, 450000000, 9.3),
('Grand Theft Auto V', 'Rockstar Games', 'Action', 2013, 'PS4', 137000000, 1000000000, 9.6),
('The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Adventure', 2017, 'Switch', 135000000, 1050000000, 9.5),
('Red Dead Redemption 2', 'Rockstar Games', 'Action', 2018, 'Xbox One', 80000000, 725000000, 9.4),
('The Last of Us Part II', 'Naughty Dog', 'Action', 2020, 'PS4', 100000000, 450000000, 9.2),
('Cyberpunk 2077', 'CD Projekt', 'RPG', 2020, 'PC', 200000000, 560000000, 6.8),
('Persona 5', 'Atlus', 'RPG', 2016, 'PS4', 45000000, 250000000, 9.2),
('Fortnite', 'Epic Games', 'Battle Royale', 2017, 'PC', 100000000, 3500000000, 8.5),
('Call of Duty: Modern Warfare', 'Activision', 'Shooter', 2019, 'PS4', 300000000, 600000000, 8.8),
('Minecraft', 'Mojang Studios', 'Sandbox', 2011, 'PC', 24000000, 2500000000, 9.2),
('Among Us', 'InnerSloth', 'Social Deduction', 2018, 'Mobile', 500000, 50000000, 8.0),
('FIFA 21', 'EA Sports', 'Sports', 2020, 'PS5', 200000000, 900000000, 7.9),
('League of Legends', 'Riot Games', 'MOBA', 2009, 'PC', 120000000, 2500000000, 8.2),
('Pokemon Sword and Shield', 'Nintendo', 'RPG', 2019, 'Switch', 100000000, 1200000000, 8.0),
('Super Mario Odyssey', 'Nintendo', 'Platformer', 2017, 'Switch', 80000000, 750000000, 9.0),
('Apex Legends', 'Respawn Entertainment', 'Battle Royale', 2019, 'PC', 80000000, 450000000, 8.7),
('Halo Infinite', '343 Industries', 'Shooter', 2021, 'Xbox Series X', 500000000, 750000000, 8.9),
('Assassin\'s Creed Valhalla', 'Ubisoft', 'Action-Adventure', 2020, 'PS5', 200000000, 850000000, 8.3),
('Animal Crossing: New Horizons', 'Nintendo', 'Social Simulation', 2020, 'Switch', 80000000, 620000000, 9.0),
('God of War', 'Santa Monica Studio', 'Action-Adventure', 2018, 'PS4', 150000000, 450000000, 9.4),
('Overwatch', 'Blizzard Entertainment', 'Hero Shooter', 2016, 'PC', 150000000, 1300000000, 8.0),
('Genshin Impact', 'miHoYo', 'Action RPG', 2020, 'Mobile', 100000000, 1000000000, 8.3),
('Valorant', 'Riot Games', 'Tactical Shooter', 2020, 'PC', 100000000, 700000000, 8.0),
('The Elder Scrolls V: Skyrim', 'Bethesda Game Studios', 'Action RPG', 2011, 'PC', 85000000, 450000000, 9.3),
('Rocket League', 'Psyonix', 'Sports', 2015, 'PC', 20000000, 500000000, 8.1);


SELECT * FROM games ORDER BY productionCost ASC, rating DESC;

SELECT title, productionCost FROM games
WHERE productionYear BETWEEN 2010 AND 2015 AND rating > 7
ORDER BY productionCost ASC;

SELECT productionYear, COUNT(title) AS count, AVG(productionCost) AS Avg_cost, AVG(revenue) AS Avg_revenue FROM games
GROUP BY productionYear;
SELECT ProductionYear, count(title) as Count FROM games GROUP BY ProductionYear;

SELECT company, type, Count(title) as NoOfGames FROM games WHERE revenue>productionCost GROUP BY company, type;

SELECT company, count(title) AS NoOfGames, Avg(ProductionCost) as Cost FROM games GROUP BY Company HAVING NoOfGames>1;

 
 CREATE TABLE NEWemployee (
 id int UNIQUE AUTO_INCREMENT,
 firstName varchar(255),
 lastName varchar(255),
 salary int,
 managerID int UNIQUE
 );
 
 ALTER table NEWemployee
 DROP INDEX managerID;
 
INSERT INTO NEWemployee (firstName, lastName, salary, managerID) VALUES
('John', 'Doe', 60000, 2),
('Alice', 'Smith', 55000, 1),
('Bob', 'Johnson', 62000, 1),
('Emily', 'Brown', 58000, 2),
('Michael', 'Davis', 63000, 3),
('Sarah', 'Wilson', 57000, 2),
('David', 'Martinez', 59000, 3),
('Jennifer', 'Taylor', 60000, 1),
('Matthew', 'Anderson', 62000, 1),
('Jessica', 'Thomas', 59000, 2),
('Christopher', 'Hernandez', 61000, 3),
('Samantha', 'Moore', 56000, 2),
('James', 'Clark', 60000, 1),
('Ashley', 'Lopez', 63000, 1),
('Daniel', 'Lewis', 59000, 2),
('Amanda', 'Hill', 62000, 3),
('Andrew', 'Green', 58000, 2),
('Elizabeth', 'Adams', 60000, 1),
('Justin', 'Baker', 64000, 1),
('Olivia', 'Garcia', 59000, 2),
('Ryan', 'Scott', 61000, 3),
('Lauren', 'Rivera', 57000, 2),
('Kevin', 'King', 60000, 1),
('Stephanie', 'Perez', 63000, 1),
('Brandon', 'Wright', 59000, 2);

SELECT * FROM newemployee;

SELECT * FROM NEWemployee;

CREATE TABLE salgrade (
grade varchar(255) UNIQUE,
lowerlimit int,
upperlimit int
);

INSERT INTO salgrade (grade, lowerlimit, upperlimit) VALUES
('Grade 1', 0, 50000),
('Grade 2', 50001, 52000),
('Grade 3', 52001, 55000),
('Grade 4', 55001, 60000),
('Grade 5', 60001, 65000);

SELECT * FROM salgrade;

CREATE TABLE benefits (
salaryReq int,
benefitName varchar(255)
);

INSERT INTO benefits (salaryReq, benefitName) VALUES
(50000, 'Health Insurance'),
(52000, 'Retirement Plan'),
(55000, 'Paid Time Off'),
(60000, 'Flexible Spending Account'),
(65000, 'Company Stock Options');

SELECT * FROM benefits;

SELECT n.firstName, n.LastName, n.Salary, s.grade
FROM newemployee n, salgrade s 
WHERE salary BETWEEN lowerlimit AND upperlimit
AND
grade BETWEEN 'Grade 3' AND 'Grade 5';

SELECT firstname, lastname , benefits.benefitname
FROM newemployee
JOIN benefits
WHERE newemployee.salary >= benefits.salaryreq AND newemployee.id=30;

