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
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	CountryId INT REFERENCES Countries(Id),
	Gender gender NOT NULL,
	Profession profession NOT NULL,
	HotelId INT REFERENCES Hotels(Id),
	DateOfBirth TIMESTAMP
)

CREATE TABLE Projects (
	Id SERIAL PRIMARY KEY,
	Title VARCHAR(30)
)

CREATE TABLE Works (
	Id SERIAL PRIMARY KEY,
	Title VARCHAR(60) NOT NULL,
	NumberOfCitations INT NOT NULL,
	ProjectId INT REFERENCES Projects(Id),
	Published TIMESTAMP
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
	WorkId INT REFERENCES Works(Id)
)

-- STEP 2: Added junction Tables
	
INSERT INTO Accelerators(Name) VALUES
('Accelerator1'),
('Accelerator2'),
('Accelerator3'),
('Accelerator4'),
('Accelerator5'),
('Accelerator6'),
('Accelerator7'),
('Accelerator8'),
('Accelerator9')

INSERT INTO Projects(Title) VALUES
('COMPASS'),
('NA62'),
('CLOUD'),
('NA63'),
('UA9'),
('AEGIS'),
('ALPHA'),
('BASE')

INSERT INTO Works(Title, NumberOfCitations, ProjectId, Published) VALUES
('Forward-backward multiplicity', 48, 4, '2002-07-07'),
('Technical viability of PLC systems', 75, 2, '2002-09-05'),
('Transverse beam instabilities', 54, 8, '2003-04-17'),
('Quantitative structure', 0, 3, '2003-06-04'),
('AWAKE design report', 36, 1, '2003-12-21'),
('Non-Standard Higgs Physics', 40, 7, '2004-03-14'),
('Liposomal delivery', 23, 7, '2005-11-28'),
('Advanced Linear Collider Report', 75, 6, '2005-12-22'),
('Elementary statistics and probability', 68, 3, '2006-02-15'),
('The Proton Synchrotron Booster', 17, 6, '2006-04-02'),
('The ALICE experiment', 73, 8, '2007-01-18'),
('Demonstration of bunch triple splitting', 3, 4, '2007-07-24'),
('Transverse momentum spectra', 44, 3, '2008-01-28'),
('Evidence for a new state of matter', 41, 5, '2008-07-06'),
('Dark sector physics', 27, 1, '2009-05-06')

INSERT INTO Works(Title, NumberOfCitations, ProjectId, Published) VALUES
('New Physics', 83, 4, '2016-07-01'),
('New Physics 2', 12, 2, '2017-01-02')

INSERT INTO Countries(Name, Population, PPPpC) VALUES
('Germany', 83000000, 41000),
('Italy', 59000000, 46000),
('France', 67000000, 52000),
('UK', 67000000, 49000),
('Russia', 143000000, 32000),
('Spain', 47000000, 41000)

INSERT INTO Hotels(Title, Capacity, Location) VALUES
('Fairmont Grand Hotel', 1658, 'Geneva'),
('Hotel Continental', 721, 'Lausanne'),
('B&B Hotel', 453, 'Nyon')

INSERT INTO Scientists(FirstName, LastName, CountryId, Gender, Profession, HotelId, DateOfBirth) VALUES
('Agatha','Kneib', 6, 'F', 'Programmer', 1, '1980-12-23'),
('Trini','Simons', 3, 'F', 'Physicist', 2, '1982-12-19'),
('Gordon','Santana', 3, 'M', 'Physicist', 2, '1990-06-21'),
('Leonard','Arbeider', 2, 'M', 'Programmer', 1, '1994-09-15'),
('Safa','Darnell', 4, 'F', 'Engineer', 1, '1995-02-18'),
('Ernest','Head', 6, 'M', 'Physicist', 3, '1995-12-09'),
('Sanna','MacGowan', 4, 'U', 'Programmer', 2, '1996-05-30'),
('Rocco','Walther', 3, 'M', 'Scientist', 1, '1997-06-23'),
('Anton','Horn', 1, 'M', 'Scientist', 1, '1999-10-13'),
('Anna','Ruoho', 3, 'O', 'Programmer', 3, '2000-09-06')

INSERT INTO AcceleratorsProjects(AcceleratorId, ProjectId) VALUES
(8, 3),
(4, 2),
(8, 5),
(3, 1),
(6, 7),
(4, 7),
(6, 3),
(5, 4),
(4, 4),
(3, 6),
(1, 6),
(3, 4),
(7, 8),
(4, 4),
(4, 7),
(5, 1),
(1, 4),
(5, 1)

INSERT INTO ScientistsWorks(ScientistId, WorkId) VALUES
(10, 12),
(1, 4),
(4, 3),
(3, 7),
(3, 8),
(6, 7),
(5, 10),
(2, 9),
(4, 11),
(8, 5),
(6, 7),
(7, 7),
(6, 15),
(5, 7),
(3, 7),
(4, 6),
(3, 10),
(10, 7)

-- STEP 3: Added seed