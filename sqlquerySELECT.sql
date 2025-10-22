--show only unique Englishproductname values from DimProduct
 SElect distinct
	EnglishProductName
	FROM dbo.DimProduct

--get first 20 rows from factinernetsales
Select TOP(20) *

FROM dbo.FactInternetSales


--retrieve customerkey,firstname,last name from dimcustomer
SELECT CustomerKey,FirstName,LastName
FROM dbo.DimCustomer

--all unique salesterritory country from dimsalesterritory
SELECT DISTINCT SalesTerritoryCountry
FROM dbo.DimSalesTerritory

--unique combination from factintersale of productkey and order date key
SELECT DISTINCT ProductKey,OrderDateKey
FROM dbo.FactInternetSales


--distinct product colors from dimproduct
SELECT DISTINCT Color as Productcolor
FROM dbo.DimProduct


--10 customers who live in us



--englisheducation disticnr
SELECT DISTINCT EnglishEducation
FROM dbo.DimCustomer

--unique productsubcategorykeys from dimproduct
SELECT DISTINCT ProductSubcategoryKey
FROM dbo.DimProductSubcategory