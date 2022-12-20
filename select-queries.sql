-- 1
SELECT w.Title, CONCAT(s.LastName, ', ', LEFT(s.FirstName, 1), '.') as FullName FROM Works w
	JOIN ScientistsWorks sw on sw.WorkId = w.Id
	JOIN Scientists s on s.Id = sw.ScientistId
	
-- 2
SELECT
	s.FirstName,
	s.LastName,
	CASE
		WHEN s.Gender = 'M' THEN 'Male'
		WHEN s.Gender = 'F' THEN 'Female'
		WHEN s.Gender = 'U' THEN 'Unknown'
		WHEN s.Gender = 'O' THEN 'Other'
	END Gender,
	c.Name,
	c.PPPpC
	FROM Scientists s
	JOIN Countries c on c.Id = s.CountryId
	
-- 3 
SELECT p.Title, a.Name FROM AcceleratorsProjects ap
	JOIN Accelerators a ON ap.AcceleratorId = a.Id
	JOIN Projects p ON ap.ProjectId = p.Id

-- 4: 2015/2017

--5
SELECT c.Name, COUNT(c.Name), w.Title, w.NumberOfCitations, s.FirstName, s.LastName  FROM Countries c
	JOIN Scientists s ON s.CountryId = c.Id
	JOIN ScientistsWorks sw on sw.ScientistId = s.Id
	JOIN Works w ON w.Id = sw.WorkId 
--ORDER BY c.Name
GROUP BY c.Name, w.Title, w.NumberOfCitations, s.FirstName, s.LastName

-- 6
SELECT DISTINCT ON (c.Name) Name, w.Title, w.Published FROM Countries c
	JOIN Scientists s ON s.CountryId = c.Id
	JOIN ScientistsWorks sw ON sw.ScientistId = s.Id
	JOIN Works w ON w.Id = sw.WorkId
GROUP BY c.Name, w.Title, w.Published
ORDER BY c.Name, w.Published

-- 7
SELECT h.Location, COUNT(s.Id) AS NumberOfScientists FROM Scientists s
	JOIN Hotels h ON h.Id = s.HotelId
	GROUP BY h.Location
	ORDER BY NumberOfScientists DESC

-- 8
SELECT a.Name, AVG(w.NumberOfCitations) AS AverageCitations FROM Accelerators a
	JOIN AcceleratorsProjects ap ON ap.AcceleratorId = a.Id
	JOIN Projects p ON p.Id = ap.ProjectId
	JOIN Works w on w.ProjectId = p.Id
	GROUP BY a.Name
	ORDER BY AverageCitations DESC

-- 9
SELECT s.FirstName, s.LastName, DATE_PART('year', s.DateOfBirth) / 10 AS YearOfBirth, s.Gender FROM Scientists s
	
	