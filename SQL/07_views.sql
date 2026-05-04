USE zomato_analytics;

-- Restaurant performance view
CREATE OR REPLACE VIEW vw_restaurant_performance AS
SELECT
    name,
    location,
    cuisines,
    rest_type,
    rate,
    votes,
    approx_cost,
    online_order,
    book_table
FROM zomato_clean;

-- Location analysis view
CREATE OR REPLACE VIEW vw_location_analysis AS
SELECT
    location,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating,
    ROUND(AVG(votes),0) AS average_votes,
    ROUND(AVG(CAST(NULLIF(approx_cost,'') AS UNSIGNED)),0) AS average_cost
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY location;

-- Cuisine analysis view
CREATE OR REPLACE VIEW vw_cuisine_analysis AS
SELECT
    cuisines,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating,
    SUM(votes) AS total_votes,
    ROUND(AVG(CAST(NULLIF(approx_cost,'') AS UNSIGNED)),0) AS average_cost
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY cuisines;

-- Restaurant type analysis view
CREATE OR REPLACE VIEW vw_rest_type_analysis AS
SELECT
    rest_type,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating,
    SUM(votes) AS total_votes
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY rest_type;

-- Online order analysis view
CREATE OR REPLACE VIEW vw_online_order_analysis AS
SELECT
    online_order,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating,
    ROUND(AVG(votes),0) AS average_votes
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY online_order;

-- Table booking analysis view
CREATE OR REPLACE VIEW vw_book_table_analysis AS
SELECT
    book_table,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating,
    ROUND(AVG(votes),0) AS average_votes
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY book_table;

-- Premium restaurants view
CREATE OR REPLACE VIEW vw_premium_restaurants AS
SELECT
    name,
    location,
    cuisines,
    rate,
    votes,
    approx_cost
FROM zomato_clean
WHERE CAST(NULLIF(approx_cost,'') AS UNSIGNED) >= 1000
ORDER BY rate DESC, votes DESC;

-- Top restaurants view
CREATE OR REPLACE VIEW vw_top_restaurants AS
SELECT
    name,
    location,
    cuisines,
    rest_type,
    rate,
    votes,
    approx_cost
FROM zomato_clean
WHERE rate >= 4.5
ORDER BY votes DESC;

-- Customer engagement view
CREATE OR REPLACE VIEW vw_customer_engagement AS
SELECT
    name,
    location,
    rate,
    votes,
    online_order,
    book_table
FROM zomato_clean
ORDER BY votes DESC;

-- Executive summary view
CREATE OR REPLACE VIEW vw_executive_summary AS
SELECT
    COUNT(*) AS total_restaurants,
    COUNT(DISTINCT location) AS total_locations,
    COUNT(DISTINCT cuisines) AS total_cuisines,
    ROUND(AVG(rate),2) AS average_rating,
    ROUND(AVG(votes),0) AS average_votes,
    ROUND(AVG(CAST(NULLIF(approx_cost,'') AS UNSIGNED)),0) AS average_cost,
    MAX(rate) AS highest_rating,
    MAX(votes) AS highest_votes
FROM zomato_clean;