use pubs
select*from authors
select*from titles
select*from titleauthor
select*from publishers
select au_lname,title_id from authors JOIN titleauthor ON authors.au_id=titleauthor.au_id
/* Task 1 */

select title,"author_name"=au_fname+' '+au_lname from titles join titleauthor on titles.title_id=titleauthor.title_id join authors on titleauthor.au_id=authors.au_id
select title,au_fname+' '+au_lname as author_name,pub_name from titles join publishers on titles.pub_id=publishers.pub_id join titleauthor on titles.title_id=titleauthor.title_id join authors on titleauthor.au_id=authors.au_id

/*Task 2*/
select au_fname+' '+au_lname as author_name,authors.city,pub_name from authors,publishers where authors.city=publishers.city

select*from titles where royalty=(select AVG(royalty) from titles)
/* Task 3 */
select au_fname+' '+au_lname as author_name from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id where royalty in(select MAX(royalty) from titles)
select au_fname+' '+au_lname as author_name,royalty from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id where royalty in(select MAX(royalty) from titles)