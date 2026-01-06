-- Remove dependent cuisine rows first
DELETE FROM restaurant_cuisines rc
USING restaurants r
WHERE rc.restaurant_id = r.restaurant_id
  AND (
        r.aggregate_rating IS NULL
     OR r.average_cost_for_two IS NULL
     OR r.city IS NULL
     OR r.average_cost_for_two <= 0
  );

-- Remove invalid restaurant records
DELETE FROM restaurants
WHERE aggregate_rating IS NULL
   OR average_cost_for_two IS NULL
   OR city IS NULL
   OR average_cost_for_two <= 0;

-- Standardize city names
UPDATE restaurants
SET city = INITCAP(TRIM(city));



