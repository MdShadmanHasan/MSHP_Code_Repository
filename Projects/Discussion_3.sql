/*Stored Procedure*/

USE pubs
SELECT * FROM titles
SELECT * FROM authors
SELECT * FROM titleauthor

CREATE PROC sp_showTitleAndAuthor
AS
BEGIN
SELECT "Authors Last Name" = au_lname FROM authors WHERE au_id IN (SELECT au_id FROM titleauthor where title_id = 'BU1032')
END

EXEC sp_showTitleAndAuthor

ALTER PROC sp_showTitleAndAuthor
AS
BEGIN
UPDATE authors SET au_lname = 'Bennet' WHERE au_id = '409-56-7008'
/*IN (SELECT au_id FROM titleauthor where title_id = 'BU1032')*/
SELECT * FROM authors
END

DROP PROC sp_showTitleAndAuthor

/*Parameterized Stored Procedure*/

ALTER PROC sp_showTitleAndAuthor @titleid char(15)
AS
BEGIN
SELECT "Authors Last Name" = au_lname FROM authors WHERE au_id IN (SELECT au_id FROM titleauthor WHERE title_id = @titleid)
END

SELECT * FROM authors
SELECT * FROM titleauthor
SELECT * FROM titles

EXEC sp_showTitleAndAuthor 'PS3333'


/* Stored Procedures With Decision Making / Looping Constructs */

CREATE PROC sp_updatePrice @titleid char(15)
AS
BEGIN
	DECLARE @price MONEY
	SELECT @price = price FROM titles WHERE title_id = @titleid
	SET @price = @price + 0.1 * @price
	IF @price <= 20
	UPDATE titles SET price = @price WHERE title_id = @titleid
END

EXEC sp_updatePrice 'BU7832'
EXEC show_updatedPrice 'BU7832'

CREATE PROC show_updatedPrice @titleid CHAR(15)
AS
BEGIN
SELECT * FROM titles WHERE title_id = @titleid
END

EXEC show_updatePrice 'BU7832'

/* Task 1 */

SELECT * FROM items
SELECT * FROM CustomerAndSuppliers
SELECT * FROM Transactions

CREATE PROC print_item_details
AS
BEGIN
SELECT item_category AS Category, "Total Number Of Items" = SUM(item_qoh), "Average Price" = AVG(item_price) FROM items GROUP BY item_category
END

EXEC print_item_details

/* Task 2 */

SELECT * FROM items

CREATE PROC cheaper_prices @category_name CHAR(10), @price_value FLOAT(12)
AS
BEGIN
SELECT * FROM items WHERE item_category = @category_name AND item_price < @price_value
END

EXEC cheaper_prices 'Books' , 200


/* Task 3 */

CREATE PROC


/* TASK 4 By Sajid Sir */

SELECT * FROM titles

CREATE PROC avg_royalty_per_type
AS
BEGIN
SELECT type, "Average Royalty" = AVG(royalty) FROM titles GROUP BY type
END

ALTER PROC avg_royalty_per_type @royalty int
AS
BEGIN
SELECT type, "Average Royalty" = AVG(royalty) FROM titles GROUP BY type HAVING AVG(royalty) > @royalty
END

EXEC avg_royalty_per_type 9