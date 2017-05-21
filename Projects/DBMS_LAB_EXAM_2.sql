CREATE DATABASE st14065642_2
CREATE TABLE students 
(
	st_id CHAR(4) PRIMARY KEY CHECK (st_id LIKE '[S][0-9][0-9][0-9]'),
	st_name VARCHAR(15) NOT NULL,
	st_age INT CHECK (st_age > 0),
	st_city CHAR(10) DEFAULT 'Rajshahi'
)

SELECT * FROM students

INSERT students (st_id, st_name, st_age, st_city) VALUES ('S001', 'John', 17, 'Dhaka')
INSERT students (st_id, st_name, st_age, st_city) VALUES ('S002', 'Richard', 19, 'Khulna')
INSERT students (st_id, st_name, st_age, st_city) VALUES ('S003', 'Harry', 14, DEFAULT)
INSERT students (st_id, st_name, st_age, st_city) VALUES ('S004', 'Jack', 20, DEFAULT)

CREATE PROC sp_showStRecords @input_age INT
AS
BEGIN
SELECT * FROM students WHERE st_age < @input_age
END

EXEC sp_showStRecords 19
EXEC sp_showStRecords 15

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


DROP TABLE students
