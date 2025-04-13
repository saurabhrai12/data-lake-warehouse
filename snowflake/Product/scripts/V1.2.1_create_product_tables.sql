USE schema my_product_schema;

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name STRING NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category STRING
);
CREATE TABLE IF NOT EXISTS product_reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    review_text STRING,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE IF NOT EXISTS product_inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity >= 0),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE IF NOT EXISTS product_categories (
    category_id INT PRIMARY KEY,
    category_name STRING NOT NULL
);
CREATE TABLE IF NOT EXISTS product_suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name STRING NOT NULL,
    contact_info STRING
);
CREATE TABLE IF NOT EXISTS product_orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_date TIMESTAMP,
    quantity INT CHECK (quantity > 0),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE IF NOT EXISTS product_shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_address STRING,
    shipping_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES product_orders(order_id)
);
CREATE TABLE IF NOT EXISTS product_discounts (
    discount_id INT PRIMARY KEY,
    product_id INT,
    discount_percentage DECIMAL(5, 2) CHECK (discount_percentage >= 0 AND discount_percentage <= 100),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE IF NOT EXISTS product_tags (
    tag_id INT PRIMARY KEY,
    tag_name STRING NOT NULL
);
CREATE TABLE IF NOT EXISTS product_tag_mapping (
    product_id INT,
    tag_id INT,
    PRIMARY KEY (product_id, tag_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (tag_id) REFERENCES product_tags(tag_id)
);
CREATE TABLE IF NOT EXISTS product_images (
    image_id INT PRIMARY KEY,
    product_id INT,
    image_url STRING NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE IF NOT EXISTS product_wishlist (
    wishlist_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    added_date TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE IF NOT EXISTS product_cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    added_date TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);