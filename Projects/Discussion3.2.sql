use st14115602
select*from CustomerAndSuppliers
select*from Item
select*from Transactios

/*Task 1*/
create PROC getItem
AS
BEGIN
SELECT item_category as Category,"Total Number Of Item"=sum(item_qoh),"Average Price"=avg(item_price) from Item group by item_category
END

EXECUTE getItem
/*Task 2*/
ALTER PROC getItem @category_name CHAR(12),@price_value float
AS
BEGIN
SELECT*from Item where item_category=@category_name and item_price<@price_value
END
EXECUTE getItem 'Books',120.2

/*Task 3*/

ALTER PROC getItem @category_name CHAR(12),@price_value money
AS
BEGIN
DECLARE @price money
select @price=avg(item_price) from Items where item_category=@category_name;
     while @price<@price_value
         BEGIN
             UPDATE Items set item_price=item_price+0.1*item_price where item_category=@category_name;
             SELECT @price=AVG(item_price) from Items where item_category=@category_name;
          END
END
EXEC  getItem 'Books',120.2

select AVG(item_price) as Average_price from Items where item_category='Books'
select*from Items
