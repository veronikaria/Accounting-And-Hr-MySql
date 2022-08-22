CREATE DATABASE AccountingDb

USE AccountingDb

CREATE TABLE Department
(
	id INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL
)

CREATE TABLE Post
(
	Name VARCHAR(100) PRIMARY KEY,
	Salary MONEY NOT NULL
)

CREATE TABLE Employee
(
    	PersonnelNumber NUMERIC(6, 0) PRIMARY KEY,
    	Lastname VARCHAR(40) NOT NULL,
	Firstname VARCHAR(40) NOT NULL,
	Middlename VARCHAR(40) NOT NULL,
    	TaxpayerNumber CHAR(12) UNIQUE NOT NULL,
    	Gender ENUM('м','ж') DEFAULT 'м',
    	Birthdate DATE NOT NULL,
    	DepartmentId INT NOT NULL, 
    	PostName VARCHAR(100) NOT NULL,
    	Startdate DATE NULL,
    	PreviousExperience NUMERIC(5, 0) DEFAULT 0,
    	CONSTRAINT fk_employee_post FOREIGN KEY (PostName)
	REFERENCES Post (Name) ON DELETE CASCADE,
    	CONSTRAINT fk_employee_department FOREIGN KEY (DepartmentId)
	REFERENCES Department (Id) ON DELETE CASCADE
)


CREATE TABLE Child
(
    	id INT PRIMARY KEY,
    	PersonnelNumberParent NUMERIC(6, 0),
    	Lastname VARCHAR(40) NOT NULL,
    	Firstname VARCHAR(40) NOT NULL,
    	Middlename VARCHAR(40) NOT NULL,
    	Gender ENUM('м','ж') DEFAULT 'м',
    	Birthdate DATE NULL,
    	CONSTRAINT fk_child_employee FOREIGN KEY (PersonnelNumberParent)
    	REFERENCES Employee (PersonnelNumber) ON DELETE CASCADE
)
