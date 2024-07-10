ex1 
select distinct(replacement_cost)
from public.film 
ORDER BY replacement_cost asc
ex2
SELECT 
    COUNT(*) AS low_count
FROM (
    SELECT 
        CASE 
            WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
            WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
            WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
            ELSE 'other'
        END AS category
    FROM film
) AS categorized_films
WHERE category = 'low';
ex3 
SELECT 
    f.title AS film_title,
    f.length,
    c.name AS category_name
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
WHERE c.name IN ('Drama', 'Sports')
ORDER BY f.length DESC; 
ex 4 
select 
	c.name as category_name,
	count(f.film_id) as film_count 
	from category as c 
	join film_category as fc on c.category_id = fc.category_id
join film as f on fc.film_id = f.film_id 
group by c.name 
order by film_count desc
ex5 
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor as a
JOIN film_actor as fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC;
ex6 
SELECT a.address_id, a.address, a.district, a.city_id, a.postal_code
FROM address a
LEFT JOIN customer c ON a.address_id = c.address_id
WHERE c.address_id IS NULL;
ex7 
SELECT cy.city, SUM(p.amount) AS total_revenue
FROM city cy
JOIN address a ON cy.city_id = a.city_id
JOIN customer c ON a.address_id = c.address_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY cy.city
ORDER BY total_revenue DESC
LIMIT 1;

