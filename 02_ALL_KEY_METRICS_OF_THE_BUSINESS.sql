/*
====================================================================================================
PROJECT: Customer & Product Sales Analysis (2010–2013)
SCRIPT: 02_ALL_KEY_METRICS_OF_THE_BUSINESS
PURPOSE: Consolidates high-level corporate KPIs and baseline operational volumes for management.
====================================================================================================
*/



USE DataWarehouseAnalytics;


 SELECT 'Total_Sales' AS Measure_Name, 	SUM(sales_amount) AS Measure_Value FROM gold.fact_sales
 UNION ALL
 SELECT 'Total_Quantity', Count(quantity) AS Measure_Value FROM gold.fact_sales
 UNION ALL
 SELECT 'Average_Price', Avg(Price) AS Measure_Value FROM gold.fact_sales
 UNION ALL
 SELECT 'Total No. Orders', Count(DISTINCT order_number) AS Measure_Value FROM gold.fact_sales
 UNION ALL
 SELECT 'Total No. Product', Count(product_key) AS Measure_Value FROM gold.dim_products
 UNION ALL 
 SELECT 'Total No. Customers', 	COUNT(customer_key) AS Measure_Value FROM gold.dim_customers