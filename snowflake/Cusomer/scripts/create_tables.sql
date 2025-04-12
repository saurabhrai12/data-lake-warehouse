CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    email STRING,
    phone STRING
);