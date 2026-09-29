INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES 
	('H071251055', 'MUH. FHAREL ANUGRAH', NULL, 1),
	('H071251054', 'M. Taqwin Yunus', 'tawintampan@gmail.com',2), 
	('H071251058', 'M. FAYYADH MUWAFFAQ', 'fayyadhganteng@gmail.com',3)
RETURNING*;

SELECT * FROM mahasiswa
SELECT * FROM prodi

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 0.00

DELETE FROM mahasiswa
WHERE email IS NULL;
RETURNING*;

---3
SELECT 
	customerNumber AS "Nomor Pelanggan",
	customerName AS "Nama Pelanggan",
	phone AS "Telepon",
	country AS "Negara"
FROM classicmodels.customers;

---4
SELECT productCode, productName, buyPrice FROM classicmodels.products
WHERE buyPrice > 50
ORDER BY buyPrice DESC
LIMIT 7;

---5
SELECT DISTINCT country AS "Negara Pelanggan" FROM classicmodels.customers
ORDER BY country ASC
OFFSET 5
LIMIT 5;


INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES
	('H071251055', 'MUH. FHAREL ANUGRAH', NULL, 1)
RETURNING*;



SELECT customername,contactlastname,contactfirstname,phone FROM classicmodels.customers
WHERE country = 'USA'
ORDER BY customerName ASC;