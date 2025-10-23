-- 04_Analytical_Functions.sql
-- Focus: Window functions - RANK, DENSE_RANK, ROW_NUMBER, NTILE, LAG, LEAD

-- 1) For each product category, rank products by total sales and show top 3 per category.
-- Hint: Use ROW_NUMBER() PARTITION BY Category ORDER BY SUM(SalesAmount) DESC.

-- 2) Compute month-over-month sales growth percentage for total internet sales.
-- Hint: Use LAG(SUM(SalesAmount)) OVER (ORDER BY Year,Month).
