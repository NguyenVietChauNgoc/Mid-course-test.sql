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
