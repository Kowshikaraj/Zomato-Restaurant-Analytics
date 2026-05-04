CREATE DATABASE zomato_analytics;
USE zomato_analytics;
CREATE TABLE zomato_raw (
    url TEXT,
    address TEXT,
    name VARCHAR(255),
    online_order VARCHAR(10),
    book_table VARCHAR(10),
    rate VARCHAR(20),
    votes INT,
    phone TEXT,
    location VARCHAR(100),
    rest_type VARCHAR(255),
    dish_liked TEXT,
    cuisines TEXT,
    approx_cost VARCHAR(30),
    reviews_list LONGTEXT,
    menu_item LONGTEXT,
    listed_in_type VARCHAR(100),
    listed_in_city VARCHAR(100)
);

