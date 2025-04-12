CREATE TABLE IF NOT EXISTS sales (
    sale_id INT AUTOINCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_date TIMESTAMP NOT NULL,
    customer_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name STRING NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category STRING
);

