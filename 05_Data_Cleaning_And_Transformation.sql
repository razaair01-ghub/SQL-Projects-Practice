-- 05_Data_Cleaning_And_Transformation.sql
-- Focus: Handling NULLs, string/date transformations, CASE expressions, validation queries

-- 1) Find rows in DimCustomer with missing/malformed phone numbers (NULL or length < 6).
-- Hint: WHERE Phone IS NULL OR LEN(Phone) < 6.

-- 2) Standardize product names by trimming whitespace and converting to proper case (show examples).
-- Hint: Use LTRIM/RTRIM and UPPER/LOWER or combinations.
