SELECT COUNT(*) AS total_restaurants
FROM restaurants;

SELECT COUNT(DISTINCT c.cuisine_name) AS total_cuisines
FROM cuisines c
JOIN restaurant_cuisines rc
  ON c.cuisine_id = rc.cuisine_id;

SELECT ROUND(AVG(aggregate_rating), 2) AS avg_rating
FROM restaurants
WHERE aggregate_rating IS NOT NULL;


SELECT
  PERCENTILE_CONT(0.5)
  WITHIN GROUP (ORDER BY average_cost_for_two) AS median_cost_for_two
FROM restaurants
WHERE average_cost_for_two > 0;
