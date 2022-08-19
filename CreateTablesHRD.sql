CREATE DATABASE ResourcesDepartUniversity

USE ResourcesDepartUniversity


CREATE TABLE Department
(
	Code VARCHAR(15) PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
    Faculty VARCHAR(100) NOT NULL
)

CREATE TABLE Discipline
(
	Id INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
    Course INT NOT NULL,
    NumberLectures INT NULL,
    NumberPractical INT NULL,
	NumberSeminars INT NULL
)

CREATE TABLE Lecturer
(
	PersonnelNumber NUMERIC(6, 0) PRIMARY KEY,
	Lastname VARCHAR(50) NOT NULL,
	Firstname VARCHAR(50) NOT NULL,
	Middlename VARCHAR(50) NOT NULL,
	Gender ENUM('м','ж') DEFAULT 'ж',
    Birthdate DATE NOT NULL,
	DepartmentCode VARCHAR(15) NOT NULL,
    Post ENUM('Асистент', 'Викладач', 'Доцент', 'Професор'),
    AcademicDegree ENUM('Кандидат наук', 'Доктор наук'),
    AcademicStatus ENUM('Доцент', 'Професор'),
	CONSTRAINT fk_lecturer_department FOREIGN KEY (DepartmentCode)
	REFERENCES Department (Code) ON DELETE CASCADE
)

CREATE TABLE Loading
(
	Id INT PRIMARY KEY,
    LecturerPersonnelNumber NUMERIC(6, 0) NOT NULL, 
    DisciplineId INT NOT NULL,
    Type ENUM('Лекція', 'Семінар', 'Практичні заняття'),
	CONSTRAINT fk_loading_lecturer FOREIGN KEY (LecturerPersonnelNumber)
	REFERENCES Lecturer (PersonnelNumber) ON DELETE CASCADE,
    CONSTRAINT fk_loading_discipline FOREIGN KEY (DisciplineId)
	REFERENCES Discipline (Id) ON DELETE CASCADE
)

