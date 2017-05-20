USE pubs
SELECT * FROM authors
SELECT * FROM titles
SELECT * FROM titleauthor
SELECT * FROM publishers

SELECT au_lname, title_id FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id

SELECT title, au_fname+ ' ' +au_lname AS full_name FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON authors.au_id=titleauthor.au_id
SELECT title, au_fname+ ' ' +au_lname AS author_name, pub_name FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON authors.au_id=titleauthor.au_id JOIN publishers ON titles.pub_id=publishers.pub_id
SELECT au_lname, pub_name FROM authors, publishers

SELECT au_fname+ ' ' +au_lname AS full_name, authors.city, pub_name FROM authors, publishers WHERE authors.city=publishers.city
SELECT au_fname+ ' ' +au_lname AS full_name, authors.city, pub_name FROM authors, publishers WHERE authors.state=publishers.state

SELECT * FROM titles WHERE royalty = (SELECT avg(royalty) FROM titles)
SELECT * FROM titles WHERE royalty IN (SELECT avg(royalty) FROM titles)

SELECT au_fname+ ' ' +au_lname AS full_name, royalty FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id JOIN titles ON titles.title_id=titleauthor.title_id WHERE royalty IN (SELECT MAX(royalty) FROM titles)


CREATE TABLE item
(
		item_id CHAR(6) PRIMARY KEY CHECK (item_id LIKE '[P][0-9][0-9][0-9][0-9][0-9]'),
		item_name CHAR(12),
		item_category CHAR(10),
		item_price FLOAT(12) CHECK (item_price >= 0),
		item_qoh INT CHECK (item_qoh >= 0),
		item_last_sold DATE DEFAULT GETDATE(),
)

SELECT * FROM item

CREATE TABLE transactions
(
		tran_id CHAR(10) PRIMARY KEY CHECK (tran_id LIKE '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		item_id CHAR(6) FOREIGN KEY REFERENCES item(item_id),
		cust_id CHAR(6) FOREIGN KEY REFERENCES CustomerAndSuppliers(cust_id),
		tran_type CHAR(1) CHECK (tran_type = 'S' OR tran_type = 'O'),
		tran_quantity INT CHECK (tran_quantity >= 0),
		tran_date DATETIME DEFAULT GETDATE(),
)

SELECT * FROM transactions
