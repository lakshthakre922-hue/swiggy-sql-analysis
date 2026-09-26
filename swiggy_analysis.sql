-- =========================================
-- Swiggy Restaurant Analysis
-- Author: Laksh Thakur
-- Database: swiggy_analysis
-- =========================================

USE swiggy_analysis;

-- =========================================
-- 1. DATA CHECKING
-- =========================================

SELECT COUNT(*) AS total_records FROM swiggy;

SELECT * FROM swiggy LIMIT 10;

DESCRIBE swiggy;

-- =========================================
-- 2. DATA CLEANING / EXPLORATION
-- =========================================

-- Check rating and delivery time format
SELECT rating_and_delivery_time FROM swiggy LIMIT 5;

-- Split rating and delivery minutes for analysis
SELECT rating_and_delivery_time,
       SUBSTRING_INDEX(rating_and_delivery_time, ' ', 1) AS rating,
       SUBSTRING_INDEX(SUBSTRING_INDEX(rating_and_delivery_time, ' ', -2), ' ', 1) AS delivery_minutes
FROM swiggy
LIMIT 5;

-- =========================================
-- 3. DATA ANALYSIS
-- =========================================

-- Q1: Location with most restaurants
SELECT location,
       COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY location
ORDER BY total_restaurants DESC
LIMIT 10;

-- Q2: Most popular food type
SELECT food_type,
       COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY food_type
ORDER BY total_restaurants DESC
LIMIT 10;

-- Q3: Restaurant chains with most branches
SELECT hotel_name,
       COUNT(*) AS branches
FROM swiggy
GROUP BY hotel_name
ORDER BY branches DESC
LIMIT 10;

-- Q4: Highest-rated locations (min 3 restaurants)
SELECT location,
       ROUND(AVG(CAST(SUBSTRING_INDEX(rating_and_delivery_time, ' ', 1) AS DECIMAL(3,1))), 2) AS avg_rating,
       COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY location
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC
LIMIT 10;

-- Q5: Locations with fastest average delivery time (min 3 restaurants)
SELECT location,
       ROUND(AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(rating_and_delivery_time, ' ', -2), ' ', 1) AS UNSIGNED)), 0) AS avg_delivery_minutes,
       COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY location
HAVING COUNT(*) >= 3
ORDER BY avg_delivery_minutes ASC
LIMIT 10;
