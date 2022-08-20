USE ResourcesDepartUniversity

-- Display the unique numbers of practice classes from the Discipline table
SELECT DISTINCT NumberPractical FROM Discipline

-- Display unique names of teachers
SELECT DISTINCT Firstname FROM Lecturer

-- Display all disciplines in which the number of practical classes is equal to 10, 11, 12, 13, 14 or 15
SELECT * FROM Discipline
WHERE NumberPractical IN (10, 11, 12, 13, 14, 15)

-- Display all disciplines in which the number of lectures is equal to any, except 20, 25, 30.
SELECT * FROM Discipline
WHERE NumberLectures NOT IN (20, 25, 30)

-- Display all disciplines in which the number of seminar classes is between 1 and 5:
SELECT * FROM Discipline
WHERE NumberSeminars 
BETWEEN 1 AND 5

-- Display all disciplines with the letter "i" in their name
SELECT * FROM Discipline
WHERE Name LIKE '%і%'

-- Display unique surnames of teachers whose surname begins with the letter "K":
SELECT DISTINCT Lastname FROM Lecturer
WHERE Lastname LIKE 'К%'

-- Display unique surnames of teachers whose surname ends with the letter "й":
SELECT DISTINCT Lastname FROM Lecturer
WHERE Lastname LIKE '%й'

-- Display the unique surnames of teachers whose surname has the letter "p" in the third position:
SELECT DISTINCT Lastname FROM Lecturer
WHERE Lastname LIKE '__р%'

-- Display all names of teachers that consist of only 5 letters:
SELECT DISTINCT Firstname FROM Lecturer
WHERE Lastname LIKE '_____'

-- Select all names of disciplines that begin with the letter "м":
SELECT Name FROM Discipline
WHERE Name REGEXP '^м'

-- Display all names of the discipline, which consists of at least one of the letters: 'e', 'т', 'м'
SELECT Name FROM Discipline
WHERE Name REGEXP '[етм]'

-- Display all the numbers of lectures for the Discipline table, which contain the number from 0 to 2 in their number:
SELECT NumberLectures FROM Discipline
WHERE NumberLectures REGEXP '[0-2]'

-- Display the unique patronymics of teachers ending in "ич":
SELECT DISTINCT Middlename FROM Lecturer
WHERE Middlename REGEXP 'ич$'

-- Display all the names of teachers where the length of the name must be equal to 5 characters:
SELECT DISTINCT Firstname FROM Lecturer
WHERE Firstname REGEXP '^.....$'

-- Display all disciplines in which the field of the number of practical classes is not filled (equal to NULL)
SELECT * FROM Discipline 
WHERE NumberPractical IS NULL 

-- Display all teachers by sorting by date of birth in ascending order (that is from the oldest teacher to the youngest)
SELECT * FROM Lecturer
ORDER BY Birthdate ASC

-- Display all teachers by sorting by date of birth in ascending order (that is, from the youngest teacher to the oldest)
SELECT * FROM Lecturer
ORDER BY Birthdate DESC

-- Display all disciplines by sorting the number of lectures by field in ascending order, and the number of practical and seminars by field by descending order
SELECT * FROM Discipline 
ORDER BY NumberLectures ASC,
NumberPractical DESC, NumberSeminars DESC

-- Display the first two disciplines with the largest number of lectures
SELECT * FROM Discipline 
ORDER BY NumberLectures DESC LIMIT 2

