SELECT * FROM authors
SELECT * FROM titleauthor
SELECT * FROM titles
SELECT * FROM publishers

SELECT au_lname, title_id FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id
SELECT title, au_fname+ ' ' +au_lname AS full_name FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON authors.au_id=titleauthor.au_id
SELECT title, au_fname+ ' ' +au_lname AS author_name, pub_name FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON authors.au_id=titleauthor.au_id JOIN publishers ON titles.pub_id=publishers.pub_id
SELECT au_lname, pub_name FROM authors, publishers

SELECT au_fname+ ' ' +au_lname AS full_name, authors.city, pub_name FROM authors, publishers WHERE authors.city=publishers.city

SELECT au_fname+ ' ' +au_lname AS full_name, authors.city, pub_name FROM authors, publishers WHERE authors.state=publishers.state

SELECT * FROM titles WHERE royalty = (SELECT avg(royalty) FROM titles)
SELECT * FROM titles WHERE royalty IN (SELECT avg(royalty) FROM titles)

SELECT au_fname+ ' ' +au_lname AS full_name, royalty FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id JOIN titles ON titles.title_id=titleauthor.title_id WHERE royalty = (SELECT MAX(royalty) FROM titles)



