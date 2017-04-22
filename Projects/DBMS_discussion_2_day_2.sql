SELECT * FROM authors
SELECT * FROM titleauthor
SELECT * FROM titles
SELECT * FROM publishers

SELECT au_lname, title_id FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id
SELECT title, au_fname+ ' ' +au_lname as full_name FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON authors.au_id=titleauthor.au_id
SELECT title, au_fname+ ' ' +au_lname as author_name, pub_name FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON authors.au_id=titleauthor.au_id JOIN publishers ON titles.pub_id=publishers.pub_id
SELECT au_lname, pub_name FROM authors, publishers

SELECT au_lname, authors.city, pub_name FROM authors, publishers WHERE authors.city=publishers.city

