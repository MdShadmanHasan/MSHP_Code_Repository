/* Q1 */
SELECT * FROM publishers WHERE country = 'France'

/* Q2 */

SELECT * FROM titles
SELECT type, AVG(royalty) AS 'Average Royalty' FROM titles GROUP BY type


/* Q3 */

SELECT type, AVG(royalty) AS 'Avg. Royalty' FROM titles GROUP BY TYPE HAVING AVG(royalty) > 15


/* Q4 */

SELECT * FROM titles
SELECT * FROM authors
SELECT * FROM titleauthor

SELECT title_id, au_lname FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id ORDER BY title_id ASC


/* Q5 */

SELECT title, type, royalty FROM titles WHERE royalty IN (SELECT avg(royalty) FROM titles)


/* Q6 */

SELECT * FROM authors
SELECT * FROM publishers

SELECT au_fname+ ' ' +au_lname AS Author_name, authors.city, pub_name FROM authors, publishers WHERE authors.city = publishers.city


/* Q7 */

CREATE DATABASE st14065642
USE st14065642
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

DROP TABLE students
