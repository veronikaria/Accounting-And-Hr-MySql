USE ResourcesDepartUniversity

-- 1. Display the average number of lectures, practical classes and seminars for all disciplines
SELECT AVG(NumberLectures) as avg_lect, 
AVG(NumberPractical) AS avg_pract, 
AVG(NumberSeminars) AS avg_sem 
FROM Discipline

-- 2. Display the total number of lectures, practical classes and seminars for all disciplines
SELECT SUM(NumberLectures) as sum_lect, 
SUM(NumberPractical) AS sum_pract, 
SUM(NumberSeminars) AS sum_sem 
FROM Discipline

-- 3. Show a minimum number of lectures, practical classes and seminars for all disciplines
SELECT MIN(NumberLectures) as min_lect, 
MIN(NumberPractical) AS min_pract, 
MIN(NumberSeminars) AS min_sem 
FROM Discipline

-- 4. Show the maximum number of lectures, practical classes and seminars for all disciplines
SELECT MAX(NumberLectures) as max_lect, 
MAX(NumberPractical) AS max_pract, 
MAX(NumberSeminars) AS max_sem 
FROM Discipline

-- 5. Display the number of disciplines
SELECT COUNT(*) cnt_discipline
FROM Discipline

-- 6. Show the types of classes from the Loading table and their number
SELECT Type, COUNT(*) cnt FROM Loading
GROUP BY Type

-- 7. Show the types of classes from the Loading table, and their number, while the number should not be less than 5
SELECT Type, COUNT(*) cnt FROM Loading
GROUP BY Type
HAVING cnt >= 5

-- 8. Show the last name of the teacher, as well as the identifier and type of classes
SELECT Id, Type,
(SELECT Lastname 
FROM Lecturer 
WHERE Lecturer.PersonnelNumber=Loading.LecturerPersonnelNumber)
AS Lecturer FROM Loading

-- 9. Display information about teachers from the Lecturer table, which are in the records of the Load table
SELECT * FROM Lecturer
WHERE PersonnelNumber IN 
(SELECT LecturerPersonnelNumber FROM Loading) 

-- 10. Add a new row to the Loading table, while taking the personal number from the teacher 'Guryk Yosyp' from the Lecturer table
INSERT INTO Loading
(Id, LecturerPersonnelNumber, DisciplineId, Type)
VALUES
(16, (SELECT PersonnelNumber 
FROM Lecturer 
WHERE Lastname='Гурик' 
AND Firstname='Йосип'), 
1, 'Лекція')

-- The result in the table Loading
SELECT * FROM Loading
WHERE Id=16

-- Show personnel number for the teacher 'Guryk Yosyp'
SELECT PersonnelNumber 
FROM Lecturer 
WHERE Lastname='Гурик' 
AND Firstname='Йосип'

-- 11. For the discipline with identifier 5, change the value of practical classes to the maximum + 3
UPDATE Discipline 
SET NumberPractical = 
(SELECT t.max+3 FROM 
(SELECT MAX(NumberPractical) AS max FROM Discipline) 
t) WHERE Id = 5

-- The result in the table Discipline
SELECT * FROM Discipline
WHERE Id = 5

-- 12. Delete all records from the table Discipline where the number of practical classes is minimal
DELETE FROM Discipline
WHERE NumberPractical =(
SELECT t.min 
FROM (SELECT MIN(NumberPractical) AS min 
FROM Discipline) AS t)

-- The result in the table Discipline
SELECT * FROM Discipline

-- 13. Display all information about teachers recorded in the Loading table
SELECT * FROM Lecturer
WHERE EXISTS (SELECT * FROM Loading 
WHERE LecturerPersonnelNumber = PersonnelNumber)

-- 14. Display all information about teachers who are not recorded in the Loading table
SELECT * FROM Lecturer
WHERE NOT EXISTS (SELECT * FROM Loading 
WHERE LecturerPersonnelNumber = PersonnelNumber)

