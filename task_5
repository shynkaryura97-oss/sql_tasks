-- 5. Вывести топ-3 актеров, которые чаще всего появлялись в фильмах категории "Children". 
-- Если несколько актеров имеют одинаковое количество фильмов, вывести всех.
WITH actor_children_counts AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS children_movie_count,
        DENSE_RANK() OVER (ORDER BY COUNT(fa.film_id) DESC) as rank
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    JOIN 
        film_category fc ON fa.film_id = fc.film_id
    JOIN 
        category c ON fc.category_id = c.category_id
    WHERE 
        c.name = 'Children'
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
)
SELECT 
    actor_id,
    first_name,
    last_name,
    children_movie_count
FROM 
    actor_children_counts
WHERE 
    rank <= 3
ORDER BY 
    children_movie_count DESC, actor_id;
