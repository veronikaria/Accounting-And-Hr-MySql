USE accountingdb

-- Display the average salary of posts
SELECT AVG(Salary) AS avg_salary FROM Post

-- Display the sum of all years of experience in previous jobs of employees
SELECT SUM(PreviousExperience) sum_experience FROM Employee

-- Display the minimum salary for posts
SELECT MIN(Salary) AS min_salary FROM Post

-- Display the maximum salary for posts 
SELECT MAX(Salary) AS max_salary FROM Post

-- Display all employees who has a minimum salary (minimum wage workers)
SELECT * FROM Employee WHERE PostName = (SELECT Name FROM
(SELECT MIN(Salary) min_salary, Name FROM Post) t)

-- Display the number of all employees
SELECT COUNT(*) cnt_emp FROM Employee

-- Display the number of all posts
SELECT COUNT(*) cnt_post FROM Post

-- Display a year and a number of employees for each year
-- while a number of employees must be greater than or equal to 2
SELECT YEAR(Startdate), COUNT(*) cnt_year 
FROM Employee
GROUP BY YEAR(Startdate)
HAVING cnt_year>=2

-- Display last names, first names, middle names and salaries of all employees
-- using correlated query
SELECT Lastname, Firstname, Middlename,
(SELECT Salary FROM Post WHERE Post.Name=Employee.PostName)
AS tab FROM Employee

-- Display all job titles where salary is higher than the average
SELECT Name FROM Post 
WHERE Salary > (SELECT AVG(Salary) FROM Post)

-- Display all employees who have children
SELECT * FROM Employee
WHERE PersonnelNumber IN (SELECT PersonnelNumberParent FROM CHILD)

-- Add a new post 'Головний бухгалтер' and salary which is the same as for job with title 'Бухгалтер банку'
INSERT INTO Post
(Name, Salary)
SELECT 'Головний бухгалтер' AS Name, (SELECT Salary FROM Post WHERE Name='Бухгалтер банку') as Salary

-- Change the salary of the 'Головний бухгалтер' to one that will be 3000UAH higher
-- than the salary of the 'Бухгалтер з обліку ПДВ'
UPDATE Post 
SET Salary = (SELECT t.s+3000 FROM (SELECT Salary AS s FROM Post WHERE Name='Бухгалтер з обліку ПДВ') t)
WHERE Name='Головний бухгалтер'   

-- Delete the post of employee who has the maximum salary  
DELETE FROM Post
WHERE Salary =(SELECT t.s FROM (SELECT MAX(Salary) AS s FROM Post) AS t)

-- Display all posts which have employees
SELECT * FROM Post
WHERE EXISTS (SELECT * FROM Employee WHERE PostName = Name)


