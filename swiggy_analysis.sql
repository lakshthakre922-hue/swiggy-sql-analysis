-- CREATE DATABASE swiggy_analysis;

-- USE swiggy_analysis;

-- USE swiggy_analysis;

-- SELECT *
-- FROM swiggy
-- LIMIT 10;

-- SELECT COUNT(*) AS total_records
-- FROM swiggy;
-- DESCRIBE swiggy;



-- =========================================
-- Swiggy Restaurant Analysis
-- Author: Laksh Thakur
-- Database: swiggy_analysis
-- =========================================

USE swiggy_analysis;


-- =========================================
-- 1. DATA CHECKING
-- =========================================

-- Total records
SELECT COUNT(*) AS total_records
FROM swiggy;

-- Sample records
SELECT *
FROM swiggy
LIMIT 10;

-- Check table structure
DESCRIBE swiggy;


-- =========================================
-- 2. DATA CLEANING
-- =========================================

-- Check rating values
SELECT rating, COUNT(*) AS total
FROM swiggy
GROUP BY rating
ORDER BY total DESC;


-- =========================================
-- 3. DATA ANALYSIS
-- =========================================

-- Q1: Restaurants by city
SELECT city,
       COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY city
ORDER BY total_restaurants DESC
LIMIT 10;


-- Q2: Most popular cuisines
SELECT cuisine,
       COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY cuisine
ORDER BY total_restaurants DESC
LIMIT 10;


-- Q3: Restaurant chains with most branches
SELECT restaurant_name,
       COUNT(*) AS branches
FROM swiggy
GROUP BY restaurant_name
ORDER BY branches DESC
LIMIT 10;