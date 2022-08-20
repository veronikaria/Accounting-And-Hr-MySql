USE accountingdb

-- Display all names of accounting employees that are not repeated
SELECT DISTINCT FirstName FROM Employee

-- Display all years of previous experience that are not repeated
SELECT DISTINCT PreviousExperience FROM Employee

-- Display all names of post that are not repeated
SELECT DISTINCT PostName FROM Employee

-- Display all employees whose year of bith is 1989, 1984, 1987, 1986 or 1999
SELECT * FROM Employee 
WHERE YEAR(Birthdate) IN (1989, 1984, 1987, 1986, 1999)

-- Display all employees who have children
SELECT DISTINCT * FROM Employee 
WHERE PersonnelNumber IN 
(
	SELECT PersonnelNumberParent FROM Child
)

-- Display all employees who don't have children
SELECT * FROM Employee 
WHERE PersonnelNumber NOT IN 
(
	SELECT PersonnelNumberParent FROM Child
)

-- Display all employees whose year of bith are not in this list: 1989, 1984, 1987, 1986, 1999
SELECT * FROM Employee 
WHERE YEAR(Birthdate) NOT IN (1989, 1984, 1987, 1986, 1999)

-- Display all employees whose employment date is specified (that is, start date is not null)
SELECT * FROM Employee
WHERE Startdate IS NOT NULL

-- Display all employees whose year of employment is between 2000 and 2015
SELECT * FROM Employee
WHERE YEAR(Startdate) BETWEEN 2000 AND 2015

-- Display all posts with salary between 11000 and 14000
SELECT * FROM Post
WHERE Salary BETWEEN  11000 AND 14000 

-- Display all employees whose last name contains the letter 'a'
SELECT * FROM Employee
WHERE LastName LIKE '%а%'

-- Display all employees whose last name starts with the letter 'к'
SELECT * FROM Employee
WHERE LastName LIKE 'к%'

-- Display all children whose last name contains the letter 'в' on second or third position
SELECT * FROM Child
WHERE LastName LIKE '_в%' OR LastName LIKE '__в%'

-- Display all employees whose middle name starts with the letter 'м' and ends with the letter 'ч'
SELECT * FROM Employee
WHERE Middlename LIKE 'м%ч'

-- Dosplay all first names of employees whose name starts with the letter 'a' or 'i' or 'м'
SELECT Firstname  FROM Employee
WHERE Firstname REGEXP '^(а|і|м)'

-- Dispaly all last names of employees whose last name starts with the letter 'к'
SELECT Lastname FROM Employee
WHERE Lastname REGEXP '^к'

-- Display all last names of employees whose last name contains the letter 'о' or 'т' or 'л' or 'д'
SELECT Lastname FROM Employee
WHERE Lastname REGEXP '[отлд]'

-- Display all middle names of employees whose middle name contains a letter in the range from 'a' to 'м'
SELECT Middlename FROM Employee
WHERE Middlename REGEXP '^[а-м]'

-- Display all middle names of employees whose middle name consists of 10 letters only
SELECT Middlename FROM Employee
WHERE Middlename REGEXP '^..........$'

-- Display all employees whose employment date is not specified (that is, start date is null)
SELECT * FROM Employee
WHERE Startdate IS NULL

-- Display all employees in the order from oldest to youngest 
SELECT * FROM Employee
ORDER BY Birthdate ASC

-- Display all employees and in addition sort by the date of employment in descending order
SELECT * FROM Employee
ORDER BY Startdate DESC

-- Display all full names of employees and in addition sort by last name and first name in ascending order and sort by middle name in descending order 
SELECT Lastname, Firstname, Middlename FROM Employee
ORDER BY Lastname ASC, Firstname ASC, Middlename DESC

-- Display the first three oldest employees 
SELECT * FROM Employee
ORDER BY Birthdate ASC  LIMIT 3

-- Employee who was hired last 
SELECT * FROM Employee
ORDER BY Startdate DESC  LIMIT 1
