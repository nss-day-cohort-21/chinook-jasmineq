-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName, LastName, CustomerId, COUNTRY FROM CUSTOMER WHERE COUNTRY != 'USA'

-- 2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT CustomerId, Country FROM CUSTOMER WHERE COUNTRY = 'Brazil'

-- 3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT CUSTOMER.FirstName, CUSTOMER.LastName, INVOICE.InvoiceId, INVOICE.InvoiceDate, INVOICE.BillingCountry FROM CUSTOMER
JOIN INVOICE ON CUSTOMER.CustomerId = INVOICE.CustomerId

-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT * FROM EMPLOYEE WHERE TITLE = 'Sales Support Agent'

-- 5. unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM INVOICE
ORDER BY INVOICE.BillingCountry ASC

-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT cust.SupportRepId, emp.FirstName, emp.LastName, inv.InvoiceId
FROM CUSTOMER AS cust LEFT JOIN EMPLOYEE AS emp ON cust.SupportRepId = emp.EmployeeId
LEFT JOIN INVOICE AS inv ON cust.CustomerId = inv.CustomerId;

-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT cust.FirstName, cust.LastName, cust.Country, emp.FirstName, emp.LastName, inv.Total
FROM CUSTOMER AS cust LEFT JOIN EMPLOYEE AS emp ON cust.SupportRepId = emp.EmployeeId
LEFT JOIN INVOICE AS inv ON cust.CustomerId = inv.CustomerId;

-- 8. total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
-- Total number of Invoices in 2009
SELECT COUNT (*) FROM INVOICE WHERE InvoiceDate BETWEEN  '2009-01-01' AND '2009-12-31';
-- Total number of Invoices in 2011
SELECT COUNT (*) FROM INVOICE WHERE InvoiceDate BETWEEN  '2011-01-01' AND '2011-12-31';


-- 9. total_sales_{year}.sql: What are the respective total sales for each of those years?
- Total Sales during 2009
SELECT SUM (TOTAL) FROM INVOICE WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';
-- Total Sales during 2011
SELECT SUM (TOTAL) FROM INVOICE WHERE InvoiceDate BETWEEN '2011-01-01' AND '2011-12-31';

-- 10. invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(InvoiceId) FROM InvoiceLine WHERE InvoiceId = 37;

-- 11. line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT COUNT (InvoiceLineId) FROM INVOICELINE
GROUP BY InvoiceId

-- 12. line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT TRACK.Name, INVOICELINE.InvoiceLineId FROM TRACK, INVOICELINE
WHERE TRACK.TrackId = INVOICELINE.TrackId

-- 13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT TRACK.Name, TRACK.Composer, INVOICELINE.InvoiceLineId FROM TRACK, InvoiceLine
WHERE TRACK.TrackId = INVOICELINE.TrackId

-- 14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT BillingCountry, COUNT( InvoiceId) FROM INVOICE
GROUP BY BillingCountry

-- 15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

-- 16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

-- 17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

-- 18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

-- 19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?

-- 20. Hint: Use the MAX function on a subquery.
-- top_agent.sql: Which sales agent made the most in sales over all?

-- 21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

-- 22. sales_per_country.sql: Provide a query that shows the total sales per country.

-- 23. top_country.sql: Which country's customers spent the most?

-- 24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

-- 25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

-- 26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

-- 27. top_media_type.sql: Provide a query that shows the most purchased Media Type.
