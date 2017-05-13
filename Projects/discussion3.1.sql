use pubs
select*from authors

				/*create stored procedure */

create PROC sp_showTitleAndAuthor
AS
BEGIN
SELECT "Authors Last Name"=au_lname FROM authors where au_id in(select au_id from titleauthor where title_id='BU1032')
END

EXEC sp_showTitleAndAuthor

							/* Modify existing stored procedure */
 
ALTER PROC sp_showTitleAndAuthor
AS
BEGIN
SELECT "Authors First Name"=au_fname,"Authors Last Name"=au_lname from authors where au_id in
             (select au_id from titleauthor where title_id='BU1032');
 END
 
 EXEC sp_showTitleAndAuthor
		
		/* delete stored procedure */
		
DROP proc sp_showTitleAndAuthor  

ALTER PROC sp_showTitleAndAuthor @titleid char(15)
AS
BEGIN
SELECT "Authors Last Name"=au_lname FROM authors where au_id in(select au_id from titleauthor where title_id=@titleid)
END

 EXEC sp_showTitleAndAuthor 'BU1032'

select*from titles

create PROCEDURE sp_updatePrice @titleid char(15)
AS
BEGIN
DECLARE @price money
select @price=price from titles where title_id=@titleid;
set @price=@price+0.1*@price
IF @price<=20
UPDATE titles set price=@price where title_id=@titleid;
END

EXEC sp_updatePrice 'BU7832'
