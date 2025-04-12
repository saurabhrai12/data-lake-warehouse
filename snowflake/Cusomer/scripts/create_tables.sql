

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name STRING NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category STRING
);
