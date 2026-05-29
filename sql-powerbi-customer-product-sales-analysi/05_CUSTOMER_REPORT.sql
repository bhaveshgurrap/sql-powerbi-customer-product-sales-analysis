/*
====================================================================================================
PROJECT: Customer & Product Sales Analysis (2010–2013)
SCRIPT: 05_CUSTOMER_REPORT
PURPOSE: This report consolidates key customer metrics and behaviors.
====================================================================================================

HIGHLIGHTS:
	1. Gather essential fields such as Names, Ages and Transaction details.
	2. Segment customer into categories (VIP, Regular, New) and age Groups
	3. Aggregates Customer level metrics
	    - Total orders
		- Total sales
		- Total quantity purchased
		- Total products
		- Lifespan (in months)
	4. Calculate valuable KPI's:-
	    - Recency (Months since last order)
		- Average Order Vaue (AOV)
		- Average Monthly Spend.

=================================================================================================================================================
*/

USE DataWarehouseAnalytics;


-- 1. Retriving all necessary Details of Customers
Drop VIEW Combine_Customer_Report;

CREATE VIEW Combine_Customer_Report AS
WITH Customer_Details AS (
	SELECT 
		c.customer_Key,
		c.customer_id,
		s.product_key,
		s.order_number,
		s.order_date,
		s.quantity,
		CONCAT(c.first_name, ' ' , c.last_name) AS Full_Name,
		c.birthdate,
		DATEDIFF(YEAR, c.birthdate, GETDATE()) AS Age,
		s.sales_amount
	FROM gold.fact_sales s
	LEFT JOIN gold.dim_customers c
		ON s.customer_key = c.customer_key
	WHERE s.order_date IS NOT NULL
	) ,

	Customer_Aggregates AS (
	SELECT 
		customer_Key,
		customer_id,
		Count(DISTINCT product_key) AS total_product,
		COUNT(DISTINCT order_number) AS Total_orders,
		MAX(order_date) AS Last_order,
		MIN(order_date) AS first_order,
		SUM(quantity) As Total_Quantity,
		Full_Name,
		birthdate,
		Age,
		SUM(sales_amount) AS Sum_sales,
		DATEDIFF(Month, MIN(order_date), MAX(order_date)) AS Lifespan
	FROM Customer_Details
	GROUP BY
		customer_Key,
		customer_id,
		Full_Name,
		birthdate,
		Age
		)
--2. Segment customer into categories (VIP, Regular, New) and age Groups
	SELECT 
		customer_Key,
		customer_id,
		first_order,
		last_order,
		Total_Quantity,
		Full_Name,
		birthdate,
		Age,
		Sum_sales,
		lifespan,
		total_product,
		total_orders,
		CASE
			WHEN Lifespan >= 12 AND Sum_sales > 5000 THEN 'VIP'
			WHEN Lifespan >= 12 AND Sum_sales <= 5000 THEN 'Regular'				
			ELSE 'NEW'
		END AS Customer_Segment,
		CASE
			WHEN Age IS NULL THEN 'Unknown'
			WHEN Age < 20 THEN 'Below 20'
			WHEN Age >= 20 AND Age < 40 THEN '20 - 39'
			WHEN Age >= 40 AND Age < 60 THEN '40 - 59'
			WHEN Age >= 60 AND Age < 80 THEN '60 - 79'
			ELSE 'Above 80'
		END AS Age_group,
		DATEDIFF(Month, last_order, (SELECT MAX(order_date) AS last_order FROM gold.fact_sales)) AS Recency,
-- Average Order Vaue (AOV)
		CASE 
			WHEN Sum_sales IS NULL THEN 0
			ELSE Sum_sales / total_orders
		END AS Avg_order_Value,
-- Average Monthly Spend.
		CASE
			WHEN lifespan = 0  THEN Sum_sales
			ELSE Sum_sales / lifespan 
		END AS Avg_Monthly_spend
	FROM Customer_Aggregates;

	(SELECT MAX(order_date) AS last_order FROM gold.fact_sales)