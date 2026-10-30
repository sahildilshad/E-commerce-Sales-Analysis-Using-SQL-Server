
-- create database

CREATE DATABASE EcommerceDB


-- create tables
CREATE TABLE ecommerce_sales(

    OrderID VARCHAR(30) PRIMARY KEY,
	Month VARCHAR(30),
	Year INT,
	OrderDate DATE,
	CustomerID VARCHAR(30),
	Age INT,
	Gender VARCHAR(30),
	City VARCHAR(40),
	State VARCHAR(50),
	ProductID VARCHAR(20),
	ProductName VARCHAR(60),
	Category VARCHAR(60),
	Subcategory VARCHAR(60),
	Quantity INT,
	UnitPrice_INR INT,
	DiscountPct INT 	,
	PaymentMethod VARCHAR(60),
	OrderStatus VARCHAR(60),
	ShippingDays INT,
	GrossSales_INR DECIMAL(15,2) ,
	NetSales_INR DECIMAL(15,2),
	Cost_INR DECIMAL(15,2),
	Profit_INR DECIMAL(15,2)
)


-- Business Question

-- 1.What are the total Gross Sales, Net Sales, and Profit of the e-commerce business?

-- 1.Total Gross sales
-- 2.Total Net sales
-- 3.Total Profit 

SELECT 
	SUM(GrossSales_INR) as Total_Gross_Sales
FROM ecommerce_sales

-- 2.Total Net sales

SELECT 
	SUM(NetSales_INR) as Total_Net_Sales
FROM ecommerce_sales


-- 3.Total Profit

SELECT 
	SUM(Profit_INR) as Total_Profit
FROM ecommerce_sales

-- 2.Monthly Sales Analysis
-- How much Net Sales did the business generate in each month?

SELECT
	MONTH,
	SUM(NetSales_INR) Monthly_Sales
FROM ecommerce_sales
GROUP BY MONTH

-- 3.Sales by State
-- Which states generate the highest Net Sales?

SELECT TOP 1
	State,
	SUM(NetSales_INR) as Total_Net_Sales
FROM ecommerce_sales
GROUP BY state
ORDER BY Total_Net_Sales DESC


-- 4.Top 5 Customers
-- Which 5 customers generated the highest total Net Sales?

SELECT TOP 5
	CustomerID,
	SUM(NetSales_INR) AS Total_Net_Sales
FROM ecommerce_sales
GROUP BY CustomerID
ORDER BY Total_Net_Sales DESC

-- 5.Sales by Year
-- What is the total Net Sales for each year?

SELECT
	YEAR,
	SUM(NetSales_INR) AS Total_Net_Sales
FROM ecommerce_sales
GROUP BY YEAR

-- Top 5 Best-Selling Products
-- Which 5 products generated the highest total Net Sales?

SELECT TOP 5
	ProductName,
	SUM(NetSales_INR) AS Total_Net_Sales
FROM ecommerce_sales
GROUP BY ProductName
ORDER BY Total_Net_Sales DESC 

-- 6.Calculate Profit Margin
-- What is the profit margin percentage for each product category?

SELECT 
	Category,
	SUM(NetSales_INR) AS Total_Net_Sales,
	SUM(Profit_INR) AS Total_Profit,
	(SUM(Profit_INR)/SUM(NetSales_INR))*100.00 Profit_Margin
FROM ecommerce_sales
GROUP BY Category


-- 7.Compare Monthly Sales
-- For each month, calculate total Net Sales and show the previous month's Net Sales alongside it.

WITH MonthlySales AS (
    SELECT
        [Month],
        SUM(NetSales_INR) AS Total_Net_Sales
    FROM ecommerce_sales
    GROUP BY [Month]
)

SELECT
    [MONTH],
    Total_Net_Sales,
    LAG(Total_Net_Sales) OVER (
        ORDER BY [MONTH]
    ) AS Previous_Month_Sales
FROM MonthlySales
ORDER BY [MONTH];

-- 8.Month-over-Month Sales Change
-- Calculate how much Net Sales increased or decreased compared with the previous month.

WITH Total_Net_Sales as (

SELECT
    MONTH,
	SUM(NetSales_INR) AS Total_Net_Sales
FROM ecommerce_sales
GROUP BY MONTH

),
 Previous_Sales as(
	SELECT
		MONTH,
		Total_Net_Sales,
		LAG(Total_Net_Sales) OVER(
		ORDER BY MONTH
		) AS Previous_Month_Sales
	FROM Total_Net_Sales
	
)

SELECT 
	MONTH,
	Total_Net_Sales,
	Previous_Month_Sales,
	Total_Net_Sales - Previous_Month_Sales as Month_over_Mont_Sales
FROM Previous_Sales 
ORDER BY MONTH


-- 9.Find the top 3 product categories by total profit within each state.


WITH CategoryProfit AS (
	SELECT 
	category,
	state,
	SUM(Profit_INR) total_profit
	FROM ecommerce_sales
	GROUP BY category,state

),
RankedCategories  AS (
	SELECT 
	Category,
	state,
	total_profit,
	ROW_NUMBER() OVER (
	PARTITION BY state
	ORDER BY total_profit DESC

) AS rn
FROM CategoryProfit
)



SELECT 
category,
state,
total_profit
FROM RankedCategories
where rn <= 3
ORDER BY state,total_profit DESC

SELECT
MONTH,
SUM(Profit_INR) Total_profit
FROM ecommerce_sales
GROUP BY MONTH