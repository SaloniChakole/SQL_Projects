--q4.which city has the best customers? we would like to throw a promotional Music Festival
--in the city we made the most money. write a query that returns one city that has the highest
--sum of invoice totals. Return both the city name and sum of all invoice totals.

select billing_city,sum(total) as invoice_total from invoice
	group by billing_city
	order by invoice_total desc
	limit 1
