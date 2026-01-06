SELECT
    c.cuisine_name,
    COUNT(r.restaurant_id) AS total_restaurants,
    ROUND(
        AVG(r.aggregate_rating) / AVG(r.average_cost_for_two),
        4
    ) AS value_for_money_score
FROM restaurants r
JOIN restaurant_cuisines rc
    ON r.restaurant_id = rc.restaurant_id
JOIN cuisines c
    ON rc.cuisine_id = c.cuisine_id
WHERE r.average_cost_for_two > 0
  AND r.aggregate_rating IS NOT NULL
GROUP BY c.cuisine_name
HAVING COUNT(r.restaurant_id) >= 50
ORDER BY value_for_money_score DESC
LIMIT 10;
