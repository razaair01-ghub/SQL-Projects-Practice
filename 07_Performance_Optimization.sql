-- 07_Performance_Optimization.sql
-- Focus: Identify slow queries, rewrite alternatives, index usage, and plan-aware problems.

-- 1) Write a query that returns total sales per product but is intentionally written poorly. Then rewrite it to be SARGable.
-- Hint: Avoid functions on join/filter columns.

-- 2) Replace a JOIN + GROUP BY pattern with EXISTS where appropriate and compare performance.
-- Hint: EXISTS can be faster for existence checks.
