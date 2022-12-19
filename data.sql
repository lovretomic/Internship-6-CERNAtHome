CREATE TYPE gender AS ENUM ('M', 'F', 'U', 'O');
CREATE TYPE profession AS ENUM (
	'Programmer',
	'Physicist',
	'Engineer',
	'Scientist'
)

CREATE TABLE Countries (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Population BIGINT NOT NULL,
	PPPpC INT NOT NULL
)

CREATE TABLE Hotels (
	Id SERIAL PRIMARY KEY,
	Capacity INT NOT NULL,
	Location VARCHAR(30) NOT NULL
)
ALTER TABLE Hotels
	ADD Title VARCHAR(30) NOT NULL


CREATE TABLE Scientists (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	CountryId INT REFERENCES Countries(Id),
	Gender gender NOT NULL,
	Profession profession NOT NULL,
	HotelId INT REFERENCES Hotels(Id)
)

CREATE TABLE Projects (
	Id SERIAL PRIMARY KEY,
	Title VARCHAR(30)
)

CREATE TABLE Works (
	Id SERIAL PRIMARY KEY,
	Title VARCHAR(30) NOT NULL,
	NumberOfCitations INT NOT NULL,
	ProjectId INT REFERENCES Projects(Id)
)

CREATE TABLE Accelerators (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
)

-- STEP 1: Added initial Tables

CREATE TABLE AcceleratorsProjects (
	AcceleratorId INT REFERENCES Accelerators(Id),
	ProjectId INT REFERENCES Projects(Id)
)

CREATE TABLE ScientistsWorks (
	ScientistId INT REFERENCES Scientists(Id),
	WorkId INT REFERENCES Scientists(Id)
)

-- STEP 2: Added junction Tables
	
INSERT INTO Accelerators (Name) VALUES
	('Akc1'),('Akc2'),('Akc3'),('Akc4'),('Akc5')

INSERT INTO Projects (Title) VALUES
	('Project1'),
	('Project2'),
	('Project3'),
	('Project4'),
	('Project5')

INSERT INTO Works