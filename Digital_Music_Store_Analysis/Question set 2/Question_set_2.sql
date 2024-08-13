/*Q1. write a query to return the email, first name, last name and genre of all 
rock music listeners. Return your list ordered alphabetically by email starting with A*/

SELECT DISTINCT email,first_name,last_name
FROM customer c
JOIN invoice i ON c.customer_id=i.customer_id
JOIN invoice_line il ON i.invoice_id=il.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track t
	JOIN genre g ON t.genre_id=g.genre_id
	WHERE g.name LIKE 'Rock'
)
ORDER BY email;

/*Q2. let's invite the artists who have written the most rock music in our dataset.
write a query that returns the Artist name and total track count of the 10 rock bands.*/

SELECT a.artist_id,a.name,COUNT(a.artist_id) AS number_of_songs
FROM track t
JOIN album ab ON ab.album_id=t.album_id
JOIN artist a  ON a.artist_id=ab.artist_id
JOIN genre g ON g.genre_id=t.genre_id
WHERE g.name LIKE 'Rock'
GROUP BY a.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

/* Q3. Return all the track names that have a song length longer than the average
song length. return the name and milliseconds for each track . order by the song length
with the longest songs listed first*/

SELECT name ,milliseconds
FROM track
WHERE milliseconds>(
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track)
ORDER BY milliseconds DESC
)
 