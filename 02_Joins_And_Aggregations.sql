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
