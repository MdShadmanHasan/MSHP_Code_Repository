use ST14115602
CREATE TABLE CustomerAndSuppliers
(
cust_id CHAR(6)PRIMARY KEY CHECK(cust_id LIKE'[CS][0-9][0-9][0-9][0-9][0-9]'),
cust_fname CHAR(15)NOT NULL,
cust_lname VARCHAR(15),
cust_address TEXT,
cust_telno CHAR(12)CHECK(cust_telno LIKE'[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cust_city CHAR(12) DEFAULT 'Rajshahi',
sales_amnt MONEY CHECK(sales_amnt>=0),
proc_amnt MONEY CHECK(proc_amnt>=0),
)
INSERT CustomerAndSuppliers
(cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt)VALUES
('C00001','Iqbal','Hossain','221/BDhanmondi','017-00000000','Dhaka',0,0)
INSERT CustomerAndSuppliers
(cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt)VALUES
('C00002','Ismail','Hossain','Dinajpur','017-00000000',default,10,20)
INSERT CustomerAndSuppliers
(cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt)VALUES
('P00002','Omor','Faruk','Dinajpur','017-00000000',default,10,20)
select* from CustomerAndSuppliers

/*Task 4 */
CREATE TABLE ITEM
(
	item_id CHAR(6)PRIMARY KEY CHECK(item_id LIKE'[P][0-9][0-9][0-9][0-9][0-9]'),
	item_name CHAR(12),
	item_category CHAR(10),
	item_price FLOAT(12) CHECK(item_price>=0),
	item_qoh INT CHECK(item_qoh>=0),
	item_last_sold DATE DEFAULT GETDATE(),
)
INSERT ITEM
(item_id,item_name,item_category,item_price,item_qoh,item_last_sold)VALUES
('P00001','HP probook','Laptop',56.2,23,'2015-08-12')
select*from ITEM


drop table ITEM

CREATE TABLE Transactios
(
	tran_id CHAR(10)PRIMARY KEY CHECK(tran_id LIKE'[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	item_id CHAR(6)FOREIGN KEY REFERENCES ITEM(item_id),
	cust_id CHAR(6)FOREIGN KEY REFERENCES CustomerAndSuppliers(cust_id),
	tran_type CHAR(1),
	tran_quantity INT CHECK(tran_quantity>=0),
	tran_date datetime DEFAULT GETDATE(),
)
select*from Transactios
drop table Transactios