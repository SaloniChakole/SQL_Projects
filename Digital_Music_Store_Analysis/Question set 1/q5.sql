--q5.who is the best customer ? the customer who spent the most money will be declared 
--the best customer. Write a query that returns the person who has spent the most money.

select c.customer_id,c.first_name,c.last_name,sum(i.total) as invoice_total 
	from customer as c
	join invoice as i
	on c.customer_id=i.customer_id
	group by c.customer_id
	order by invoice_total desc
    limit 1
