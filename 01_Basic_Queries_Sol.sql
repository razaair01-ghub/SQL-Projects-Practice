-- AdventureWorksDW2022
-- 01_Basic_Queries.sql
-- Practice questions (No solutions). Small hints provided as comments.

-- 1) List the top 10 customers by CustomerKey (show FirstName, LastName, EmailAddress if available).
-- Hint: ORDER BY CustomerKey, use TOP.

-- 2) Retrieve all distinct countries from DimGeography.
-- Hint: DISTINCT on EnglishCountryRegionName.

-- 3) Count the number of customers per country and order by highest first.
-- Hint: GROUP BY + COUNT().

-- 4) Show customers whose last name starts with 'S' (first 50 rows).
-- Hint: LIKE 'S%'.

-- 5) Display total internet sales amount (SalesAmount) for all time.
-- Hint: SUM() on FactInternetSales.

-- 6) Show total sales per year. Return Year and TotalSales.
-- Hint: Join DimDate, GROUP BY year(OrderDate) or use DateKey mapping.

-- 7) List products (ProductKey, EnglishProductName) where the product name contains 'Mountain'.
-- Hint: LIKE '%Mountain%'.

-- 8) Find the average order quantity (OrderQuantity) across all FactInternetSales rows.
-- Hint: AVG().

-- 9) Find the minimum, maximum and average SalesAmount in FactInternetSales.
-- Hint: MIN(), MAX(), AVG().

-- 10) Show the number of orders (SalesOrderNumber) per customer (limit to top 20 by count).
-- Hint: GROUP BY CustomerKey, COUNT(DISTINCT SalesOrderNumber).


--1.
SELECT CustomerKey,FirstName+' '+Coalesce(MiddleName,' ')+' '+LastName,EmailAddress
FROM dbo.DimCustomer

--2.
SELECT Distinct EnglishCountryRegionName Country
FROM dbo.DimGeography

--3.

SELECT 
	g.EnglishCountryRegionName Country,
	COUNT(c.CustomerKey) CustomerCount
	FROM dbo.DimCustomer c
	JOIN dbo.DimGeography g
	ON g.GeographyKey=c.GeographyKey
	Group by g.EnglishCountryRegionName
	ORDER BY CustomerCount DESC

--4.

SELECT top 50
	FirstName,LastName
FROM dbo.DimCustomer
WHERE LastName like 'S%'

--5.

SELECT ROUND(SUM(SalesAmount),2) TotalSalesAmount
FROM dbo.FactInternetSales


--6.

SELECT 
	d.CalendarYear
	,ROUND(SUM(s.SalesAmount),2) TotalSales
FROM dbo.FactInternetSales s
JOIN dbo.DimDate d
ON d.DateKey=s.OrderDateKey
GROUP BY d.CalendarYear
ORDER BY TotalSales DESC

--7.

SELECT	
	ProductKey,EnglishProductName ProductName
FROM dbo.DimProduct
WHERE EnglishProductName like '%Mountain%'

--8.

SELECT 
	AVG(OrderQuantity) AvgOrderQuantity
FROM dbo.FactInternetSales

--9.

SELECT 
	MAX(SalesAmount) MaxSales,
	MIN(SalesAmount) MinSales,
	AVG(SalesAmount) AvgSales
	FROM dbo.FactInternetSales

--10.

SELECT TOP 20
	CustomerKey,COUNT(DISTINCT SalesOrderNumber) OrderCount
	FROM dbo.FactInternetSales
	GROUP BY CustomerKey