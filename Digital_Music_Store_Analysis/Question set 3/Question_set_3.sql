/* Q1. Find how much amount spent by each customer on artists?
write a query to return customer name, artist name and total spent.*/

WITH best_selling_artist AS (
	SELECT a.artist_id as artist_is,a.name as artist_name,
	SUM(il2.unit_price*il2.quantity) as total_sales
	FROM invoice_line il2
	JOIN track t2 ON t2.track_id=il2.track_id 
	JOIN album ab2 ON ab2.album_id=t2.album_id
	JOIN artist a ON a.artist_id=ab2.artist_id
	GROUP BY 1
	ORDER BY 3 DESC
	LIMIT 1
)
SELECT c.customer_id,c.first_name,c.last_name,bsa.artist_name,SUM(il.unit_price*il.quantity) as amount_spent
FROM invoice i
JOIN customer c on c.customer_id=i.customer_id
JOIN invoice_line il on i.invoice_id=il.invoice_id
JOIN track t ON t.track_id=il.track_id
JOIN album ab ON ab.album_id=t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id=ab.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC;