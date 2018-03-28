-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT CustomerId "ID", FirstName "First Name", LastName "Last Name", Country FROM Customer 
WHERE customer.country NOT LIKE 'USA'

-- 2. Provide a query only showing the Customers from Brazil.
SELECT FirstName || " " || LastName AS "Full Name" FROM Customer 
WHERE Country = 'Brazil'

-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT (customer.FirstName || " " || customer.LastName) AS "Full Name",
invoice.InvoiceId, invoice.InvoiceDate "Invoice Date", invoice.BillingCountry "Billing Country"
FROM Invoice
JOIN Customer
ON customer.country = "Brazil"

-- 4. Provide a query showing only the Employees who are Sales Agents.
SELECT * FROM Employee 
WHERE title = "Sales Support Agent"

-- 5. Provide a query showing a unique list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice

-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT invoice.InvoiceId, invoice.Total, invoice.CustomerId, invoice.invoiceDate, (employee.FirstName || " " || employee.LastName) AS "Full Name" FROM Invoice
JOIN Customer
JOIN Employee 
WHERE customer.SupportRepId = employee.EmployeeId

-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT invoice.total, (customer.firstName || " " || customer.lastName) AS "Full Name", customer.country, (employee.firstName || " " || employee.lastName) AS "Employee Name" FROM Invoice
JOIN Customer
JOIN Employee 
WHERE customer.SupportRepId = employee.employeeid

-- 8. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT COUNT(invoice.invoiceid) AS "Total Invoices",
SUM(Total) as 'Total Sales',
STRFTIME('%Y', invoicedate) as "Year"
FROM Invoice
WHERE invoice.InvoiceDate LIKE '%2009%'
OR invoice.invoiceDate LIKE '%2011%'
GROUP BY year

-- 9. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(*) AS "Invoice 37 Total"
FROM InvoiceLine
WHERE InvoiceLine.InvoiceId = '37'

-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT COUNT(*) AS "Invoice Totals",
invoiceline.invoiceid
FROM InvoiceLine
GROUP BY invoiceline.invoiceid

-- 11. Provide a query that includes the track name with each invoice line item.


-- 12. Provide a query that includes the purchased track name AND artist name with each invoice line item.


-- 13. Provide a query that shows the # of invoices per country. HINT: GROUP BY


-- 14. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.


-- 15. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.


-- 16. Provide a query that shows all Invoices but includes the # of invoice line items.


-- 17. Provide a query that shows total sales made by each sales agent.


-- 18. Which sales agent made the most in sales in 2009?


-- 19. Which sales agent made the most in sales in 2010?


-- 20. Which sales agent made the most in sales over all?


-- 21. Provide a query that shows the # of customers assigned to each sales agent.


-- 22. Provide a query that shows the total sales per country. Which country's customers spent the most?


-- 23. Provide a query that shows the most purchased track of 2013.


-- 24. Provide a query that shows the top 5 most purchased tracks over all.


-- 25. Provide a query that shows the top 3 best selling artists.


-- 26. Provide a query that shows the most purchased Media Type.


-- 27. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.

