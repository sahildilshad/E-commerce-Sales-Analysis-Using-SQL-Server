# E-commerce-Sales-Analysis-Using-SQL-Server

## Project Overview

This project focuses on analyzing e-commerce sales data using Microsoft SQL Server. The objective is to evaluate business performance, identify sales trends, understand customer purchasing behavior, and analyze profitability through SQL queries.

The project demonstrates how SQL can be used to answer practical business questions and extract meaningful insights from sales data.

## Tools & Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

## Database Structure

Database: `EcommerceDB`

Main Table: `ecommerce_sales`

The dataset contains information about:

- Orders and customers
- Product names and categories
- Sales, discounts, and costs
- Profit and net sales
- Customer demographics
- Geographical information
- Payment methods and order status
- Shipping duration

## Business Questions & Analysis

### 1. Business Performance KPIs
- Total Gross Sales
- Total Net Sales
- Total Profit

### 2. Monthly Sales Analysis
- Calculate total Net Sales for each month.

### 3. State-wise Sales Analysis
- Identify the state generating the highest Net Sales.

### 4. Customer Analysis
- Identify the top 5 customers based on total Net Sales.

### 5. Yearly Sales Analysis
- Analyze total Net Sales for each year.

### 6. Product Performance
- Identify the top 5 best-selling products by Net Sales.

### 7. Profitability Analysis
- Calculate profit margin percentage for each product category.

### 8. Previous Month Sales Analysis
- Compare monthly Net Sales with the previous month using `LAG()`.

### 9. Month-over-Month Sales Analysis
- Calculate the increase or decrease in monthly Net Sales.

### 10. State-wise Category Profitability
- Identify the top 3 most profitable product categories within each state using `ROW_NUMBER()`.

### 11. Monthly Profit Analysis
- Calculate total profit for each month.

## SQL Concepts Applied

- Aggregate Functions: `SUM()`
- Grouping: `GROUP BY`
- Sorting: `ORDER BY`
- Filtering: `TOP`
- Common Table Expressions (CTEs)
- Window Functions: `LAG()`, `ROW_NUMBER()`
- Calculated Metrics
- Profit Margin Calculation
- Data Aggregation and Ranking

## Project Objective

The main objective is to strengthen SQL analytical skills by solving business-oriented problems and understanding how sales data can support business decision-making.

## Learning Outcomes

- Improved understanding of SQL queries.
- Experience with business KPI calculations.
- Practical application of window functions.
- Understanding of customer and product performance.
- Ability to analyze sales and profitability trends.

---

**Project:** E-commerce Sales Analysis  
**Database:** Microsoft SQL Server  
**Author:** Sahil
