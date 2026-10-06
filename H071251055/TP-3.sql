--- 1

SELECT orderNumber, UPPER (productCode) AS "Kode Produk",  quantityOrdered, priceEach FROM orderdetails
WHERE (quantityOrdered BETWEEN 20 AND 50 OR priceEach < 30 )AND LEFT (productCode, 3) = 'S18'
ORDER BY quantityOrdered DESC

---2
SELECT customerNumber, customerName,  country,creditlimit, creditlimit-10000 AS "Selisih Kredit",CONCAT(contactfirstName, ' ', contactlastName)AS "Nama Lengkap" FROM customers
WHERE (country = 'USA' OR country = 'Canada' OR country = 'France') AND creditlimit > 30000
ORDER BY creditlimit DESC

---3
SELECT productCode, productName, buyPrice, MSRP, GREATEST(buyPrice,MSRP) AS "Harga Tertinggi", LEAST(buyPrice, MSRP) AS "Harga Terendah" FROM products
WHERE productName ILIKE '%car'

---4
SELECT orderNumber, orderDate, shippedDate, EXTRACT(YEAR FROM orderDate) AS "Tahun", EXTRACT(MONTH FROM orderDate) AS "Bulan", (shippedDate-orderDate) AS "Lama Pengiriman", AGE(shippedDate,orderDate) AS "Interval Pengiriman" , CURRENT_DATE AS "Tanggal Laporan", CURRENT_TIME AS "Waktu Laporan" FROM orders
WHERE shippedDate IS NOT NULL

---5 
SELECT orderNumber, orderDate, shippedDate, (orderDate + INTERVAL '10 day') AS "Estimasi Kirim", COALESCE(shippedDate, orderDate + INTERVAL '10 day') AS "Tanggal Aktual", AGE(shippedDate,orderDate) AS "Selisih Waktu" FROM orders
WHERE comments ILIKE '%customer%' AND EXTRACT(MONTH FROM orderDate) BETWEEN 10 AND 12 AND orderNumber % 2 != 0
ORDER BY orderDate DESC




---Tambahan SOAL
SELECT employeeNumber, firstName, lastName, jobTitle, email,UPPER (CONCAT(firstName,' ',lastName)) AS "Nama Lengkap" FROM employees
WHERE (jobTitle = 'Sales Rep' OR jobTitle = 'VP Sales') AND employeeNumber > 1200
ORDER BY lastName ASC
