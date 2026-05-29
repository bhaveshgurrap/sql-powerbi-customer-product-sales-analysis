/*
====================================================================================================
PROJECT: Customer & Product Sales Analysis (2010–2013)
SCRIPT: 04_ADVANCED_DATA_ANALYTICS
PURPOSE: Executes complex window functions, time-series shifts, and cumulative growth calculations.
====================================================================================================
*/

USE DataWarehouseAnalytics;

SELECT * FROM gold.dim_customers;
SELECT * FROM gold.dim_products;
SELECT * FROM gold.fact_sales;

================================
-- Changes Over Time Analysis
================================

-- Analysis sales performance over time 
SELECT 
	Year(order_date) AS Yearly_Date,
	SUM(sales_amount) AS Total_Amount,
	AVG(sales_amount) AS Avg_Amount
FROM gold.fact_sales
GROUP BY Year(order_date)
ORDER BY Yearly_Date

================================
-- Cumalutive Analysis
================================


-- Calculate the total Sales per month and the running total of sales over time 
SELECT 
		Monthly_Date,
		Total_Sales,
		SUM(Total_Sales) Over (ORDER BY Monthly_Date) AS Running_Total,
		Avg_Amount,
		AVG(Total_Sales) Over (ORDER BY Monthly_Date) AS Runing_Avg
FROM (
	SELECT 
		DATETRUNC(Month, order_date) AS Monthly_Date,
		SUM(sales_amount) AS Total_Sales,
		Avg(sales_amount) AS Avg_Amount
	FROM gold.fact_sales
	GROUP BY 
		DATETRUNC(Month, order_date)
	) a

================================
-- Perfomance Analysis
================================

-- Analysis the yearly performance of products by comparing each product's sales to both its average sales performance and the previous year's Sales
WITH Yearly_Product_Sales AS (
SELECT 
	Year(s.order_date) AS Order_Year,
	p.product_name,
	SUM(s.sales_amount) AS Total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
		ON s.product_key = p.product_key
WHERE s.order_date IS NOT NULL
GROUP BY 
	Year(s.order_date),
	p.product_name
)

SELECT 
	Order_Year,
	product_name,
	Total_sales,
	AVG(Total_sales) OVER (Partition by product_name Order by Order_Year) AS Avg_Sales,
	CASE 
		WHEN total_sales > (AVG(Total_sales) OVER (Partition by product_name Order by Order_Year)) Then 'Above Average'
		WHEN total_sales < (AVG(Total_sales) OVER (Partition by product_name Order by Order_Year)) Then 'Below Average'
		ELSE 'Average'
	END AS Average_Changes,
	Lag(Total_sales) OVER (Partition BY product_name Order by Order_Year) AS PY_Sales,
	Total_Sales - COALESCE(Lag(Total_sales) OVER (Partition BY product_name Order by Order_Year), 0) AS Diff_Amount,
	CASE
		WHEN Total_Sales > COALESCE(Lag(Total_sales) OVER (Partition BY product_name Order by Order_Year), 0) THEN 'Increase'
		WHEN Total_Sales < COALESCE(Lag(Total_sales) OVER (Partition BY product_name Order by Order_Year), 0) THEN 'Decrease'
		ELSE 'NO Change'
	END Sales_Changes
FROM Yearly_Product_Sales

================================
-- Part-To-Whole
================================

-- Which categories contribute the most to overall sales.

WITH Category_sales AS (

SELECT 
	p.category,
	Sum(s.sales_amount) AS Total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p 
		ON s.product_key = p.product_key
Group BY 
		p.category
		)

SELECT 
	category,
	Total_sales,
	SUM(Total_sales) OVER () AS Overall_sales,
	CONCAT(ROUND((CAST(Total_sales as float) * 100 / SUM(Total_sales) OVER ()), 2), '%') AS Percentage_of_total
FROM Category_sales
ORDER BY 
	Total_sales DESC

================================
-- Data Segmentation
================================

-- Segment products into cost ranges and count how many products fall into each segment.
SELECT 
	Cost_segment,
	COUNT(*) AS Product_Count
FROM (
		SELECT
			product_name,
			CASE
				WHEN cost < 100 Then 'Below 100'
				WHEN cost >= 100 AND cost < 500 Then '100 - 500'
				When cost >= 500 AND cost < 1000 THEN '500 - 1000'
				Else 'Above 1000'
			END Cost_segment
		FROM gold.dim_products
		) a
GROUP BY Cost_segment;


/*
-- Group Customers into three segments based on their spending behavior:
  * VIP : Customers with at least 12months of history and spending more than 5,000.
  * Regular : Customer with at least 12 months of history but spending 5,000 or Less1
  * New : Customers with a lifespan less than 12 months.
*/

WITH Customers_Details AS (
		SELECT 
			customer_key,
			MIN(order_date) AS First_Order,
			MAX(order_date) AS Last_order,
			DATEDIFF(Month, MIN(order_date), MAX(order_date)) AS Lifespan,
			SUM(Sales_amount) AS Total_Spend
		FROM gold.fact_sales
		GROUP BY
			customer_key
			), 
	
	Customer_Segment AS (
		SELECT
			customer_key,
			First_Order,
			Last_order,
			Lifespan,
			Total_Spend,
			CASE
				WHEN Lifespan >= 12 AND Total_Spend > 5000 THEN 'VIP'
				WHEN Lifespan >= 12 AND Total_spend <= 5000 THEN 'Regular'
				ELSE 'NEW'
			END AS Customer_Segment
		FROM Customers_Details
		)

SELECT 
	Customer_Segment,
	COUNT(*) AS Total_Customers
FROM Customer_Segment
GROUP BY Customer_Segment
