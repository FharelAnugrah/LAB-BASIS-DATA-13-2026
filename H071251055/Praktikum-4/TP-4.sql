---1
---1
SELECT
	customerNumber AS "Nomor Pelanggan",
	SUM(amount) AS "Akumulasi Dana",
	COUNT (*) AS "Jumlah Frekuensi",
	MAX (amount) AS "Setoran Terbesar"
FROM payments
GROUP BY customerNumber
HAVING COUNT (*)  > 4 AND  AVG(amount) > 20000;



---2
SELECT
	customerNumber AS "Nomor Pelanggan",
	SUM(amount) AS "Total Setoran"
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 80000
ORDER BY SUM(amount) DESC


---3
SELECT
	productline AS "Kategori",
	COUNT(*) AS "Jumlah Produk",
	ROUND(AVG(MSRP), 2) AS "Rata Rata",
	STRING_AGG(productName, ', ' ORDER BY productName) AS "Nama Produk"
FROM products
GROUP BY productline
HAVING COUNT(*) > 10


---4
SELECT 
	employeeNumber
FROM employees
WHERE employeeNumber IN (SELECT DISTINCT reportsto FROM employees)
EXCEPT
SELECT employeeNumber
FROM employees
WHERE jobtitle LIKE '%VP%' OR jobtitle LIKE '%President%'



---5
SELECT
	productCode,
	SUM (quantityOrdered) AS "Unit Terjual",
	ROUND(AVG(priceEach),2) AS "Rata-Rata"
FROM orderDetails
WHERE priceEach > 100
GROUP BY productCode
HAVING SUM (quantityOrdered) > 50
ORDER BY SUM (quantityOrdered) DESC


-- Soal 06
SELECT
	productCode AS "Produk Kode",
	SUM(quantityOrdered) AS "Total Unit Terjual",
	SUM(quantityOrdered * priceEach) AS "Pendapatan Kotor",
	ROUND(AVG(priceEach), 2) AS "Harga Rata Rata",
	MAX(priceEach) - MIN(priceEach) AS "Rentang Volatilitas"
FROM classicmodels.orderdetails
WHERE quantityOrdered > 20
GROUP BY productCode
HAVING SUM(quantityOrdered * priceEach) > 50000
ORDER BY SUM(quantityOrdered * priceEach) DESC


-- Soal 07
SELECT customerNumber FROM classicmodels.customers
WHERE creditlimit > 80000
INTERSECT
SELECT customerNumber FROM classicmodels.orders
WHERE status IN ('Cancelled', 'On Hold')
EXCEPT
SELECT customerNumber FROM classicmodels.payments
GROUP BY customerNumber
HAVING SUM(amount) > 100000


SELECT * FROM products

---SOAL TAMBAHAN



---1
SELECT
	SUM (quantityinstock) AS "Jumlah Produk",
	COUNT (quantityinstock) AS "Total Stok Tersedia",
	ROUND(AVG(buyPrice),2) AS "Rata-Rata",
	MAX(buyPrice) AS "Harga Terbesa",
	MIN(buyPrice) AS "Harga Terkecil"
FROM products


---2
SELECT
	country AS "Nama Negara",
	COUNT (*) AS "Jumlah Pelanggannya"
FROM customers
GROUP BY country
ORDER BY COUNT (*) DESC
LIMIT 5;

