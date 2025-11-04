-- 6. Вывести города с количеством активных и неактивных клиентов (active - customer.active = 1). 
-- Сортировать по количеству неактивных клиентов в порядке убывания.
SELECT 
    ci.city_id,
    ci.city,
    COUNT(CASE WHEN c.active = 1 THEN 1 END) AS active_customers,
    COUNT(CASE WHEN c.active = 0 THEN 1 END) AS inactive_customers
FROM 
    city ci
JOIN 
    address a ON ci.city_id = a.city_id
JOIN 
    customer c ON a.address_id = c.address_id
GROUP BY 
    ci.city_id, ci.city
ORDER BY 
    inactive_customers DESC;
