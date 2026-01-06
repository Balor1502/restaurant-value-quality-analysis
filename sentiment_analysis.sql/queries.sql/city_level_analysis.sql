SELECT
    city,
    COUNT(*) AS total_restaurants,
    ROUND(
        AVG(aggregate_rating) / AVG(average_cost_for_two),
        4
    ) AS value_for_money_index
FROM restaurants
WHERE average_cost_for_two > 0
  AND aggregate_rating IS NOT NULL
GROUP BY city
HAVING COUNT(*) >= 20
ORDER BY value_for_money_index DESC
LIMIT 10;

