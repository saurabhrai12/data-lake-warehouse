-- This SQL script contains transformation queries that prepare data for analysis in Snowflake.

-- Example transformation query to aggregate sales data
WITH sales_data AS (
    SELECT 
        product_id,
        SUM(sales_amount) AS total_sales,
        COUNT(*) AS total_transactions
    FROM 
        raw_sales_data
    GROUP BY 
        product_id
)

-- Insert the transformed data into the target table
INSERT INTO transformed_sales_data (product_id, total_sales, total_transactions)
SELECT 
    product_id,
    total_sales,
    total_transactions
FROM 
    sales_data;