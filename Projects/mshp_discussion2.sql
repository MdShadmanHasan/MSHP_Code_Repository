CREATE TABLE CustomerAndSuppliers

(
		cust_id CHAR (6) PRIMARY KEY CHECK (cust_id LIKE '[CS][0-9][0-9][0-9][0-9][0-9]'),
		cust_fname CHAR(15) NOT NULL,
		cust_lname VARCHAR(15),
		cust_address TEXT,
		cust_telno CHAR(12) CHECK (cust_telno LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		cust_city CHAR(12) DEFAULT 'Rajshahi',
		sales_amnt MONEY CHECK (sales_amnt>=0),
		proc_amnt MONEY CHECK (proc_amnt>=0),
		entry_date DATETIME DEFAULT getdate(),
)

SELECT * FROM CustomerAndSuppliers


INSERT CustomerAndSuppliers (cust_id, cust_fname, cust_lname, cust_address, cust_telno, cust_city, sales_amnt, proc_amnt) VALUES
('C00006', 'Omar', 'JutaChor', 'NaoganBolodGachi', '014-20420420', DEFAULT, 0, 0)

UPDATE CustomerAndSuppliers
SET sales_amnt = 1000, proc_amnt = 5000, cust_address = 'Naogaon', cust_fname = 'Shadman'
WHERE cust_id = 'C00001';

DELETE FROM CustomerAndSuppliers WHERE cust_id = 'C00004'