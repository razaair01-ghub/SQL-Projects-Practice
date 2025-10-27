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

--1.

SELECT toP 20	s.ProductKey,
		p.EnglishProductName,
		SUM(s.SalesAmount) TotalSales
	
	FROM dbo.FactInternetSales s
	JOIN dbo.DimProduct p
	ON s.ProductKey=p.ProductKey
	GROUP BY s.ProductKey,p.EnglishProductName
	ORDER BY TotalSales DESC

--2.

SELECT  c.EnglishProductCategoryName Categoty,SUM(s.SalesAmount) TotalSales

	FROM dbo.FactInternetSales s
	JOIN dbo.DimProduct p
	ON s.ProductKey=p.ProductKey
	JOIN dbo.DimProductSubcategory sb
	ON sb.ProductSubcategoryKey=p.ProductSubcategoryKey
	JOIN dbo.DimProductCategory c
	ON c.ProductCategoryKey=sb.ProductCategoryKey
	GROUP BY c.EnglishProductCategoryName
	ORDER BY TotalSales DESC


--3.

SELECT r.SalesTerritoryRegion RegionName,COUNT(s.OrderQuantity) Quantity,SUM(s.SalesAmount) TotalSales
	FROM dbo.FactInternetSales s
	JOIN dbo.DimSalesTerritory r
	ON r.SalesTerritoryKey=s.SalesTerritoryKey
	GROUP BY r.SalesTerritoryRegion
	ORDER BY TotalSales DESC


--4.

SELECT	g.EnglishCountryRegionName Country,
		COUNT(DISTINCT c.CustomerKey) TotalCustomer,
		SUM(s.SalesAmount) TotalSales
	
	FROM dbo.FactInternetSales s
	JOIN dbo.DimCustomer c
	ON c.CustomerKey=s.CustomerKey
	JOIN dbo.DimGeography g
	ON g.GeographyKey=c.GeographyKey
	GROUP BY g.EnglishCountryRegionName
	ORDER BY TotalSales DESC


--5.

SELECT TOP 20		ProductKey,AVG(OrderQuantity) AvgOrderQuantity
	FROM dbo.FactInternetSales 
	GROUP BY ProductKey