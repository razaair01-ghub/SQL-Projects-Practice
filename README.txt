SQL_Practice_AdventureWorksDW2022 - README

Contents:
- 01_Basic_Queries.sql
- 02_Joins_And_Aggregations.sql
- 03_Subqueries_And_CTEs.sql
- 04_Analytical_Functions.sql
- 05_Data_Cleaning_And_Transformation.sql
- 06_Real_World_Case_Studies.sql
- 07_Performance_Optimization.sql


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


-- 02_Joins_And_Aggregations.sql
-- Focus: Joins, multi-table aggregates, grouping, HAVING

-- 1) Total SalesAmount by Product (ProductKey, EnglishProductName) — top 20.
-- Hint: Join FactInternetSales -> DimProduct, GROUP BY product fields.

-- 2) Total SalesAmount by Product Category (EnglishProductCategoryName).
-- Hint: Join through DimProductSubcategory -> DimProductCategory.

-- 3) SalesAmount and OrderQuantity aggregated by SalesTerritory (EnglishSalesTerritoryRegion).
-- Hint: Join FactInternetSales -> DimSalesTerritory.

-- 4) For each country, show TotalSales and CustomerCount (distinct customers).
-- Hint: Join DimGeography -> DimCustomer -> FactInternetSales, GROUP BY country.

-- 5) List top 10 products by average OrderQuantity per order.
-- Hint: AVG(OrderQuantity) with GROUP BY ProductKey.


-- 03_Subqueries_And_CTEs.sql
-- Focus: Correlated subqueries, scalar subqueries, CTEs

-- 1) Using a subquery, list customers whose total spend is above the overall average customer spend.
-- Hint: Use subquery to compute customer totals, compare to AVG from that set.

-- 2) Find products that have sales greater than the average sales of their product subcategory.
-- Hint: Use subquery per subcategory or window AVG().

-- 3) Use a CTE to compute monthly sales, then select months with sales above the 12-month average.
-- Hint: CTE -> aggregate by year/month -> use overall AVG in outer query.

-- 04_Analytical_Functions.sql
-- Focus: Window functions - RANK, DENSE_RANK, ROW_NUMBER, NTILE, LAG, LEAD

-- 1) For each product category, rank products by total sales and show top 3 per category.
-- Hint: Use ROW_NUMBER() PARTITION BY Category ORDER BY SUM(SalesAmount) DESC.

-- 2) Compute month-over-month sales growth percentage for total internet sales.
-- Hint: Use LAG(SUM(SalesAmount)) OVER (ORDER BY Year,Month).




-- 05_Data_Cleaning_And_Transformation.sql
-- Focus: Handling NULLs, string/date transformations, CASE expressions, validation queries

-- 1) Find rows in DimCustomer with missing/malformed phone numbers (NULL or length < 6).
-- Hint: WHERE Phone IS NULL OR LEN(Phone) < 6.

-- 2) Standardize product names by trimming whitespace and converting to proper case (show examples).
-- Hint: Use LTRIM/RTRIM and UPPER/LOWER or combinations.


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

-- 07_Performance_Optimization.sql
-- Focus: Identify slow queries, rewrite alternatives, index usage, and plan-aware problems.

-- 1) Write a query that returns total sales per product but is intentionally written poorly. Then rewrite it to be SARGable.
-- Hint: Avoid functions on join/filter columns.

-- 2) Replace a JOIN + GROUP BY pattern with EXISTS where appropriate and compare performance.
-- Hint: EXISTS can be faster for existence checks.


Instructions:
- Restore AdventureWorksDW2022 in SQL Server 2022.
- Open each .sql file in SSMS/VS Code.
- Solve each question using AdventureWorksDW2022.
- Hints are provided in comments; no solutions included.
