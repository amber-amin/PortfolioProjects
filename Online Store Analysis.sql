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



-- Filtering by Date

SELECT orderdate
FROM BIT_DB.FebSales
WHERE orderdate between '02/13/19 00:00' AND '02/18/19 00:00'

SELECT location
FROM BIT_DB.FebSales 
WHERE orderdate = '02/18/19 01:35'

SELECT sum(quantity)
FROM BIT_DB.FebSales 
WHERE orderdate like '02/18/19%'

-- Using 'like' and '%'

SELECT distinct(Product)
FROM BIT_DB.FebSales
WHERE Product like '%Batteries%'

SELECT distinct(Product), Price
FROM BIT_DB.FebSales 
WHERE Price like '%.99'

-- How many products sold in LA in Feb and how much of each were sold

SELECT product, SUM(quantity) as quantity
From BIT_DB.FebSales
WHERE location LIKE '%Los Angeles%'
GROUP BY product

-- Which locations in New York received at least 3 orders in January, and how many orders did they each receive?
SELECT * FROM BIT_DB.JanSales

SELECT DISTINCT(location), COUNT(orderID)
FROM BIT_DB.JanSales
WHERE location LIKE '%New York%'
GROUP BY LOCATION
HAVING COUNT(OrderID) >= 3

-- How many of each type of headphone were sold in February?
SELECT * FROM BIT_DB.FebSales

SELECT DISTINCT Product, Sum(Quantity)
From BIT_DB.FebSales
Where Product LIKE '%Headphones%'
GROUP BY Product


-- What was the average amount spent per account in February?
SELECT * FROM BIT_DB.FebSales

SELECT SUM(Quantity*Price)/Count(customers.acctnum) AS Avg_amount_spent
From BIT_DB.FebSales
LEFT JOIN BIT_DB.customers
ON Febsales.orderID = customers.order_id

-- What was the average quantity of products purchased per account in February?
SELECT SUM(Quantity)/Count(customers.acctnum) AS Avg_quantity_per_acct
FROM BIT_DB.FebSales
LEFT JOIN BIT_DB.customers
ON Febsales.orderID = customers.order_id

-- Which product brought in the most revenue in January and how much revenue did it bring in total?
SELECT * FROM BIT_DB.JanSales

SELECT product, SUM(quantity * price)
FROM BIT_DB.JanSales
GROUP BY Product
ORDER BY SUM(quantity * price) DESC
LIMIT 1