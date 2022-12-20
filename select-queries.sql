-- 1
-- right(s.Name, -strpos(s.Name, ' '))
SELECT w.Title, s.Name FROM Works w
	JOIN ScientistsWorks sw on sw.WorkId = w.Id
	JOIN Scientists s on s.Id = sw.ScientistId