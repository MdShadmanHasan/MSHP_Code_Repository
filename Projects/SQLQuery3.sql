CREATE DATABASE STD14065642
SELECT * FROM SYSOBJECTS
SELECT NAME FROM SYSOBJECTS WHERE XTYPE = 'U'
SELECT * FROM AUTHORS
SELECT AU_LNAME, STATE FROM AUTHORS
SELECT * FROM AUTHORS WHERE STATE = 'CA'
SELECT * FROM AUTHORS WHERE AU_LNAME = 'White' AND STATE = 'CA'

SELECT * FROM TITLES
SELECT * FROM TITLES WHERE YTD_SALES > 8000
SELECT TITLE, YTD_SALES FROM TITLES WHERE YTD_SALES > 8000
SELECT * FROM TITLES WHERE ROYALTY >= 12 AND ROYALTY <= 24
SELECT TITLE, TYPE, PRICE, ROYALTY, YTD_SALES FROM TITLES WHERE ROYALTY >= 12 AND ROYALTY <= 24

SELECT * FROM TITLES ORDER BY PRICE ASC
SELECT * FROM TITLES ORDER BY PRICE DESC

SELECT MAX(PRICE) FROM TITLES
SELECT AVG(PRICE) FROM TITLES

SELECT TYPE, MAX(PRICE) FROM TITLES GROUP BY TYPE
SELECT TYPE, AVG(PRICE) FROM TITLES GROUP BY TYPE

SELECT TYPE, AVG(PRICE) FROM TITLES GROUP BY TYPE HAVING AVG(PRICE) > 15
SELECT TYPE, MAX(PRICE) FROM TITLES GROUP BY TYPE HAVING MAX(PRICE) > 20

SELECT TYPE, "AVERAGE PRICE" = AVG(PRICE), "MAXIMUM PRICE" = MAX(PRICE), "TOTAL YTD SALES" = SUM(YTD_SALES) FROM TITLES GROUP BY TYPE 

SELECT "NAME" = SUBSTRING(AU_FNAME,1,1) + '.' + AU_LNAME, PHONE FROM AUTHORS