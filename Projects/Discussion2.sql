use st14115602
CREATE TABLE CustomerAndSuppliers
(
cust_id CHAR(6)PRIMARY KEY CHECK(cust_id LIKE'[CS][0-9][0-9][0-9][0-9][0-9]'),
cust_fname CHAR(16)NOT NULL,
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
('S00001','Imran','Hossain','221/Dinajpur','017-84900050','Dinajpur',0,10)
INSERT CustomerAndSuppliers
(cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt)VALUES
('C00002','Selim','Hossain','Nilphamary','017-00023456','Rangpur',25,0)
select* from CustomerAndSuppliers

/*Task 4 */
CREATE TABLE ITEMS
(
	item_id CHAR(6)PRIMARY KEY CHECK(item_id LIKE'[P][0-9][0-9][0-9][0-9][0-9]'),
	item_name CHAR(12),
	item_category CHAR(10),
	item_price FLOAT(12) CHECK(item_price>=0),
	item_qoh INT CHECK(item_qoh>=0),
	item_last_sold DATETIME DEFAULT GETDATE(),
)
DROP TABLE item

INSERT ITEM
(item_id,item_name,item_category,item_price,item_qoh,item_last_sold)VALUES
('P00001','Matlab2009a','Software',125.45,23,'2015-08-12')
INSERT ITEM
(item_id,item_name,item_category,item_price,item_qoh)VALUES
('P00002','C Program','Books',56.2,10)
INSERT ITEM
(item_id,item_name,item_category,item_price,item_qoh)VALUES
('P00003','Wires','Electrical',12.2,20)
INSERT INTO ITEM
(item_id,item_name,item_category,item_price,item_qoh,item_last_sold)VALUES
('P00004','Basic Java','Books',100.00,12,'2017-01-12')
INSERT INTO ITEM
(item_id,item_name,item_category,item_price,item_qoh,item_last_sold)VALUES
('P00005','Basic SQL','Books',125.20,15,'2014-01-10')
INSERT INTO ITEM
(item_id,item_name,item_category,item_price,item_qoh,item_last_sold)VALUES
('P00006','SQL SERVER','Software',115.2,18,'2013-01-10')
INSERT INTO ITEM
(item_id,item_name,item_category,item_price,item_qoh,item_last_sold)VALUES
('P00007','Studio','Software',214.2,30,'2015-10-20')

select*from ITEM

CREATE TABLE Transactions
(
	tran_id CHAR(10)PRIMARY KEY CHECK(tran_id LIKE'[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	item_id CHAR(6)FOREIGN KEY REFERENCES ITEM(item_id),
	cust_id CHAR(6)FOREIGN KEY REFERENCES CustomerAndSuppliers(cust_id),
	tran_type CHAR(1) CHECK(tran_type='S' OR tran_type='O'),
	tran_quantity INT CHECK(tran_quantity>=0),
	tran_date datetime DEFAULT GETDATE(),
)

insert Transactios(tran_id,item_id,cust_id,tran_type,tran_quantity,tran_date)values
('T000000001','P00001','C00001','S',12,DEFAULT)
insert Transactios(tran_id,item_id,cust_id,tran_type,tran_quantity,tran_date)values
('T000000002','P00004','C00002','O',20,'2015-01-12')
insert Transactios(tran_id,item_id,cust_id,tran_type,tran_quantity,tran_date)values
('T000000003','P00005','S00001','S',100,DEFAULT)

select*from Transactios

