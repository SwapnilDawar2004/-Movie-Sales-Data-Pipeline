--SQL queries for Analysis
-- How much sales we made from the particular film
select p.payment_id, p.rental_id, p.amount,r.inventory_id,f.title  from payment as p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON  i.film_id = f.film_id

-- how much money a particular movie made
select f.title, sum(p.amount), as revenue from payment as p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON  i.film_id = f.film_id
GROUP BY f.title
ORDER BY sum(p.amount) DESC

-- Top city that is providing us the revenue
select f.title, c.city_id, c.city,sum(p.amount) as revenue from city as c
JOIN address a ON c.city_id = a.city_id
JOIN customer cu ON a.address_id = cu.address_id
JOIN payment p ON cu.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON  i.film_id = f.film_id
GROUP BY f.title, c.city_id
ORDER BY sum(p.amount) DESC
