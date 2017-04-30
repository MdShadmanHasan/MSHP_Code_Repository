use pubs
select* from sysobjects
select name from sysobjects where xtype='U';
select* from authors
select au_lname,state from authors;
select* from authors where state='CA';
select* from authors where au_lname='white' and state='CA';

/* Task 1*/

select title from titles where ytd_sales >8000;
select*from titles

/* Task 2*/

select title from titles where royalty >=12 and royalty <=24;

select* from titles order by price asc
select* from titles order by price desc
select MAX(price)from titles
select avg(price)from titles
select type,MAX(price) from titles group by type 
select type,avg(price) from titles group by type having avg(price)>15 

/* Task 3*/

select type,"average"=AVG(price),"total"=SUM(ytd_sales)from titles group by type

select full_name=SUBSTRING(au_fname,1,1)+'.'+au_lname,phone from authors;

select full_name=SUBSTRING(au_fname,1,2)+'.'+au_lname,phone from authors;