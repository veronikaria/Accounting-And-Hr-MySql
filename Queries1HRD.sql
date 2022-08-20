USE ResourcesDepartUniversity

SELECT AVG(NumberLectures) as avg_lect, 
AVG(NumberPractical) AS avg_pract, 
AVG(NumberSeminars) AS avg_sem 
FROM Discipline


SELECT SUM(NumberLectures) as sum_lect, 
SUM(NumberPractical) AS sum_pract, 
SUM(NumberSeminars) AS sum_sem 
FROM Discipline


SELECT MIN(NumberLectures) as min_lect, 
MIN(NumberPractical) AS min_pract, 
MIN(NumberSeminars) AS min_sem 
FROM Discipline


SELECT MAX(NumberLectures) as max_lect, 
MAX(NumberPractical) AS max_pract, 
MAX(NumberSeminars) AS max_sem 
FROM Discipline


SELECT COUNT(*) cnt_discipline
FROM Discipline


SELECT Type, COUNT(*) cnt FROM Loading
GROUP BY Type

SELECT Type, COUNT(*) cnt FROM Loading
GROUP BY Type
HAVING cnt >= 5


SELECT Id, Type,
(SELECT Lastname 
FROM Lecturer 
WHERE Lecturer.PersonnelNumber=Loading.LecturerPersonnelNumber)
AS Lecturer FROM Loading


SELECT * FROM Lecturer
WHERE PersonnelNumber IN 
(SELECT LecturerPersonnelNumber FROM Loading) 

INSERT INTO Loading
(Id, LecturerPersonnelNumber, DisciplineId, Type)
VALUES
(16, (SELECT PersonnelNumber 
FROM Lecturer 
WHERE Lastname='Гурик' 
AND Firstname='Йосип'), 
1, 'Лекція')

SELECT * FROM Loading
WHERE Id=16

SELECT PersonnelNumber 
FROM Lecturer 
WHERE Lastname='Гурик' 
AND Firstname='Йосип'


UPDATE Discipline 
SET NumberPractical = 
(SELECT t.max+3 FROM 
(SELECT MAX(NumberPractical) AS max FROM Discipline) 
t) WHERE Id = 5

SELECT * FROM Discipline
WHERE Id = 5


DELETE FROM Discipline
WHERE NumberPractical =(
SELECT t.min 
FROM (SELECT MIN(NumberPractical) AS min 
FROM Discipline) AS t)

SELECT * FROM Discipline

SELECT * FROM Lecturer
WHERE EXISTS (SELECT * FROM Loading 
WHERE LecturerPersonnelNumber = PersonnelNumber)

SELECT * FROM Lecturer
WHERE NOT EXISTS (SELECT * FROM Loading 
WHERE LecturerPersonnelNumber = PersonnelNumber)

