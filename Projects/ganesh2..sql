create table Customerandsupplier
(
	 cust_id CHAR(6) PRIMARY KEY CHECK(cust_id LIKE '[CS][0-9][0-9][0-9][0-9][0-9]'),
     cust_fname CHAR(15) NOT NULL,
     cust_lname VARCHAR(15),
     cust_address TEXT,
     cust_telno CHAR(12) CHECK(cust_telno LIKE'[0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
     cust_city CHAR(12) DEFAULT 'Rajshahi',
     sales_amnt  MONEY CHECK(sales_amnt >= 0),
     proc_amnt  MONEY CHECK(proc_amnt >= 0),
     entry_date DATETIME DEFAULT getdate(),
)

SELECT * FROM Customerandsupplier

INSERT Customerandsupplier
(cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt) VALUES
('C00002','','shamima','Bogura','017-09872800',DEFAULT,1200,700)

UPDATE Customerandsupplier
SET sales_amnt=700,proc_amnt=524,cust_fname='manu',cust_lname='mandal',cust_address='jamalpur'
WHERE cust_id = 'C00001';

DELETE FROM  Customerandsupplier WHERE cust_id = 'C00002';


DROP TABLE Customerandsupplier