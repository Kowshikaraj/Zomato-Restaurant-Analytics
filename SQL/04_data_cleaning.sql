USE zomato_analytics;

DROP TABLE IF EXISTS zomato_clean;

CREATE TABLE zomato_clean AS
SELECT *
FROM zomato_raw;

SELECT COUNT(*)
FROM zomato_clean;

-- What different values exist in the Rating column?
SELECT
rate,
COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY rate
ORDER BY restaurants DESC;

-- How many records contain invalid ratings?
SELECT
    COUNT(*) AS invalid_ratings
FROM zomato_clean
WHERE rate IN ('NEW', '-');


-- Replace invalid rating values ('NEW' and '-') with NULL.
UPDATE zomato_clean
SET rate = NULL
WHERE rate IN ('NEW', '-');

-- Standardize restaurant ratings by removing unnecessary spaces.
UPDATE zomato_clean
SET rate = REPLACE(rate, ' ', '')
WHERE rate IS NOT NULL;

SELECT
    rate,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY rate
ORDER BY rate;

-- Remove '/5' from restaurant ratings.
UPDATE zomato_clean
SET rate = REPLACE(rate, '/5', '')
WHERE rate IS NOT NULL;

SELECT
    rate,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY rate
ORDER BY rate;

-- Is the 'rate' column ready to be converted to a numeric datatype?
SELECT DISTINCT rate
FROM zomato_clean
ORDER BY rate;

SELECT COUNT(*) AS blank_ratings
FROM zomato_clean
WHERE rate = '';

UPDATE zomato_clean
SET rate = NULL
WHERE TRIM(rate) = '';

SELECT COUNT(*) AS blank_ratings
FROM zomato_clean
WHERE TRIM(rate) = '';

SELECT COUNT(*) AS null_ratings
FROM zomato_clean
WHERE rate IS NULL;

ALTER TABLE zomato_clean
MODIFY COLUMN rate DECIMAL(3,2);

-- What different values exist in the 'approx_cost' column?
SELECT
    approx_cost,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY approx_cost
ORDER BY approx_cost;

-- Remove commas from the 'approx_cost' column.
UPDATE zomato_clean
SET approx_cost = REPLACE(approx_cost, ',', '')
WHERE approx_cost IS NOT NULL;

-- Validate that commas have been removed successfully.
SELECT
    approx_cost,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY approx_cost
ORDER BY approx_cost;

-- How many blank values are present in the 'approx_cost' column?
SELECT COUNT(*) AS blank_cost
FROM zomato_clean
WHERE TRIM(approx_cost) = '';

-- How many NULL values are present in the 'approx_cost' column?
SELECT COUNT(*) AS null_cost
FROM zomato_clean
WHERE approx_cost IS NULL;

-- What values are present in the 'online_order' column?
SELECT
    online_order,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY online_order;

-- What values are present in the 'book_table' column?
SELECT
    book_table,
    COUNT(*) AS restaurants
FROM zomato_clean
GROUP BY book_table;



