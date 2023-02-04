-- How many orders were placed in January:

SELECT * FROM BIT_DB.JanSales
SELECT COUNT(orderID) FROM BIT_DB.JanSales

-- How many of those orders were placed for an iPhone:
SELECT COUNT(Product) FROM BIT_DB.JanSales WHERE Product = 'iPhone'

-- Selecing account numbers for all the order placed in Feb
SELECT * FROM BIT_DB.customers
SELECT * FROM BIT_DB.FebSales

SELECT DISTINCT customers.acctnum From BIT_DB.customers JOIN BIT_DB.FebSales ON customers.order_id = FebSales.orderID

-- Cheapest product sold in January, and the price
SELECT * FROM BIT_DB.JanSales

SELECT DISTINCT(product) AS cheapest_product, MIN(Price) AS cheapest_price FROM BIT_DB.JanSales

-- Total Revenue for each product sold in Jan
SELECT * FROM BIT_DB.JanSales

SELECT (SUM(Quantity) * price) AS total_jan_revenue, product FROM BIT_DB.JanSales GROUP BY product

-- Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?
SELECT product, SUM(quantity) AS how_many_sold, (SUM(quantity) * price) AS revenue
FROM BIT_DB.FebSales
WHERE location = '548 Lincoln St, Seattle, WA 98101'
GROUP BY product 

-- How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers?
SELECT * FROM BIT_DB.customers
SELECT * FROM BIT_DB.FebSales

SELECT COUNT(DISTINCT(customers.acctnum)), AVG(FebSales.price * FebSales.Quantity) AS avg_amount_spent
FROM BIT_DB.FebSales
LEFT JOIN BIT_DB.customers
ON FebSales.orderID = customers.order_id
WHERE Quantity > 2