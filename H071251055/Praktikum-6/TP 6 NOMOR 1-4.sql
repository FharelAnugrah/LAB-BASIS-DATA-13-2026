---1

SELECT
	productCode AS "Kode Produk",
	productName AS "Nama Produk",
	msrp AS "MSRP",
	quantityinstock AS "Jumlah Stok",
	CASE
		WHEN msrp < 50 AND quantityinstock > 500 THEN 'Ekonomis - Stok Tinggi'
		WHEN msrp < 50 AND quantityinstock <= 500 THEN 'Ekonomis - Stok Rendah' 
		WHEN msrp BETWEEN 50 AND 100  THEN 'Harga Menengah'
		WHEN msrp > 100  THEN 'Harga Premium'
	END AS "Kategori Produk"
FROM products
ORDER BY msrp DESC;


---2
SELECT
	productCode AS "Kode Produk",
	SUM(quantityordered) "Total Terjual",
	COUNT(DISTINCT(ordernumber)) "Jumlah Pesanan"
FROM orderdetails
GROUP BY productcode
HAVING SUM(quantityordered) > (
	SELECT 
	AVG(quantityordered)
	FROM orderdetails	
) AND COUNT(DISTINCT(ordernumber)) > 10
ORDER BY SUM(quantityordered) DESC;



---3
SELECT
	productCode AS "Kode Produk",
	productname AS "Nama Produk",
	quantityInstock AS "Jumlah Stok",
	msrp
FROM products
WHERE quantityinstock > (
	SELECT
	AVG(quantityinstock)
	FROM products)
AND msrp > (
	SELECT 
	AVG (msrp)
	FROM products)
ORDER BY quantityinstock DESC;


---4
BEGIN;

UPDATE orders
SET status = 'Shippped'
WHERE orderNumber = 10100;

SAVEPOINT status_pengiriman;

UPDATE orders
SET status = 'Cancelled'
WHERE orderNumber = 10100;

ROLLBACK to SAVEPOINT status_pengiriman;

COMMIT;



---Soal Tambahan
SELECT 
	c.customernumber, 
	c.customername, 
	c.city, 
	(SELECT COUNT(*)
	FROM orders AS o
	WHERE c.customernumber=o.customernumber
	) AS total_pesanan,
CASE 
	WHEN (SELECT COUNT(*) FROM orders) > 5 THEN 'Pelanggan loyal'
	WHEN (SELECT COUNT(*) FROM orders) BETWEEN 2 AND 5 THEN 'Pelanggan Aktif'
	WHEN (SELECT COUNT(*) FROM orders) = 1 THEN 'Pelanggan baru'
	ELSE 'Pelanggan Pasif'
END AS "kategori pelanggan"
FROM customers AS c
ORDER BY total_pesanan DESC, c.customername ASC;







