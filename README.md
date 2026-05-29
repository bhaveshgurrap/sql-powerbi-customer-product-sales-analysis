# 🚴 Customer & Product Sales Analysis (2010–2013)
<p>
 This repository features an end-to-end data analytics project combining powerful SQL query techniques with interactive Power BI dashboards. It provides actionable business intelligence on customer behavior, product performance, and overall revenue growth drivers between 2010 and 2013.
</p>

# 📑 Table of Contents

* [📌 Project Overview](#-project-overview)
* [❓ Business Problem](#-business-problem)
* [🎯 Project Objectives](#-project-objectives)
* [🛠️ Tools & Technologies Used](#️-tools--technologies-used)
* [🗂️ Dataset Information](#️-dataset-information)
* [🧹 Data Preparation Process](#-data-preparation-process)
* [🧠 SQL Concepts Used](#-sql-concepts-used)
* [📊 Exploratory Data Analysis (EDA)](#-exploratory-data-analysis-eda)
* [📈 Advanced Data Analytics](#-advanced-data-analytics)
* [📉 Dashboard Overview](#-dashboard-overview)
* [💡 Key Business Insights](#-key-business-insights)
* [📄 View Complete Project](#-View-Complete-Project)
* [📁 Repository Structure](#-repository-structure)
* [🧾 SQL File Description](#-sql-file-description)
* [💻 Sample SQL Query](#-sample-sql-query)
* [🚀 Future Improvements](#-future-improvements)
* [✅ Conclusion](#-conclusion)
* [👨‍💻 Author](#-author)

---

## 📌 Project Overview

This project analyzes customer purchasing behavior, product performance, and business sales trends between 2010 and 2013 using SQL and Power BI.

The project focuses on transforming raw transactional sales data into actionable business insights through:

* SQL-based analysis
* Exploratory Data Analysis (EDA)
* Advanced analytics
* Interactive Power BI dashboards

The analysis helps identify:

* High-value customers
* Revenue-driving products
* Customer segmentation trends
* Business growth patterns
* Product performance changes over time

---

# ❓ Business Problem

Businesses generate large volumes of transactional data daily, but without proper analysis it becomes difficult to:

* Identify profitable customers
* Understand changing product demand
* Track sales growth
* Improve strategic decision-making

This project solves these challenges using data-driven business analysis.

---

# 🎯 Project Objectives

* Analyze sales performance from 2010–2013
* Identify top customers contributing to revenue
* Discover best-selling and low-performing products
* Understand customer purchasing behavior
* Analyze business growth trends
* Build interactive dashboards for reporting

---

# 🛠️ Tools & Technologies Used

| Tool        | Purpose                  |
| ----------- | ------------------------ |
| SQL         | Data Cleaning & Analysis |
| Power BI    | Dashboard Development    |
| Excel       | Initial Data Review      |
| DAX         | KPI Calculations         |
| Power Query | Data Transformation      |

---

# 🗂️ Dataset Information

| Attribute    | Details                       |
| ------------ | ----------------------------- |
| Dataset Type | Customer & Product Sales Data |
| Time Period  | 2010–2013                     |
| Data Type    | Transactional Sales Data      |
| Main Tables  | Customers, Products, Orders   |

Dataset includes:

* Customer Information
* Product Details
* Sales Transactions
* Product Categories
* Revenue Metrics
* Purchase Dates

---

# 🧹 Data Preparation Process

The following preprocessing steps were performed before analysis:

* Removed duplicate records
* Handled missing values
* Standardized data types
* Performed feature engineering
* Validated business metrics

---

# 🧠 SQL Concepts Used

This project demonstrates practical SQL skills including:

* SELECT Statements
* WHERE Conditions
* GROUP BY & HAVING
* JOINS
* CASE Statements
* Aggregate Functions
* Common Table Expressions (CTEs)
* Window Functions
* Ranking Functions
* Views

---

# 📊 Exploratory Data Analysis (EDA)

## 🔹 Database Exploration

* Table structure analysis
* Relationship analysis
* Primary & foreign key validation

## 🔹 Dimensions Exploration

* Customer segmentation
* Product category analysis
* Regional analysis

## 🔹 Measures Exploration

* Total Sales
* Profit
* Quantity Sold
* Average Order Value

## 🔹 Ranking Analysis

* Top-performing products
* Highest revenue customers
* Lowest-performing products

## 🔹 Trend Analysis

* Year-over-year growth
* Product demand changes
* Customer behavior evolution

---

# 📈 Advanced Data Analytics

## 🔹 Change Over Time Trends

Analyzed sales and customer growth trends across four years.

## 🔹 Cumulative Analysis

Measured progressive business growth using cumulative metrics.

## 🔹 Performance Analysis

Compared sales, profit, and operational efficiency.

## 🔹 Part-to-Whole Analysis

Analyzed category contribution to overall revenue.

## 🔹 Customer Segmentation

Segmented customers into:

* VIP Customers
* Regular Customers
* New Customers

---

# 📉 Dashboard Overview

The Power BI dashboard provides interactive business insights including:

## 📌 Business Performance Dashboard

* Total Sales
* Total Profit
* Total Orders
* Average Order Value
* Revenue Trends

## 📌 Customer Analysis Dashboard

[View Attached File](./Customer-Behaviour-Analysis-Dashboard.png)

This dashboard highlights:

* Customer Segmentation
* Customer Recency
* Revenue by Customer Type
* Age Group Analysis
* Customer Retention Insights

## 📌 Product Analysis Dashboard

[View Attached File](./Product-Performance-Analysis-Dashboard.png)
This dashboard highlights:

* Product Performance
* Top Products
* Product Categories
* Revenue Contribution
* Product Trends

---

# 💡 Key Business Insights

* A small percentage of customers generated most of the revenue.
* Customer base expanded significantly between 2010–2013.
* Product preferences shifted from Road Bikes → Mountain Bikes → Touring Bikes.
* Revenue efficiency declined despite customer growth.
* VIP customer dependency reduced over time.
* Repeat customers contributed significantly to profitability.

---

# 🔗 View Complete Project

## 📄 Full Analysis Report

[Customer & Product Sales Analysis Report (2010–2013).pdf](./Customer%20&%20Product%20Sales%20Analysis%20Report%20(2010–2013).pdf)

## 📊 Power BI Dashboard

[Power BI Dashboard](./Customer_Product_report.pbix)

## 💻 SQL Scripts

[SQL Scripts](#-sql-file-description)

📌 Included File:

```bash
Customer & Product Sales Analysis Report (2010–2013).pdf
```

The PDF report contains:

* Executive Summary
* Business Problem Statement
* SQL Analysis
* Exploratory Data Analysis
* Advanced Analytics
* Dashboard Interpretation
* Business Insights
* Strategic Recommendations
* Final Conclusion

---

# 📁 Repository Structure

```bash
sql-powerbi-customer-product-sales-analysis/
│
├── README.md
│
├── SQL Files/
│   ├── 01_DATASETS_AND_TABLES_INSERTION.sql
│   ├── 02_ALL_KEY_METRICS_OF_THE_BUSINESS.sql
│   ├── 03_EXPLORATORY_DATA_ANALYSIS_EDA.sql
│   ├── 04_ADVANCED_DATA_ANALYTICS.sql
│   ├── 05_CUSTOMER_REPORT.sql
│   └── 06_PRODUCT_REPORT.sql
│
├── PDF File/
│   └── Customer & Product Sales Analysis Report (2010–2013).pdf
│
├── Dashboards/
│   └── PowerBI Dashboard.pbix
│
└── Screenshots/
```

---

# 🧾 SQL File Description

## 📄 SQL File Description

| SQL File | Description |
| :--- | :--- |
| [01_DATASETS_AND_TABLE_INSERTION](./01_DATASETS_AND_TABLES_INSERTION.sql) | Dataset creation and table insertion scripts |
| [02_ALL_KEY_METRICS_OF_THE_BUSINESS](./02_ALL_KEY_METRICS_OF_THE_BUSINESS.sql) | Business KPI calculations |
| [03_EXPLORATORY_DATA_ANALYSIS_EDA](./03_EXPLORATORY_DATA_ANALYSIS_EDA.sql) | Exploratory Data Analysis queries |
| [04_ADVANCED_DATA_ANALYTICS](./04_ADVANCED_DATA_ANALYTICS.sql) | Advanced analytical business queries |
| [05_CUSTOMER_REPORT](./05_CUSTOMER_REPORT.sql) | Customer-focused reporting analysis |
| [06_PRODUCT_REPORT](./06_PRODUCT_REPORT.sql) | Product-focused reporting analysis |

---

# 💻 Sample SQL Query

## 🔹 Top 5 Products by Revenue

```sql
SELECT TOP 5
    p.product_name,
    SUM(s.sales_amount) AS Total_Revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY Total_Revenue DESC;
```

---

# 🚀 Future Improvements

Future enhancements may include:

* Sales Forecasting
* Customer Churn Prediction
* Customer Lifetime Value Analysis
* Machine Learning Integration
* Automated Reporting Pipelines

---

# ✅ Conclusion

This project demonstrates a complete end-to-end data analytics workflow including:

* Data cleaning
* SQL analysis
* Exploratory Data Analysis
* Advanced analytics
* Business intelligence reporting
* Dashboard storytelling

The project successfully transformed raw transactional data into actionable business insights for strategic business decision-making.

---

# 👨‍💻 Author <br>

<b>Bhavesh Gurrap <br></b>

Data Analyst Portfolio Project <br>
- ✉️ Email: bhaveshgurrap11@gmail.com
- 💼 [LinkedIn](http://linkedin.com/in/bhavesh-gurrap-024503213/)