-- Display the last names, first names and salaries of employees
-- (The query for joining these tables without a join keyword)
SELECT LastName, FirstName, Salary 
FROM Employee, Post
WHERE Post.Name = Employee.PostName

-- Display the last names, first names, salaries of employees and names of departments
SELECT LastName, FirstName, Salary, Department.Name 
FROM Employee, Post, Department
WHERE Post.Name = Employee.PostName
AND Department.Id = Employee.DepartmentId


-- Display the last names, first names and salaries of employees
-- (The query for joining these tables with a join keyword)
SELECT LastName, FirstName, Salary 
FROM Employee JOIN Post 
ON  Post.Name = Employee.PostName

-- Display the last names, first names, salaries of employees and names of departments
SELECT LastName, FirstName, Salary, Department.Name 
FROM Employee JOIN Post ON Post.Name = Employee.PostName
JOIN Department ON  Department.Id = Employee.DepartmentId

-- Display the last names and first names of employees
-- And the first names of their children.
-- If the employee doesn't have children 
-- then the field have to be null
SELECT Employee.LastName, Employee.FirstName, Child.FirstName AS Child_Name 
FROM Employee 
RIGHT OUTER JOIN Child 
ON Child.PersonnelNumberParent = Employee.PersonnelNumber

