USE ResourcesDepartUniversity

SELECT l.LastName, l.FirstName, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l, Department d
WHERE l.DepartmentCode = d.Code


SELECT lo.Id, lo.Type, l.LastName, l.FirstName, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l, Department d, Loading lo
WHERE l.DepartmentCode = d.Code
AND lo.LecturerPersonnelNumber = l.PersonnelNumber
ORDER BY l.LastName, l.FirstName



SELECT l.LastName, l.Birthdate, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l JOIN  Department d
ON l.DepartmentCode = d.Code
WHERE d.Code IN ('ІВПП', 'ІПІ')



SELECT lo.Id, lo.Type, l.LastName, l.FirstName, 
d.Code AS department_code, 
d.Name AS department_name 
FROM Lecturer l 
INNER JOIN Department d 
ON l.DepartmentCode = d.Code
INNER JOIN Loading lo 
ON lo.LecturerPersonnelNumber = l.PersonnelNumber 
ORDER BY l.LastName, l.FirstName



SELECT lo.Id, lo.Type, l.LastName, l.FirstName
FROM Lecturer l 
LEFT OUTER JOIN Loading lo 
ON lo.LecturerPersonnelNumber = l.PersonnelNumber 
ORDER BY Id


SELECT lo.Id, lo.Type, l.LastName, l.FirstName
FROM Lecturer l 
RIGHT OUTER JOIN Loading lo 
ON lo.LecturerPersonnelNumber = l.PersonnelNumber 
ORDER BY Id


