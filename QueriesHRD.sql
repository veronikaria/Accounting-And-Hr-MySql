USE ResourcesDepartUniversity


SELECT DISTINCT NumberPractical FROM Discipline

SELECT DISTINCT Firstname FROM Lecturer

SELECT * FROM Discipline
WHERE NumberPractical IN (10, 11, 12, 13, 14, 15)

SELECT * FROM Discipline
WHERE NumberLectures NOT IN (20, 25, 30)

SELECT * FROM Discipline
WHERE NumberSeminars 
BETWEEN 1 AND 5


SELECT * FROM Discipline
WHERE Name LIKE '%і%'

SELECT DISTINCT Lastname FROM Lecturer
WHERE Lastname LIKE 'К%'


SELECT DISTINCT Lastname FROM Lecturer
WHERE Lastname LIKE '%й'


SELECT DISTINCT Lastname FROM Lecturer
WHERE Lastname LIKE '__р%'

SELECT DISTINCT Firstname FROM Lecturer
WHERE Lastname LIKE '_____'



SELECT Name FROM Discipline
WHERE Name REGEXP '^м'


SELECT Name FROM Discipline
WHERE Name REGEXP '[етм]'

SELECT NumberLectures FROM Discipline
WHERE NumberLectures REGEXP '[0-2]'

SELECT DISTINCT Middlename FROM Lecturer
WHERE Middlename REGEXP 'ич$'

SELECT DISTINCT Firstname FROM Lecturer
WHERE Firstname REGEXP '^.....$'


SELECT * FROM Discipline 
WHERE NumberPractical IS NULL 

SELECT * FROM Lecturer
ORDER BY Birthdate ASC

SELECT * FROM Lecturer
ORDER BY Birthdate DESC

SELECT * FROM Discipline 
ORDER BY NumberLectures ASC,
NumberPractical DESC, NumberSeminars DESC


SELECT * FROM Discipline 
ORDER BY NumberLectures DESC LIMIT 2




