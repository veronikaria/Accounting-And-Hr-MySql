USE ResourcesDepartUniversity

-- Display surnames, names of teachers, department code and name of the faculty
SELECT l.LastName, l.FirstName, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l, Department d
WHERE l.DepartmentCode = d.Code

-- Display class identifier, type, last name, teacher's name, department code and faculty name
-- while sorting the sample by teacher's last name and first name
SELECT lo.Id, lo.Type, l.LastName, l.FirstName, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l, Department d, Loading lo
WHERE l.DepartmentCode = d.Code
AND lo.LecturerPersonnelNumber = l.PersonnelNumber
ORDER BY l.LastName, l.FirstName

-- Display the teacher's last name, date of birth, the department code and the name of the faculty
-- while the department code must be either 'ІВПП' or 'ІПІ'
SELECT l.LastName, l.Birthdate, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l JOIN  Department d
ON l.DepartmentCode = d.Code
WHERE d.Code IN ('ІВПП', 'ІПІ')

-- Display class identifier, type, last name, teacher's name, department code and faculty name 
-- while sorting the sample by teacher's last name and first name
SELECT lo.Id, lo.Type, l.LastName, l.FirstName, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l 
INNER JOIN Department d 
ON l.DepartmentCode = d.Code
INNER JOIN Loading lo 
ON lo.LecturerPersonnelNumber = l.PersonnelNumber 
ORDER BY l.LastName, l.FirstName

-- Display the identifier, class type, last name and first name of the teacher. 
-- And if there is no record for a certain teacher in the Loading table 
-- then leave the fields from this table NULL. 
-- And sort the sample by identifier
SELECT lo.Id, lo.Type, l.LastName, l.FirstName
FROM Lecturer l 
LEFT OUTER JOIN Loading lo 
ON lo.LecturerPersonnelNumber = l.PersonnelNumber 
ORDER BY Id

-- Display the identifier, class type, last name and first name of the teacher.
-- And if there is no entry for a certain teacher in the Load table
-- then do not display data about him. 
-- And sort the sample by identifier
SELECT lo.Id, lo.Type, l.LastName, l.FirstName
FROM Lecturer l 
RIGHT OUTER JOIN Loading lo 
ON lo.LecturerPersonnelNumber = l.PersonnelNumber 
ORDER BY Id


