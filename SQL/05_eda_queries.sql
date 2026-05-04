USE zomato_analytics;
-- How many restaurants are available?
SELECT COUNT(*) AS total_restaurants
FROM zomato_clean;

-- How many unique locations are available?
SELECT COUNT(DISTINCT location)
AS total_locations
FROM zomato_clean;

-- How many unique cuisines are available?
SELECT COUNT(DISTINCT cuisines)
AS total_cuisines
FROM zomato_clean;

-- How many restaurant types exist?
SELECT COUNT(DISTINCT rest_type)
AS total_restaurant_types
FROM zomato_clean;

-- Average restaurant rating
SELECT
ROUND(AVG(rate),2)
AS average_rating
FROM zomato_clean;

-- Highest rated restaurants
SELECT
name,
location,
rate
FROM zomato_clean
ORDER BY rate DESC
LIMIT 20;

-- Lowest rated restaurants
SELECT
name,
location,
rate
FROM zomato_clean
WHERE rate IS NOT NULL
ORDER BY rate
LIMIT 20;

-- Average votes
SELECT
ROUND(AVG(votes),2)
AS average_votes
FROM zomato_clean;

-- Restaurants with highest votes
SELECT
name,
location,
votes
FROM zomato_clean
ORDER BY votes DESC
LIMIT 20;

-- Cheapest restaurants
SELECT
name,
location,
approx_cost
FROM zomato_clean
ORDER BY approx_cost
LIMIT 20;

-- Most expensive restaurants
SELECT
name,
location,
approx_cost
FROM zomato_clean
ORDER BY approx_cost DESC
LIMIT 20;

-- Restaurants by location 
SELECT
location,
COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY location
ORDER BY restaurants DESC;

-- Top rated locations
SELECT
location,
ROUND(AVG(rate),2) AS avg_rating
FROM zomato_clean
GROUP BY location
ORDER BY avg_rating DESC;

-- Most common cuisines
SELECT
cuisines,
COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY cuisines
ORDER BY restaurants DESC
LIMIT 20;

-- Most common restaurant types
SELECT
rest_type,
COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY rest_type
ORDER BY restaurants DESC;

