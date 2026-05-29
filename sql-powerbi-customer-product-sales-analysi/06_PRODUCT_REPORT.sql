/*
====================================================================================================
PROJECT: Customer & Product Sales Analysis (2010–2013)
SCRIPT: 06_PRODUCT_REPORT
PURPOSE: Monitors operational product velocity, margins, inventory movement, and performance tiers.
====================================================================================================

Highlights:
	1. Gathers essentail fields such as product name, category, sub-category and cost.
	2. Segment product by revenue to identify High-performing, Mid-performing or Low-performings
	3. Aggregates product - level metrics:
		- Total orders
		- Total Sales
		- Total quantity sold
		- Total customers (Unique)
		- Lifespan (in months)
	4. Calculate Valuable KPI's :
		- Recency (Months since last sale)
		- average order revenue (AOR)
		- average monthly revenue.
====================================================================================================
*/

USE DataWarehouseAnalytics;


CREATE VIEW Combine_Product_Report AS
WITH Basic_Details AS (
		SELECT 
			s.order_number,
			p.product_key,
			s.customer_key,
			s.order_date,
			s.sales_amount,
			s.quantity,
			p.product_number,
			p.product_name,
			p.category,
			p.subcategory,
			p.cost
		FROM gold.fact_sales s
		LEFT JOIN gold.dim_products p 
				 ON s.product_key = p.product_key
		WHERE order_date IS NOT NULL
				 ),
	customer_aggregate AS	(
		SELECT 
			COUNT(DISTINCT order_number) AS Total_orders,
			COUNT(DISTINCT customer_key) AS Total_customer, 
			MIN(order_date) AS First_order,
			MAX(order_date) AS Last_order,
			DATEDIFF(month, MIN(order_date), MAX(order_date)) AS Lifespan,
			SUM(sales_amount) AS Total_sale,
			SUM(quantity) AS Total_quantity,
			product_name,
			category,
			subcategory,
			SUM(cost) AS Total_cost
		FROM Basic_details
		GROUP BY
			product_key,
			product_number,
			Product_name,
			category,
			subcategory
			)

		SELECT 
			Total_orders,
			Total_customer, 
			First_order,
			Last_order,
			Lifespan,
			Total_sale,
			Total_quantity,
			product_name,
			category,
			subcategory,
			Total_cost,
			CASE 
				WHEN total_sale > 100000 Then 'High_performing'
				WHEN Total_sale <= 100000 AND total_sale >= 50000 THEN 'Mid_performing'
				Else 'Low_performing'
			END AS Revenue_segment,
			DATEDIFF(Month, Last_order, getdate()) AS Recency,
		-- Average Order Revenue (AOR)
			ROUND(CAST(total_sale AS Float) / NULLIF(total_orders, 0), 2) AS Avg_Order_revenue,
		-- Average Monthly Revenue.
			ROUND(CAST(total_sale AS Float) / NULLIF(Lifespan, 0), 2) AS Avg_monthly_revenue
		FROM customer_aggregate

			


