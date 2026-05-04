USE zomato_analytics;

-- Total Rows
SELECT COUNT(*) AS total_rows
FROM zomato_raw;

-- Total Columns
SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='zomato_analytics'
AND TABLE_NAME='zomato_raw';

-- Preview Dataset
SELECT *
FROM zomato_raw
LIMIT 10;

-- Check NULL values
SELECT
    SUM(name IS NULL) AS missing_name,
    SUM(address IS NULL) AS missing_address,
    SUM(location IS NULL) AS missing_location,
    SUM(phone IS NULL) AS missing_phone,
    SUM(rate IS NULL) AS missing_rate,
    SUM(rest_type IS NULL) AS missing_rest_type,
    SUM(dish_liked IS NULL) AS missing_dish_liked,
    SUM(cuisines IS NULL) AS missing_cuisines,
    SUM(approx_cost IS NULL) AS missing_cost,
    SUM(reviews_list IS NULL) AS missing_reviews,
    SUM(menu_item IS NULL) AS missing_menu
FROM zomato_raw;

-- How many blank values are present in important columns?
SELECT
SUM(TRIM(name)='') AS blank_name,
SUM(TRIM(address)='') AS blank_address,
SUM(TRIM(phone)='') AS blank_phone,
SUM(TRIM(location)='') AS blank_location,
SUM(TRIM(rest_type)='') AS blank_rest_type,
SUM(TRIM(cuisines)='') AS blank_cuisines
FROM zomato_raw;

-- How many unique restaurants are available?
SELECT
COUNT(*) AS total_records,
COUNT(DISTINCT name) AS unique_restaurants
FROM zomato_raw;

-- Which restaurants have multiple records?
SELECT
name,
COUNT(*) AS total_branches
FROM zomato_raw
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY total_branches DESC
LIMIT 20;

-- What different rating values exist in the dataset?
SELECT rate, COUNT(*) AS total_restaurants
FROM zomato_raw
GROUP BY rate
ORDER BY total_restaurants DESC;

-- What online ordering options are available?
SELECT online_order, COUNT(*) AS restaurants
FROM zomato_raw
GROUP BY online_order;

-- What table booking options are available?
SELECT book_table, COUNT(*) AS restaurants
FROM zomato_raw
GROUP BY book_table;

-- Which restaurant types are available?
SELECT rest_type, COUNT(*) AS restaurants
FROM zomato_raw
GROUP BY rest_type
ORDER BY restaurants DESC;

-- Which cuisines appear most frequently?
SELECT cuisines, COUNT(*) AS restaurants
FROM zomato_raw
GROUP BY cuisines
ORDER BY restaurants DESC
LIMIT 20;

-- Which locations have the highest number of restaurants?
SELECT location, COUNT(*) AS restaurants
FROM zomato_raw
GROUP BY location
ORDER BY restaurants DESC;

-- What is the range of customer votes?
SELECT
    MIN(votes) AS minimum_votes,
    MAX(votes) AS maximum_votes,
    AVG(votes) AS average_votes
FROM zomato_raw;

-- Preview the Approximate Cost column.
SELECT DISTINCT approx_cost
FROM zomato_raw
ORDER BY approx_cost
LIMIT 20;
-- Which listed cities are available?
SELECT
    listed_in_city,
    COUNT(*) AS restaurants
FROM zomato_raw
GROUP BY listed_in_city
ORDER BY restaurants DESC;
-- Which restaurant categories are available?
SELECT
    listed_in_type,
    COUNT(*) AS restaurants
FROM zomato_raw
GROUP BY listed_in_type
ORDER BY restaurants DESC;


-- DATA PROFILING SUMMARY

-- 1. Total Records : 51,717

-- 2. Total Columns : 17

-- 3. No SQL NULL values found.

-- 4. Missing information is represented as:
--    - NEW
--    - -
--    - Blank strings
--    - []

-- 5. Rating column requires cleaning.

-- 6. Approximate Cost column requires datatype conversion.

-- 7. Duplicate restaurant names exist because restaurants have multiple branches.

-- 8. Restaurant Type contains multiple combined values.

-- 9. Cuisines column contains multiple cuisines separated by commas.

-- 10. Dataset is ready for data cleaning.
