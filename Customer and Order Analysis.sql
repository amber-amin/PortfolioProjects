-- Show Customers (their full names, customer ID, and country) who are not in the US. (Hint: != or <> can be used to say "is not equal to").
SELECT * FROM chinook.customers WHERE country != 'USA'

-- Show only the Customers from Brazil
SELECT * FROM chinook.customers WHERE country = 'Brazil'

-- Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.
SELECT Customers.firstname, customers.lastname, invoices.invoiceid, invoices.invoicedate, invoices.billingcountry
FROM chinook.customers
LEFT JOIN chinook.invoices 
ON customers.customerid = invoices.customerid
WHERE billingcountry = 'Brazil'

-- Show the Employees who are Sales Agents
SELECT * FROM chinook.employees WHERE title = 'Sales Support Agent'

-- Find a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT billingcountry FROM chinook.invoices

-- Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.
SELECT firstname, lastname, invoices.*
FROM chinook.employees
FULL OUTER JOIN chinook.customers
ON employees.employeeid = customers.supportrepid
FULL OUTER JOIN chinook.invoices
ON invoices.customerid = customers.customerid
WHERE title = 'Sales Support Agent'

-- Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.
SELECT customers.firstname, customers.lastname, customers.country, invoices.total, employees.firstname, employees.lastname
FROM chinook.invoices
JOIN chinook.customers
ON invoices.customerid = customers.customerid
JOIN chinook.employees
ON customers.supportrepid = employees.employeeid
WHERE title = 'Sales Support Agent'

-- How many Invoices were there in 2009?
SELECT COUNT (InvoiceDate)
FROM chinook.invoices
WHERE InvoiceDate LIKE '%2009%'

-- What are the total sales for 2009?
SELECT SUM(Total)
FROM chinook.invoices
WHERE InvoiceDate LIKE '%2009%'

-- Write a query that includes the purchased track name with each invoice line ID
SELECT tracks.name, invoice_items.invoicelineid
FROM chinook.tracks
JOIN chinook.invoice_items
ON tracks.trackid = invoice_items.trackid

-- Write a query that includes the purchased track name AND artist name with each invoice line ID.
SELECT tracks.name, artists.name AS artist, invoice_items.invoicelineid
FROM chinook.tracks
JOIN chinook.artists
ON tracks.trackid = artists.ArtistId
JOIN chinook.invoice_items
ON artists.ArtistId = invoice_items.TrackId
GROUP BY tracks.name