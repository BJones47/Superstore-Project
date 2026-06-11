-- SQL Queries for Superstore Analysis


-- Total Sales and Profit
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore;


-- Sales and Profit by Category
SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- Sales by Region
SELECT
    region,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- Top Selling Products
SELECT
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Profit Margin Analysis

-- Top 10 most profitable products
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Average profit margin by category
SELECT
    category,
    AVG(profit_margin) AS avg_profit_margin
FROM superstore
GROUP BY category
ORDER BY avg_profit_margin DESC;

-- Discount vs Profit impact
SELECT
    discount,
    AVG(profit) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

-- Monthly Sales Trends
SELECT
    year,
    month,
    SUM(sales) AS monthly_sales
FROM superstore
GROUP BY year, month
ORDER BY year, month;

--Top 10 customers by revenue 
SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Region Ranking
SELECT
    region,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM superstore
GROUP BY region;