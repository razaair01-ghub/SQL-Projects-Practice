-- 03_Subqueries_And_CTEs.sql
-- Focus: Correlated subqueries, scalar subqueries, CTEs

-- 1) Using a subquery, list customers whose total spend is above the overall average customer spend.
-- Hint: Use subquery to compute customer totals, compare to AVG from that set.

-- 2) Find products that have sales greater than the average sales of their product subcategory.
-- Hint: Use subquery per subcategory or window AVG().

-- 3) Use a CTE to compute monthly sales, then select months with sales above the 12-month average.
-- Hint: CTE -> aggregate by year/month -> use overall AVG in outer query.
