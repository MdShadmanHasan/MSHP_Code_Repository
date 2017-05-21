CREATE PROC sp_increaseAvgAge @desired_avg_age INT
AS
BEGIN
DECLARE @avg_age INT
SELECT @avg_age = AVG(st_age) FROM students 
	WHILE @avg_age < @desired_avg_age
			BEGIN
				UPDATE students SET st_age = st_age + 0.1 * st_age
				SELECT @avg_age = AVG(st_age) FROM students
			END
END
SELECT AVG(st_age) AS "Average Age" FROM students

EXEC sp_increaseAvgAge 19

SELECT * FROM students