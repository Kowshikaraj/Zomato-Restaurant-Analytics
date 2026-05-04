USE zomato_analytics;

-- Do restaurants offering online ordering receive higher ratings?
SELECT
    online_order,
    ROUND(AVG(rate),2) AS average_rating,
    COUNT(*) AS total_restaurants
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY online_order;

-- Does table booking influence restaurant ratings?
SELECT
    book_table,
    ROUND(AVG(rate),2) AS average_rating,
    COUNT(*) AS total_restaurants
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY book_table;

-- Does online ordering increase customer engagement?
SELECT
    online_order,
    ROUND(AVG(votes),0) AS average_votes,
    SUM(votes) AS total_votes
FROM zomato_clean
GROUP BY online_order;

-- Does table booking increase customer engagement?
SELECT
    book_table,
    ROUND(AVG(votes),0) AS average_votes,
    SUM(votes) AS total_votes
FROM zomato_clean
GROUP BY book_table;

-- Which locations have the highest average restaurant ratings?
SELECT
    location,
    ROUND(AVG(rate),2) AS average_rating,
    COUNT(*) AS total_restaurants
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY location
HAVING COUNT(*) >= 20
ORDER BY average_rating DESC;

-- Which locations have the highest customer engagement?
SELECT
    location,
    SUM(votes) AS total_votes
FROM zomato_clean
GROUP BY location
ORDER BY total_votes DESC;

-- Which locations have the highest restaurant density?
SELECT
    location,
    COUNT(*) AS total_restaurants
FROM zomato_clean
GROUP BY location
ORDER BY total_restaurants DESC;

-- Which cuisines receive the highest average ratings?
SELECT
    cuisines,
    ROUND(AVG(rate),2) AS average_rating,
    COUNT(*) AS total_restaurants
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY cuisines
HAVING COUNT(*) >= 10
ORDER BY average_rating DESC
LIMIT 20;

-- Which cuisines receive the highest customer engagement?
SELECT
    cuisines,
    SUM(votes) AS total_votes,
    ROUND(AVG(votes),0) AS average_votes
FROM zomato_clean
GROUP BY cuisines
ORDER BY total_votes DESC
LIMIT 20;

-- Which restaurant types receive the highest average ratings?
SELECT
    rest_type,
    ROUND(AVG(rate),2) AS average_rating,
    COUNT(*) AS total_restaurants
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY rest_type
HAVING COUNT(*) >= 10
ORDER BY average_rating DESC;

-- Which restaurant types receive the highest customer engagement?
SELECT
    rest_type,
    SUM(votes) AS total_votes,
    ROUND(AVG(votes),0) AS average_votes
FROM zomato_clean
GROUP BY rest_type
ORDER BY total_votes DESC;

-- Which are the top 10 restaurants based on rating and customer votes?
SELECT
    name,
    location,
    cuisines,
    rate,
    votes
FROM zomato_clean
WHERE rate IS NOT NULL
ORDER BY rate DESC, votes DESC
LIMIT 10;

-- Which locations have high restaurant density but relatively low customer ratings?
SELECT
    location,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY location
HAVING COUNT(*) >= 50
ORDER BY average_rating ASC;

-- Which locations have high ratings but relatively few restaurants?
SELECT
    location,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY location
HAVING COUNT(*) BETWEEN 10 AND 40
ORDER BY average_rating DESC;

-- Which cuisines have excellent ratings but low market presence?
SELECT
    cuisines,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY cuisines
HAVING COUNT(*) < 20
ORDER BY average_rating DESC;

-- Which restaurant types have excellent ratings but low competition?
SELECT
    rest_type,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY rest_type
HAVING COUNT(*) < 20
ORDER BY average_rating DESC;

-- Which locations have the highest average dining cost?
SELECT
    location,
    ROUND(AVG(CAST(NULLIF(approx_cost,'') AS UNSIGNED)),0) AS average_cost
FROM zomato_clean
GROUP BY location
ORDER BY average_cost DESC;

-- Which cuisines have the highest average dining cost?
SELECT
    cuisines,
    ROUND(AVG(CAST(NULLIF(approx_cost,'') AS UNSIGNED)),0) AS average_cost
FROM zomato_clean
GROUP BY cuisines
ORDER BY average_cost DESC
LIMIT 20;

-- Do higher-priced restaurants receive better ratings?
SELECT
CASE
    WHEN CAST(NULLIF(approx_cost,'') AS UNSIGNED) < 300 THEN 'Budget'
    WHEN CAST(NULLIF(approx_cost,'') AS UNSIGNED) BETWEEN 300 AND 700 THEN 'Mid Range'
    ELSE 'Premium'
END AS price_category,
ROUND(AVG(rate),2) AS average_rating,
COUNT(*) AS restaurants
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY price_category;

-- Which premium restaurants have poor customer ratings?
SELECT
    name,
    location,
    approx_cost,
    rate
FROM zomato_clean
WHERE CAST(NULLIF(approx_cost,'') AS UNSIGNED) >= 1000
AND rate < 3.5
ORDER BY rate;

-- Which budget restaurants receive excellent customer ratings?
SELECT
    name,
    location,
    approx_cost,
    rate
FROM zomato_clean
WHERE CAST(NULLIF(approx_cost,'') AS UNSIGNED) <= 300
AND rate >= 4.5
ORDER BY rate DESC;

-- Which restaurants combine high ratings and high customer engagement?
SELECT
    name,
    location,
    cuisines,
    rate,
    votes
FROM zomato_clean
WHERE rate >= 4.5
AND votes >= 500
ORDER BY votes DESC;

-- Which restaurants have high customer votes despite average ratings?
SELECT
    name,
    location,
    rate,
    votes
FROM zomato_clean
WHERE rate BETWEEN 3.5 AND 4.0
ORDER BY votes DESC
LIMIT 20;

-- Which locations generate the highest total customer votes while maintaining strong ratings?
SELECT
    location,
    SUM(votes) AS total_votes,
    ROUND(AVG(rate),2) AS average_rating
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY location
ORDER BY total_votes DESC, average_rating DESC;
-- Which restaurants perform above the average rating of their location?
SELECT
    name,
    location,
    rate
FROM zomato_clean z1
WHERE rate >
(
    SELECT AVG(rate)
    FROM zomato_clean z2
    WHERE z1.location = z2.location
)
ORDER BY location, rate DESC;

-- Which are the top 3 highest-rated restaurants in each location?
WITH ranked_restaurants AS
(
SELECT
    name,
    location,
    rate,
    votes,
    DENSE_RANK() OVER(PARTITION BY location ORDER BY rate DESC, votes DESC) AS ranking
FROM zomato_clean
WHERE rate IS NOT NULL
)
SELECT *
FROM ranked_restaurants
WHERE ranking <= 3
ORDER BY location, ranking;

-- Rank restaurants based on customer votes.
SELECT
    name,
    location,
    votes,
    RANK() OVER(ORDER BY votes DESC) AS vote_rank
FROM zomato_clean;

-- Rank cuisines by customer engagement.
SELECT
    cuisines,
    SUM(votes) AS total_votes,
    DENSE_RANK() OVER(ORDER BY SUM(votes) DESC) AS cuisine_rank
FROM zomato_clean
GROUP BY cuisines;

-- Which locations have the highest average customer engagement per restaurant?
SELECT
    location,
    ROUND(AVG(votes),0) AS average_votes
FROM zomato_clean
GROUP BY location
ORDER BY average_votes DESC;

-- Which restaurants are hidden gems with excellent ratings but low customer visibility?
SELECT
    name,
    location,
    cuisines,
    rate,
    votes
FROM zomato_clean
WHERE rate >= 4.5
AND votes < 100
ORDER BY rate DESC;

-- Which restaurant categories have the highest business potential?
SELECT
    rest_type,
    ROUND(AVG(rate),2) AS average_rating,
    ROUND(AVG(votes),0) AS average_votes,
    COUNT(*) AS total_restaurants
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY rest_type
HAVING COUNT(*) >= 20
ORDER BY average_rating DESC, average_votes DESC;

-- Which locations provide the best opportunity for restaurant expansion?
SELECT
    location,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating,
    ROUND(AVG(votes),0) AS average_votes
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY location
HAVING COUNT(*) BETWEEN 20 AND 60
ORDER BY average_rating DESC, average_votes DESC;

-- Which cuisines are highly rated but underrepresented in the market?
SELECT
    cuisines,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rate),2) AS average_rating
FROM zomato_clean
WHERE rate IS NOT NULL
GROUP BY cuisines
HAVING COUNT(*) < 15
ORDER BY average_rating DESC;

-- Which restaurants should Zomato recommend as premium choices?
SELECT
    name,
    location,
    cuisines,
    rate,
    votes,
    approx_cost
FROM zomato_clean
WHERE rate >= 4.5
AND votes >= 500
ORDER BY rate DESC, votes DESC;

-- What are the overall business KPIs for the Zomato restaurant dataset?
SELECT
    COUNT(*) AS total_restaurants,
    COUNT(DISTINCT location) AS total_locations,
    COUNT(DISTINCT cuisines) AS total_cuisines,
    ROUND(AVG(rate),2) AS average_rating,
    ROUND(AVG(votes),0) AS average_votes,
    MAX(rate) AS highest_rating,
    MAX(votes) AS highest_votes
FROM zomato_clean;