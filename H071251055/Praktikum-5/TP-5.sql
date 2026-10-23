---1
SELECT
	c.contactfirstname ,
	c.customerName,
	of.city,
	CONCAT(e.firstname, ' ', e.lastname) AS sales_rep_name
FROM customers c
JOIN employees e
ON c.salesrepemployeenumber = e.employeenumber
JOIN offices of
ON e.officecode = of.officecode
WHERE contactfirstname ILIKE 'A%' AND of.city <> 'NYC'
ORDER BY c.customerName ASC;
SET SEARCH_PATH TO CLASSICMODELS


---2
SELECT 
	c.customername,
	SUM(p.amount) AS total_payment,
	MAX(p.amount) AS max_single_payment
FROM customers c 
JOIN payments p
ON c.customernumber = p.customernumber
GROUP BY c.customerName
HAVING SUM(p.amount) > 50000
ORDER BY SUM(p.amount) DESC;


---3
SELECT 
	c.customername,
	COUNT (DISTINCT p) AS total_order,
	ROUND(AVG(od.quantityordered),2) AS avg_quantity_per_order
FROM customers c
JOIN payments p
ON c.customernumber = p.customernumber
JOIN orders o
ON o.customernumber = p.customernumber
JOIN orderdetails od
ON o.ordernumber = od.ordernumber
GROUP BY c.customername
HAVING COUNT (DISTINCT p) > 3 AND ROUND(AVG(od.quantityordered),2) > 35
ORDER BY total_order DESC, ROUND(AVG(od.quantityordered),2) DESC

---4
SELECT
	pl.productline,
	SUM(od.quantityordered) AS total_perjualan,
	ROUND(AVG(od.priceEach),2) AS rata_rata_harga,
	ROUND(AVG((p.msrp - od.priceEach)/p.msrp*100),2) AS avg_discount_presentage
FROM productLines pl
JOIN products p
ON pl.productline = p.productline
JOIN orderdetails od
ON od.productcode = p.productcode
GROUP BY pl.productline
HAVING SUM(od.quantityordered) >3000 AND AVG(od.priceEach) > 80
ORDER BY SUM(od.quantityordered) DESC

	
---5
SELECT 
	c.customername AS nama_pelanggan,
	SUM(od.quantityordered *od.priceeach) AS total_transaksi,
    COUNT(DISTINCT o.orderNumber) AS totalShippedOrders, 
	ROUND(SUM(od.quantityordered *od.priceeach)/ COUNT (DISTINCT o.ordernumber),2) AS avg_transaction_per_order
FROM customers c
JOIN  orders o
ON c.customernumber = o.customernumber
JOIN orderdetails od
ON o.ordernumber = od.ordernumber
WHERE  o.status = 'Shipped'
GROUP BY customername
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderdate)) > 1
ORDER BY total_transaksi DESC
LIMIT 5;

---6
SELECT 
	c.customername,
	c.city AS customer_city,
	of.city AS office_city,
	SUM(od.quantityordered) AS total_unit_terjual,
	ROUND(SUM(od.quantityordered *od.priceeach)/ COUNT (DISTINCT o.ordernumber),2) AS avg_nilai_per_order
FROM customers c
JOIN employees e
ON e.employeenumber = c.salesrepemployeenumber
JOIN offices of
ON of.officecode = e.officecode
JOIN orders o
ON o.customernumber = c.customernumber
JOIN orderdetails od
ON od.ordernumber = o.ordernumber
WHERE of.territory = 'EMEA'
GROUP BY c.customernumber, of.city
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderdate)) > 2 AND SUM(od.quantityordered) > 1000 AND ROUND(SUM(od.quantityordered *od.priceeach)/ COUNT (DISTINCT o.ordernumber),2) > 10000
ORDER BY ROUND(SUM(od.quantityordered *od.priceeach)/ COUNT (DISTINCT o.ordernumber),2) DESC

