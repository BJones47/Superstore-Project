SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore;

SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

SELECT
    region,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

SELECT
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    product_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT
    category,
    AVG(profit_margin) AS avg_profit_margin
FROM superstore
GROUP BY category
ORDER BY avg_profit_margin DESC;

SELECT
    discount,
    AVG(profit) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

SELECT
    year,
    month,
    SUM(sales) AS monthly_sales
FROM superstore
GROUP BY year, month
ORDER BY year, month;

SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    region,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM superstore
GROUP BY region;