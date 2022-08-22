# Accounting-And-HumanResources-MySql-Databases
## I. Database HumanResourcesDepartmentOfTheUniversity
Human resources department of the university

Create and fill in the relationship in the database of the human resourses department of the university.
1. Department
    * Code - Primary key
    * Name of the department
    * Faculty
  
2. Discipline
    * Identifier - Primary key
    * Name
    * Course
    * Number of lectures
    * Number of practical
    * Number of seminars

3. Lecturer
    * Personnel number -  Primary key
    * Full name
    * Gender ('m' or 'f')
    * Date of birth
    * Department
    * Post (assistant, teacher, associate professor or professor)
    * AcademicDegree (candidate of science or doctor of science)
    * AcademicStatus (docent or professor)

4. Loading
    * Identifier - Primary key
    * Lecturer
    * Discipline
    * Type of loading (lection, seminar or practical)


## II. Database Accounting

1. Department
    * Identifier - Primary key
    * Name of the department

2. Post
    * Name of post - Primary key
    * Salary 

3. Employee
    * Personnel number - Primary key
    *	Full name 
    * Taxpayer number (can contains only 12 characters)
    * Gender ('m' or 'f')
    *	Birthdate 
    *	Department
    *	Post
    *	Startdate
    *	Previous experience 
 
4. Child
    * Identifier - Primary key
    *	Personnel number of the parent
    *	Full name
    *	Gender ('m' or 'f')
    *	Birthdate 
 
