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
SELECT invoiceline.*,
track.name AS "Track Name"
FROM invoiceline 
JOIN Track
WHERE invoiceline.trackid = track.trackid

-- 12. Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT invoiceline.*,
track.name AS "Track Name",
artist.name AS "Artist"
FROM invoiceline 
JOIN Track
JOIN Album
JOIN artist 
WHERE invoiceline.trackid = track.trackid
AND track.albumid = album.albumid
AND album.artistid = artist.artistid

-- 13. Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT COUNT(invoiceid) AS "Invoice Totals", 
invoice.billingcountry
FROM invoice
GROUP BY billingcountry

-- 14. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
SELECT COUNT(track.trackid) AS "Total Tracks",
playlist.name AS "Playlist"
FROM Playlist
JOIN PlaylistTrack
JOIN Track
WHERE playlist.playlistid = playlisttrack.playlistid
AND playlisttrack.trackid = track.trackid
GROUP  BY playlist.name

-- 15. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
SELECT track.name AS "Track", album.title AS "Album", mediatype.name AS "Media Type", genre.name AS "Genre"
FROM Track
JOIN Album
JOIN MediaType
JOIN Genre
WHERE album.albumid = track.albumid
AND mediatype.mediatypeid = track.mediaTypeId
AND genre.genreid = track.genreid

-- 16. Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT invoice.*,
COUNT(invoiceline.invoiceid) AS "Total Line Items"
FROM Invoice
JOIN InvoiceLine
WHERE invoiceline.invoiceid = invoice.invoiceid
GROUP BY invoice.invoiceid

-- 17. Provide a query that shows total sales made by each sales agent.
SELECT COUNT(invoice.invoiceid) AS "Total Invoices",
(employee.firstname || " " || employee.lastname) AS "Employee"
FROM Invoice
JOIN Customer
JOIN Employee
WHERE invoice.customerid = customer.customerid
AND customer.SupportRepId = employee.employeeid
GROUP BY employee.employeeid

-- 18. Which sales agent made the most in sales in 2009?
SELECT COUNT(invoice.invoiceid) AS "Total Invoices",
(employee.firstname || " " || employee.lastname) AS "Employee"
FROM Invoice
JOIN Customer
JOIN Employee
WHERE invoice.customerid = customer.customerid
AND customer.SupportRepId = employee.employeeid
AND invoice.invoicedate LIKE '%2009%'
GROUP BY employee.employeeid
ORDER BY COUNT(invoice.invoiceid) DESC 
LIMIT 1

-- Margaret Park

-- 19. Which sales agent made the most in sales in 2010?
SELECT COUNT(invoice.invoiceid) AS "Total Invoices",
(employee.firstname || " " || employee.lastname) AS "Employee"
FROM Invoice
JOIN Customer
JOIN Employee
WHERE invoice.customerid = customer.customerid
AND customer.SupportRepId = employee.employeeid
AND invoice.invoicedate LIKE '%2010%'
GROUP BY employee.employeeid
ORDER BY COUNT(invoice.invoiceid) DESC 
LIMIT 1

-- Jane Peacock

-- 20. Which sales agent made the most in sales over all?
SELECT COUNT(invoice.invoiceid) AS "Total Invoices",
(employee.firstname || " " || employee.lastname) AS "Employee"
FROM Invoice
JOIN Customer
JOIN Employee
WHERE invoice.customerid = customer.customerid
AND customer.SupportRepId = employee.employeeid
GROUP BY employee.employeeid
ORDER BY COUNT(invoice.invoiceid) DESC 
LIMIT 1

-- Jane Peacock

-- 21. Provide a query that shows the # of customers assigned to each sales agent.
SELECT COUNT(customer.customerid) AS "Total Customers", 
(employee.firstname || " " || employee.lastname) AS "Sales Rep"
FROM Customer
JOIN Employee
WHERE customer.supportrepid = employee.employeeid
GROUP BY employee.employeeid


-- 22. Provide a query that shows the total sales per country. Which country's customers spent the most?
SELECT COUNT(invoiceid) AS "Total Invoices", billingcountry AS "Country"
FROM Invoice
GROUP BY billingcountry
ORDER BY COUNT(invoiceid) DESC

-- USA customers spent the most

-- 23. Provide a query that shows the most purchased track of 2013.


-- 24. Provide a query that shows the top 5 most purchased tracks over all.
SELECT COUNT(invoice.invoiceid) AS "Total Invoices", track.name
FROM Invoice
JOIN invoiceline 
JOIN track
WHERE invoiceline.InvoiceId = invoice.invoiceid 
AND invoiceline.trackid = track.trackid 
GROUP BY track.name 
ORDER BY COUNT(invoice.invoiceid) DESC
LIMIT 5

-- 25. Provide a query that shows the top 3 best selling artists.
SELECT COUNT(invoiceline.invoicelineid) AS "Total Invoices", artist.name AS "Artist Name"
FROM Invoiceline
JOIN artist 
JOIN Album
JOIN Track
WHERE invoiceline.trackid = track.trackid
AND track.albumid = album.albumid
AND album.artistid = artist.artistid
GROUP BY artist.Name
ORDER BY COUNT(invoiceline.invoicelineid) desc
LIMIT 3

-- 26. Provide a query that shows the most purchased Media Type.
SELECT COUNT(invoiceline.invoicelineid) AS "Total Invoices", mediatype.name AS "Media Type"
FROM Invoiceline
JOIN track
JOIN mediatype
WHERE invoiceline.trackid = track.trackid
AND mediatype.mediatypeid = track.mediatypeid
GROUP BY mediatype.name
ORDER BY COUNT(invoiceline.invoicelineid) desc
LIMIT 3

-- 27. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.

