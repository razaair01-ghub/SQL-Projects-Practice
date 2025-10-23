-- 06_Real_World_Case_Studies.sql
-- Multi-step business problems, real-world focus

-- CASE 1: Regional Sales Dashboard
-- Q1) Compute total sales and total orders by SalesRegion and Year.
-- Hint: Join FactInternetSales -> DimSalesTerritory and DimDate.

-- Q2) For each region, list top 5 products by sales for the latest year in the data.
-- Hint: Filter by Year = (SELECT MAX(Year) ...) then GROUP BY product.

-- CASE 2: Customer Lifetime Value (CLV) Analysis
-- Q1) For each customer compute TotalRevenue, OrderCount, FirstPurchaseDate, LastPurchaseDate.
-- Hint: Aggregate on FactInternetSales.

-- Q2) Compute average order value per customer and bucket them into deciles.
-- Hint: Use NTILE(10) over customer totals.
