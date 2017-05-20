SELECT * FROM item

CREATE TRIGGER trg_test ON item FOR INSERT
AS
BEGIN
	PRINT 'Data inserted in item table'
END

INSERT item VALUES ('P00009', 'MATLAB R2015', 'Software', 250.45, 45, 2017-05-20)

SELECT * FROM item

CREATE TRIGGER trg_OnDelete ON item FOR DELETE
AS
BEGIN
	PRINT 'Data Deleted From item table'
END

DELETE FROM item WHERE item_id = 'P00009'

SELECT * FROM item

CREATE TRIGGER trg_OnUpdate ON item FOR UPDATE
AS
BEGIN
	PRINT 'Data Updated Into item Table'
END

UPDATE item
SET item_name = 'Hakao', item_price = 0.00
WHERE item_id = 'P00009'

SELECT * FROM item

CREATE TRIGGER trg_update_item ON transactions FOR INSERT
AS
BEGIN
	DECLARE @item_id CHAR(6), @tran_amount INT, @tran_type CHAR(1)
	SELECT @item_id = item_id, @tran_amount = tran_quantity, @tran_type = tran_type FROM INSERTED
	IF (@tran_type = 'S')
		UPDATE item SET item_qoh = item_qoh - @tran_amount WHERE item_id = @item_id
		ELSE
		UPDATE item SET item_qoh = item_qoh + @tran_amount WHERE item_id = @item_id
END

INSERT transactions(tran_id,item_id,cust_id,tran_type,tran_quantity,tran_date)VALUES
('T000000001','P00009','C00001','S',40,DEFAULT)

SELECT * FROM transactions