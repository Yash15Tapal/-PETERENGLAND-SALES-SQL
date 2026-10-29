CREATE DATABASE PETERENGLAND_SALES;
USE PETERENGLAND_SALES;

CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(15),
city VARCHAR(50),
state VARCHAR(50),
gender VARCHAR(10),
registration_date DATE
);

CREATE TABLE categories (
category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(150) NOT NULL,
category_id INT,
collection VARCHAR(100),
size VARCHAR(10),
color VARCHAR(50),
mrp DECIMAL(10,2),
selling_price DECIMAL(10,2),
cost_price DECIMAL(10,2),
stock_quantity INT,
    
FOREIGN KEY (category_id)
REFERENCES categories(category_id)
);

USE PETERENGLAND_SALES;

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) DEFAULT 'Completed',
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)
	REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
	REFERENCES products(product_id)
);

INSERT INTO categories (category_name)
VALUES
('Shirts'),
('Trousers'),
('T-Shirts'),
('Blazers'),
('Jeans'),
('Accessories');

INSERT INTO customers
(customer_name, email, phone, city, state, gender, registration_date)
VALUES

('Aarav Sharma', 'aarav01@example.com', '9000000001', 'Mumbai', 'Maharashtra', 'Male', '2026-01-05'),
('Riya Patil', 'riya02@example.com', '9000000002', 'Pune', 'Maharashtra', 'Female', '2026-01-10'),
('Aditya Shah', 'aditya03@example.com', '9000000003', 'Nashik', 'Maharashtra', 'Male', '2026-01-15'),
('Sneha Joshi', 'sneha04@example.com', '9000000004', 'Thane', 'Maharashtra', 'Female', '2026-01-20'),
('Rahul Desai', 'rahul05@example.com', '9000000005', 'Surat', 'Gujarat', 'Male', '2026-02-01'),
('Priya Mehta', 'priya06@example.com', '9000000006', 'Ahmedabad', 'Gujarat', 'Female', '2026-02-05'),
('Karan Verma', 'karan07@example.com', '9000000007', 'Delhi', 'Delhi', 'Male', '2026-02-10'),
('Ananya Rao', 'ananya08@example.com', '9000000008', 'Bengaluru', 'Karnataka', 'Female', '2026-02-15'),
('Vivek Kulkarni', 'vivek09@example.com', '9000000009', 'Nagpur', 'Maharashtra', 'Male', '2026-02-20'),
('Pooja Nair', 'pooja10@example.com', '9000000010', 'Kochi', 'Kerala', 'Female', '2026-03-01'),
('Arjun Singh', 'arjun11@example.com', '9000000011', 'Jaipur', 'Rajasthan', 'Male', '2026-03-05'),
('Neha Gupta', 'neha12@example.com', '9000000012', 'Indore', 'Madhya Pradesh', 'Female', '2026-03-10'),
('Rohan Iyer', 'rohan13@example.com', '9000000013', 'Chennai', 'Tamil Nadu', 'Male', '2026-03-15'),
('Isha Kapoor', 'isha14@example.com', '9000000014', 'Hyderabad', 'Telangana', 'Female', '2026-03-20'),
('Siddharth Jain', 'siddharth15@example.com', '9000000015', 'Mumbai', 'Maharashtra', 'Male', '2026-03-25');

INSERT INTO products
(product_name, category_id, collection, size, color,
 mrp, selling_price, cost_price, stock_quantity)
VALUES
('Classic Formal Shirt', (SELECT category_id FROM categories WHERE category_name='Shirts' LIMIT 1), 'Formal', 'M', 'White', 1999, 1499, 800, 50),
('Slim Fit Shirt', (SELECT category_id FROM categories WHERE category_name='Shirts' LIMIT 1), 'Formal', 'L', 'Blue', 2199, 1699, 900, 25),
('Casual Check Shirt', (SELECT category_id FROM categories WHERE category_name='Shirts' LIMIT 1), 'Casual', 'M', 'Red', 1799, 1299, 700, 0),
('Linen Shirt', (SELECT category_id FROM categories WHERE category_name='Shirts' LIMIT 1), 'Summer', 'L', 'Beige', 2499, 1999, 1100, 4),
('Printed Casual Shirt', (SELECT category_id FROM categories WHERE category_name='Shirts' LIMIT 1), 'Casual', 'S', 'Green', 1899, 1399, 750, 35),

('Formal Trousers', (SELECT category_id FROM categories WHERE category_name='Trousers' LIMIT 1), 'Formal', 'M', 'Black', 2499, 1899, 1100, 40),
('Slim Fit Chinos', (SELECT category_id FROM categories WHERE category_name='Trousers' LIMIT 1), 'Casual', 'L', 'Beige', 2299, 1799, 950, 20),
('Classic Pleated Trousers', (SELECT category_id FROM categories WHERE category_name='Trousers' LIMIT 1), 'Formal', 'XL', 'Grey', 2699, 2099, 1200, 3),
('Stretch Formal Pants', (SELECT category_id FROM categories WHERE category_name='Trousers' LIMIT 1), 'Formal', 'M', 'Navy', 2599, 1999, 1150, 0),

('Basic Crew Neck Tee', (SELECT category_id FROM categories WHERE category_name='T-Shirts' LIMIT 1), 'Casual', 'M', 'Black', 999, 699, 350, 80),
('Graphic Print Tee', (SELECT category_id FROM categories WHERE category_name='T-Shirts' LIMIT 1), 'Casual', 'L', 'White', 1199, 899, 450, 45),
('Polo T-Shirt', (SELECT category_id FROM categories WHERE category_name='T-Shirts' LIMIT 1), 'Casual', 'M', 'Navy', 1499, 1099, 550, 2),
('Striped T-Shirt', (SELECT category_id FROM categories WHERE category_name='T-Shirts' LIMIT 1), 'Summer', 'S', 'Green', 1299, 949, 480, 30),

('Classic Office Blazer', (SELECT category_id FROM categories WHERE category_name='Blazers' LIMIT 1), 'Formal', 'L', 'Black', 6999, 5499, 3200, 12),
('Slim Fit Blazer', (SELECT category_id FROM categories WHERE category_name='Blazers' LIMIT 1), 'Formal', 'M', 'Navy', 7499, 5999, 3500, 1),
('Textured Party Blazer', (SELECT category_id FROM categories WHERE category_name='Blazers' LIMIT 1), 'Party', 'XL', 'Grey', 7999, 6499, 3900, 0),
('Casual Blazer', (SELECT category_id FROM categories WHERE category_name='Blazers' LIMIT 1), 'Casual', 'M', 'Brown', 5999, 4499, 2600, 8),

('Straight Fit Jeans', (SELECT category_id FROM categories WHERE category_name='Jeans' LIMIT 1), 'Casual', 'M', 'Blue', 2499, 1899, 1050, 35),
('Slim Fit Jeans', (SELECT category_id FROM categories WHERE category_name='Jeans' LIMIT 1), 'Casual', 'L', 'Black', 2699, 2099, 1200, 22),
('Distressed Denim Jeans', (SELECT category_id FROM categories WHERE category_name='Jeans' LIMIT 1), 'Casual', 'M', 'Blue', 2999, 2399, 1400, 5),
('Tapered Fit Jeans', (SELECT category_id FROM categories WHERE category_name='Jeans' LIMIT 1), 'Casual', 'XL', 'Grey', 2799, 2199, 1300, 0),

('Leather Belt', (SELECT category_id FROM categories WHERE category_name='Accessories' LIMIT 1), 'Accessories', 'M', 'Brown', 1299, 999, 400, 50),
('Formal Tie', (SELECT category_id FROM categories WHERE category_name='Accessories' LIMIT 1), 'Formal', 'M', 'Maroon', 899, 649, 250, 40),
('Wallet', (SELECT category_id FROM categories WHERE category_name='Accessories' LIMIT 1), 'Accessories', 'M', 'Black', 1599, 1199, 550, 15),
('Pocket Square', (SELECT category_id FROM categories WHERE category_name='Accessories' LIMIT 1), 'Formal', 'M', 'White', 599, 399, 150, 0);

INSERT INTO orders (customer_id, order_date, order_status)
VALUES
(1, '2026-04-01', 'Delivered'),
(2, '2026-04-02', 'Delivered'),
(3, '2026-04-03', 'Shipped'),
(4, '2026-04-04', 'Processing'),
(5, '2026-04-05', 'Pending'),
(1, '2026-04-06', 'Delivered'),
(6, '2026-04-07', 'Cancelled'),
(7, '2026-04-08', 'Delivered'),
(8, '2026-04-09', 'Shipped'),
(9, '2026-04-10', 'Delivered'),
(2, '2026-04-11', 'Processing'),
(10, '2026-04-12', 'Delivered'),
(11, '2026-04-13', 'Pending'),
(12, '2026-04-14', 'Delivered'),
(3, '2026-04-15', 'Shipped'),
(13, '2026-04-16', 'Delivered'),
(14, '2026-04-17', 'Cancelled'),
(15, '2026-04-18', 'Delivered'),
(4, '2026-04-19', 'Processing'),
(5, '2026-04-20', 'Delivered'),
(6, '2026-04-21', 'Shipped'),
(7, '2026-04-22', 'Pending'),
(8, '2026-04-23', 'Delivered'),
(9, '2026-04-24', 'Delivered'),
(10, '2026-04-25', 'Processing'),
(11, '2026-04-26', 'Shipped'),
(12, '2026-04-27', 'Delivered'),
(13, '2026-04-28', 'Pending'),
(14, '2026-04-29', 'Delivered'),
(1, '2026-04-30', 'Shipped');

ALTER TABLE order_items
ADD COLUMN discount_percent DECIMAL(5,2) DEFAULT 0;

INSERT INTO order_items
(order_id, product_id, quantity, unit_price, discount_percent)
VALUES

(1, 1, 2, 1499, 10),
(1, 22, 1, 999, 0),
(2, 6, 1, 1899, 0),
(2, 23, 2, 649, 5),
(3, 10, 3, 699, 0),
(3, 11, 1, 899, 10),
(4, 14, 1, 5499, 15),
(4, 24, 1, 1199, 0),
(5, 2, 2, 1699, 0),
(6, 1, 1, 1499, 5),
(6, 18, 1, 1899, 0),
(7, 12, 1, 1099, 0),
(8, 19, 2, 2099, 10),
(9, 3, 1, 1299, 0),
(9, 25, 2, 399, 0),
(10, 15, 1, 5999, 10),
(11, 7, 1, 1799, 0),
(12, 13, 2, 949, 5),
(12, 22, 1, 999, 0),
(13, 20, 1, 2399, 0),
(14, 5, 2, 1399, 10),
(15, 8, 1, 2099, 0),
(15, 23, 1, 649, 0),
(16, 16, 1, 6499, 15),
(17, 21, 1, 2199, 0),
(18, 9, 1, 1999, 5),
(19, 4, 2, 1999, 0),
(20, 17, 1, 4499, 10),
(21, 10, 2, 699, 0),
(21, 11, 2, 899, 5),
(22, 18, 1, 1899, 0),
(23, 1, 1, 1499, 0),
(23, 22, 2, 999, 10),
(24, 6, 2, 1899, 5),
(25, 14, 1, 5499, 0),
(26, 19, 1, 2099, 10),
(27, 13, 1, 949, 0),
(28, 24, 1, 1199, 0),
(29, 2, 1, 1699, 5),
(30, 20, 1, 2399, 0);

INSERT INTO payments
(order_id, payment_method, payment_status, amount,
 payment_date, transaction_ref)
VALUES
(1, 'UPI', 'Paid', 3697.20, '2026-04-01', 'TXN1001'),
(2, 'Credit Card', 'Paid', 3134.55, '2026-04-02', 'TXN1002'),
(3, 'Cash on Delivery', 'Pending', 2996.00, NULL, NULL),
(4, 'Debit Card', 'Paid', 5898.00, '2026-04-04', 'TXN1004'),
(5, 'UPI', 'Pending', 3398.00, NULL, NULL),
(6, 'Credit Card', 'Paid', 3323.05, '2026-04-06', 'TXN1006'),
(7, 'UPI', 'Failed', 1099.00, '2026-04-07', NULL),
(8, 'Net Banking', 'Paid', 3778.20, '2026-04-08', 'TXN1008'),
(9, 'Cash on Delivery', 'Pending', 2097.00, NULL, NULL),
(10, 'UPI', 'Paid', 5998.00, '2026-04-10', 'TXN1010'),
(11, 'Debit Card', 'Paid', 1799.00, '2026-04-11', 'TXN1011'),
(12, 'Credit Card', 'Paid', 2799.55, '2026-04-12', 'TXN1012'),
(13, 'UPI', 'Pending', 2399.00, NULL, NULL),
(14, 'Net Banking', 'Paid', 2518.20, '2026-04-14', 'TXN1014'),
(15, 'Credit Card', 'Paid', 2748.00, '2026-04-15', 'TXN1015'),
(16, 'UPI', 'Paid', 5524.15, '2026-04-16', 'TXN1016'),
(17, 'Debit Card', 'Failed', 2199.00, '2026-04-17', NULL),
(18, 'UPI', 'Paid', 3798.00, '2026-04-18', 'TXN1018'),
(19, 'Credit Card', 'Pending', 3998.00, NULL, NULL),
(20, 'Net Banking', 'Paid', 4049.10, '2026-04-20', 'TXN1020'),
(21, 'UPI', 'Paid', 3016.10, '2026-04-21', 'TXN1021'),
(22, 'Cash on Delivery', 'Pending', 1899.00, NULL, NULL),
(23, 'Credit Card', 'Paid', 3297.20, '2026-04-23', 'TXN1023'),
(24, 'UPI', 'Paid', 3608.10, '2026-04-24', 'TXN1024'),
(25, 'Debit Card', 'Paid', 5499.00, '2026-04-25', 'TXN1025'),
(26, 'UPI', 'Paid', 1889.10, '2026-04-26', 'TXN1026'),
(27, 'Cash on Delivery', 'Pending', 949.00, NULL, NULL),
(28, 'Credit Card', 'Paid', 1199.00, '2026-04-28', 'TXN1028'),
(29, 'UPI', 'Paid', 1614.05, '2026-04-29', 'TXN1029'),
(30, 'Net Banking', 'Paid', 2399.00, '2026-04-30', 'TXN1030');

INSERT INTO shipments
(order_id, courier_name, tracking_number, shipped_date,
 delivery_date, shipment_status, shipping_cost)
VALUES
(1, 'Blue Dart', 'BD1001', '2026-04-01', '2026-04-03', 'Delivered', 80),
(2, 'Delhivery', 'DL1002', '2026-04-02', '2026-04-05', 'Delivered', 70),
(3, 'Blue Dart', 'BD1003', '2026-04-04', NULL, 'In Transit', 90),
(6, 'DTDC', 'DT1006', '2026-04-06', '2026-04-09', 'Delivered', 80),
(8, 'Delhivery', 'DL1008', '2026-04-08', '2026-04-10', 'Delivered', 70),
(9, 'Blue Dart', 'BD1009', '2026-04-10', NULL, 'In Transit', 90),
(10, 'DTDC', 'DT1010', '2026-04-10', '2026-04-13', 'Delivered', 80),
(12, 'Delhivery', 'DL1012', '2026-04-12', '2026-04-15', 'Delivered', 70),
(15, 'Blue Dart', 'BD1015', '2026-04-16', NULL, 'In Transit', 90),
(16, 'DTDC', 'DT1016', '2026-04-16', '2026-04-19', 'Delivered', 80),
(18, 'Delhivery', 'DL1018', '2026-04-18', '2026-04-21', 'Delivered', 70),
(20, 'Blue Dart', 'BD1020', '2026-04-20', '2026-04-23', 'Delivered', 90),
(21, 'DTDC', 'DT1021', '2026-04-22', NULL, 'In Transit', 80),
(23, 'Delhivery', 'DL1023', '2026-04-23', '2026-04-26', 'Delivered', 70),
(24, 'Blue Dart', 'BD1024', '2026-04-24', '2026-04-27', 'Delivered', 90),
(26, 'DTDC', 'DT1026', '2026-04-27', NULL, 'In Transit', 80),
(28, 'Delhivery', 'DL1028', '2026-04-28', '2026-05-01', 'Delivered', 70),
(30, 'Blue Dart', 'BD1030', '2026-04-30', NULL, 'In Transit', 90);

USE PETERENGLAND_SALES;

CREATE TABLE IF NOT EXISTS payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),
    payment_date DATE,
    transaction_ref VARCHAR(50),
    FOREIGN KEY (order_id)
	REFERENCES orders(order_id)
);

CREATE TABLE IF NOT EXISTS shipments (
    shipment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL UNIQUE,
    courier_name VARCHAR(100),
    tracking_number VARCHAR(50),
    shipped_date DATE,
    delivery_date DATE,
    shipment_status VARCHAR(30),
    shipping_cost DECIMAL(10,2),
    FOREIGN KEY (order_id)
	REFERENCES orders(order_id)
);

SELECT 'Customers' AS table_name, COUNT(*) AS total
FROM customers
UNION ALL
SELECT 'Categories', COUNT(*) FROM categories
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders
UNION ALL
SELECT 'Order Items', COUNT(*) FROM order_items
UNION ALL
SELECT 'Payments', COUNT(*) FROM payments
UNION ALL
SELECT 'Shipments', COUNT(*) FROM shipments;

Select * From Customers;

SELECT customer_name, email
FROM customers;

SELECT product_name, mrp, selling_price, stock_quantity
FROM products;

SELECT * FROM Orders;

SELECT *
FROM orders
WHERE order_status = 'Delivered';

-- Products with a price gretaer than Rs 1,000.

SELECT product_name, selling_price
FROM products
WHERE selling_price > 1000;

-- Products with stock quantity less than 10.

SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 10;

SELECT *
FROM customers
WHERE city = 'Mumbai';

-- Orders whose total amount is between Rs 1,000 & Rs 10,000.

SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    SUM(oi.quantity * oi.unit_price *
	(1 - COALESCE(oi.discount_percent, 0) / 100)
    ) AS total_amount
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date, o.order_status
HAVING total_amount BETWEEN 1000 AND 10000;

-- Products belonging to selected categories using IN.

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.selling_price
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
WHERE c.category_name IN ('Shirts', 'Trousers', 'Jeans');

-- Products with price greater than Rs 5,000.

SELECT product_id, product_name, selling_price
FROM products
WHERE selling_price > 5000;

-- Products with price less than or equal to Rs 2,000.

SELECT product_id, product_name, selling_price
FROM products
WHERE selling_price <= 2000;

-- Customers who are not from Mumbai.

SELECT *
FROM customers
WHERE city <> 'Mumbai';

-- Orders with total amounts between Rs 5,000 & Rs 20,000.

SELECT
    o.order_id,
    o.order_date,
    SUM(oi.quantity * oi.unit_price *
	(1 - COALESCE(oi.discount_percent, 0) / 100)
    ) AS total_amount
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date
HAVING total_amount BETWEEN 5000 AND 20000;

-- Products whose category belongs to a specific set of categories.

SELECT
    p.product_id,
    p.product_name,
    c.category_name
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
WHERE c.category_name IN ('Shirts', 'Trousers', 'Jeans');

-- Orders that are either completed or shipped.

SELECT *
FROM orders
WHERE order_status IN ('Delivered', 'Shipped');

-- Products where stock is gretater than 0 & rating is gretater than 4.

ALTER TABLE products
ADD COLUMN rating DECIMAL(2,1);

UPDATE products
SET rating = CASE
    WHEN product_id % 3 = 0 THEN 4.5
    WHEN product_id % 3 = 1 THEN 4.2
    ELSE 3.8
END;

SELECT product_id, product_name, stock_quantity, rating
FROM products
WHERE stock_quantity > 0
  AND rating > 4;
  
-- Customers who are from a particular city or a particular state.

SELECT *
FROM customers
WHERE city = 'Mumbai'
OR state = 'Maharashtra';

-- Product whose names contain the word "Shirt".

SELECT *
FROM products
WHERE product_name LIKE '%Shirt%';

-- Customers whose First name Starts with A.

SELECT *
FROM customers
WHERE customer_name LIKE 'A%';

-- NULL VALUE ANALYSIS

-- Customers whose email adress is NULL.

SELECT *
FROM customers
WHERE email IS NULL;

-- Customers whose phone number is NULL.

SELECT *
FROM customers
WHERE phone IS NULL;

-- Orders where the shipping adress is NULL.

ALTER TABLE orders
ADD COLUMN shipping_address VARCHAR(255);

SELECT *
FROM orders
WHERE shipping_address IS NULL;

-- shipmemts where the delivery date is NUll.

SELECT *
FROM shipments
WHERE delivery_date IS NULL; 

-- using COALESCE() to display 'Not Available' instead of NULL values.

SELECT
    customer_id,
    customer_name,
    COALESCE(email, 'Not Available') AS email,
    COALESCE(phone, 'Not Available') AS phone
FROM customers;

SELECT
    shipment_id,
    order_id,
    COALESCE(CAST(delivery_date AS CHAR),
	'Not Available'
    ) AS delivery_date
FROM shipments;

-- Identifying important columns where NUll Values mayn indicate data-quality problems.

SELECT
    'Customers' AS table_name,
    SUM(email IS NULL) AS missing_email,
    SUM(phone IS NULL) AS missing_phone
FROM customers

UNION ALL

SELECT
    'Products',
    SUM(selling_price IS NULL),
    SUM(stock_quantity IS NULL)
FROM products;

SELECT *
FROM payments
WHERE payment_method IS NULL
   OR payment_status IS NULL
   OR amount IS NULL;
   
-- Updates.

-- Update the stock quantity of a selected product.

UPDATE products
SET stock_quantity = 60
WHERE product_id = 1;

SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_id = 1;

-- Update the order status of selected order.

UPDATE orders
SET order_status = 'Delivered'
WHERE order_id = 3;

SELECT order_id, order_status
FROM orders
WHERE order_id = 3;
 
 -- Update the payment status of a selected Order.
 
UPDATE payments
SET payment_status = 'Paid',
    payment_date = '2026-10-12',
    transaction_ref = 'TXN1005'
WHERE order_id = 5;

SELECT *
FROM payments
WHERE order_id = 5;

-- Update shipment status after delivery.

UPDATE shipments
SET shipment_status = 'Delivered',
    delivery_date = '2026-10-12'
WHERE order_id = 3;

SELECT *
FROM shipments
WHERE order_id = 3;

-- String Functions.

-- Display customer full names using CONCAT()

SELECT
customer_id,
CONCAT('Customer: ', customer_name) AS full_name
FROM customers;

-- Display customer name in UPPERCASE

SELECT UPPER(customer_name) AS uppercase_name
FROM customers;

-- Display customer names in LOWERCASE

SELECT LOWER(customer_name) AS lowercase_name
FROM customers;

-- Find the length of each customer's full name.

SELECT
customer_name,
LENGTH(customer_name) AS name_length
FROM customers;

-- Display first three characters of each product name.

SELECT
    product_name,
    LEFT(product_name, 3) AS first_three_characters
FROM products;

-- Display Last three characters of each product name.

SELECT
    product_name,
    RIGHT(product_name, 3) AS last_three_characters
FROM products;

-- Extract a protion of each product name using SUBSTRING()

SELECT
    product_name,
    SUBSTRING(product_name, 1, 5) AS extracted_text
FROM products;

-- Remove unnecessary spaces from customer names using TRIM().

SELECT
    customer_name,
    TRIM(customer_name) AS cleaned_name
FROM customers;

-- Replace aspecific word from a product name using REPLACE().

SELECT
    product_name,
    REPLACE(product_name, 'Formal', 'Office') AS updated_name
FROM products;

-- Find products whose names contain a specific keyword using LOCATE().

SELECT
    product_name,
    LOCATE('Shirt', product_name) AS keyword_position
FROM products
WHERE LOCATE('Shirt', product_name) > 0;

-- Formatted customer identifier using customer ID and customer name.

SELECT
    customer_id,
    customer_name,
    CONCAT(
        'CUST-',
        LPAD(customer_id, 4, '0'),
        '-',
        UPPER(REPLACE(TRIM(customer_name), ' ', ''))
    ) AS customer_identifier
FROM customers;

-- Mathematical Functions.

-- Round product prices to the nearest integer.

SELECT
    product_name,
    selling_price,
    ROUND(selling_price) AS rounded_price
FROM products;

-- Round order amounts to two decimal points.

SELECT
    o.order_id,
    ROUND(
	SUM(
	oi.quantity * oi.unit_price *
	(1 - COALESCE(oi.discount_percent, 0) / 100)
	), 2
    ) AS order_amount
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- Calculating the absolute difference between product price and a fixed price.

SELECT
    product_name,
    selling_price,
    ABS(selling_price - 2000) AS price_difference
FROM products;

-- Calculate the total product value in stock using Price x StockQuantity.

SELECT
    product_name,
    selling_price,
    stock_quantity,
    selling_price * stock_quantity AS stock_value
FROM products;

-- Caluculate the Discount amount for every order item.

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    COALESCE(discount_percent, 0) AS discount_percent,
    ROUND(quantity * unit_price *COALESCE(discount_percent, 0) / 100,
	2
    ) AS discount_amount
FROM order_items;

-- Caluculate the final amount after discount for every order item.

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    COALESCE(discount_percent, 0) AS discount_percent,
    ROUND(
        quantity * unit_price *
        (1 - COALESCE(discount_percent, 0) / 100),
        2
    ) AS final_amount
FROM order_items;

-- Using GREATEST() & LEAST() to identify the higher and lower values between two numerical values.

SELECT
    product_name,
    selling_price,
    2000 AS target_price,
    GREATEST(selling_price, 2000) AS higher_value,
    LEAST(selling_price, 2000) AS lower_value
FROM products;

-- Date and time Fuctions.

-- year in which each customer registered.

SELECT
    customer_id,
    customer_name,
    YEAR(registration_date) AS registration_year
FROM customers;

-- Month of customer registration.

SELECT
    customer_name,
    MONTH(registration_date) AS registration_month
FROM customers;

-- Month name of each order.

SELECT
    order_id,
    order_date,
    MONTHNAME(order_date) AS order_month
FROM orders;

-- day name on which each order was placed.

SELECT
    order_id,
    order_date,
    DAYNAME(order_date) AS order_day
FROM orders;

-- Number of days between customer registration and their first order.

SELECT
    c.customer_id,
    c.customer_name,
    c.registration_date,
    MIN(o.order_date) AS first_order_date,
    DATEDIFF(MIN(o.order_date), c.registration_date) AS days_to_first_order
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.registration_date;
    
-- Number of days taken to deliver each shipmemt.

SELECT
    shipment_id,
    order_id,
    shipped_date,
    delivery_date,
    DATEDIFF(delivery_date, shipped_date) AS delivery_days
FROM shipments
WHERE shipped_date IS NOT NULL
AND delivery_date IS NOT NULL;

-- Orders palced during a particular year.

SELECT *
FROM orders
WHERE order_date >= '2026-01-01'
AND order_date < '2027-01-01';

-- Orders palced during a particular month.

SELECT *
FROM orders
WHERE order_date >= '2026-04-01'
  AND order_date < '2026-05-01';
  
-- Customers who registered within the lsst two years.

SELECT *
FROM customers
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
AND registration_date <= CURDATE();

-- Add 30 days to each order date.

SELECT
    order_id,
    order_date,
    DATE_ADD(order_date, INTERVAL 30 DAY) AS date_after_30_days
FROM orders;

-- Orders older than 30 days.

SELECT *
FROM orders
WHERE order_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Orders dates as DD-MM-YYYY.

SELECT
    order_id,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_order_date
FROM orders;

-- CASES WHEN

-- Create product price categories

SELECT
    product_id,
    product_name,
    selling_price,
    CASE
        WHEN selling_price < 500 THEN 'Budget'
        WHEN selling_price <= 2000 THEN 'Standard'
        WHEN selling_price <= 5000 THEN 'Premium'
        ELSE 'Luxury'
    END AS price_category
FROM products;

-- Create Stock Categories.

SELECT
    product_id,
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity = 0 THEN 'Out of Stock'
        WHEN stock_quantity BETWEEN 1 AND 10 THEN 'Low Stock'
        WHEN stock_quantity BETWEEN 11 AND 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_category
FROM products;

-- Create Order Value Categories.

SELECT
    o.order_id,
    ROUND(
        SUM(
            oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)
        ), 2
    ) AS order_amount,
    CASE
        WHEN SUM(oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)) < 1000
            THEN 'Low Value'
        WHEN SUM(oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)) <= 5000
            THEN 'Medium Value'
        WHEN SUM(oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)) <= 10000
            THEN 'High Value'
        ELSE 'Premium Order'
    END AS order_category
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- Customer Classification based on total spending

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(COALESCE(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 0), 2) AS total_spending,
    CASE
        WHEN COALESCE(SUM(
            oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)
        ), 0) < 2000 THEN 'Low Spender'
        WHEN COALESCE(SUM(
            oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)
        ), 0) <= 5000 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS customer_classification
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Shipment delivery classification.

SELECT
    shipment_id,
    order_id,
    shipped_date,
    delivery_date,
    CASE
        WHEN delivery_date IS NULL THEN 'Not Delivered'
        WHEN DATEDIFF(delivery_date, shipped_date) <= 3
            THEN 'Delivered Within 3 Days'
        WHEN DATEDIFF(delivery_date, shipped_date) <= 7
            THEN 'Delivered Within 7 Days'
        ELSE 'Delivered After 7 Days'
    END AS delivery_classification
FROM shipments;

SELECT
    shipment_id,
    order_id,
    CASE
        WHEN delivery_date IS NULL THEN 'Not Delivered'
        WHEN shipped_date IS NULL THEN 'Shipment Date Missing'
        WHEN DATEDIFF(delivery_date, shipped_date) <= 3
            THEN 'Delivered Within 3 Days'
        WHEN DATEDIFF(delivery_date, shipped_date) <= 7
            THEN 'Delivered Within 7 Days'
        ELSE 'Delivered After 7 Days'
    END AS delivery_classification
FROM shipments;

-- Aggregate Functions

-- Total Number of Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Number of Products
SELECT COUNT(*) AS total_products
FROM products;

-- Total Number of Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Revenue
SELECT
    ROUND(SUM(
        quantity * unit_price *
        (1 - COALESCE(discount_percent, 0) / 100)
    ), 2) AS total_revenue
FROM order_items;

SELECT
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- Average Order values
SELECT ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(
            quantity * unit_price *
            (1 - COALESCE(discount_percent, 0) / 100)
        ) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_totals;

-- Minimum Product Price
SELECT MIN(selling_price) AS minimum_product_price
FROM products;

-- Maximum Product price
SELECT MAX(selling_price) AS maximum_product_price
FROM products;

-- Average product rating
SELECT ROUND(AVG(rating), 2) AS average_product_rating
FROM products;

-- Total quantity of product sold
SELECT SUM(quantity) AS total_quantity_sold
FROM order_items;

-- Group by and having

-- Number of customers in each city
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Number of products in each category

SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;

-- Average product price by category

SELECT
    c.category_name,
    ROUND(AVG(p.selling_price), 2) AS average_price
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;

-- Total stock value by category

SELECT
    c.category_name,
    SUM(p.selling_price * p.stock_quantity) AS total_stock_value
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;

-- number of orders placed by each customer

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Total spending by each customer

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(COALESCE(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 0), 2) AS total_spending
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Average order value for each customer

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(AVG(order_totals.order_amount), 2) AS average_order_value
FROM customers c
JOIN (
    SELECT
        o.order_id,
        o.customer_id,
        SUM(
            oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)
        ) AS order_amount
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.customer_id
) AS order_totals ON c.customer_id = order_totals.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Total revenue generated by each category

SELECT
    c.category_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name;

-- Number of orders for each order status

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- Total payment amount by payment method
SELECT
    payment_method,
    SUM(amount) AS total_payment_amount
FROM payments
GROUP BY payment_method;

-- Display only categories having more than 3 products

SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(p.product_id) > 3;

-- Customers whose total spending is greater than Rs 20,000

SELECT
    c.customer_id,
    c.customer_name,
    SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spending > 20000;

-- Customers who have placed more than 3 orders

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3;

-- Order by and LIMIT

-- Top 5 most expensiven products

SELECT product_id, product_name, selling_price
FROM products
ORDER BY selling_price DESC
LIMIT 5;

-- 5 cheapest products

SELECT product_id, product_name, selling_price
FROM products
ORDER BY selling_price ASC
LIMIT 5;

-- Top 10 customers based on total spending

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 10;

-- Top 5 products based on quantity sold

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Top 5 categories based on revenue

SELECT
    c.category_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Joins

-- customers along with their orders

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_status
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;
    
-- Customer name, order, id, order date, and order amount

SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, o.order_id, o.order_date;

-- products along with their category names

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.selling_price
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;
    
-- orders details along with product names

SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.discount_percent
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id;
    
-- Customer, order, product, quantity, and unit price in one result

SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Payment information along with customer details

SELECT
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    p.payment_method,
    p.payment_status,
    p.amount,
    p.payment_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id;

-- Shipment information along with order details

SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    s.shipment_id,
    s.courier_name,
    s.tracking_number,
    s.shipped_date,
    s.delivery_date,
    s.shipment_status
FROM orders o
JOIN shipments s ON o.order_id = s.order_id;

-- Customers who have never placed an order using LEFT JOIN

SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Products that have never been ordered.

SELECT
    p.product_id,
    p.product_name,
    p.selling_price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- Compare INNER JOIN & LEFT JOIN results

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
    
-- Multiple Table Business Analysis

-- Revenue generated by each product

SELECT
    c.category_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

-- Revenue generated by each product

SELECT
    p.product_id,
    p.product_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- Customer who has spent the most money

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 1;

-- Product that generated the highest revenue

SELECT
    p.product_id,
    p.product_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Category with the highest total sales

SELECT
    c.category_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_sales
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_sales DESC
LIMIT 1;

-- Customer who purchased rpoducts form more than one category

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT p.category_id) AS categories_purchased
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT p.category_id) > 1;

-- Customers who have placed orders but have not made successful payments

SELECT DISTINCT
    c.customer_id,
    c.customer_name,
    o.order_id,
    p.payment_status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_id IS NULL
   OR p.payment_status IS NULL
   OR p.payment_status <> 'Paid';
   
-- Orders that have been paid but not shipped

SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    p.payment_status
FROM orders o
JOIN payments p ON o.order_id = p.order_id
LEFT JOIN shipments s ON o.order_id = s.order_id
WHERE p.payment_status = 'Paid'
  AND s.shipment_id IS NULL;
  
-- Orders that have been shipped but not delivered

SELECT
    o.order_id,
    s.shipment_id,
    s.courier_name,
    s.tracking_number,
    s.shipment_status,
    s.shipped_date
FROM orders o
JOIN shipments s ON o.order_id = s.order_id
WHERE s.shipped_date IS NOT NULL
  AND s.delivery_date IS NULL;
  
-- Products with high sales but low remaining stock

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    p.stock_quantity AS remaining_stock
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.stock_quantity
HAVING SUM(oi.quantity) >= 3
   AND p.stock_quantity <= 10
ORDER BY total_quantity_sold DESC;

-- Subqueries

-- Products whose price is greater than the average product price

SELECT product_id, product_name, selling_price
FROM products
WHERE selling_price > (
    SELECT AVG(selling_price)
    FROM products
);

-- Products whose price is Lower than the average product price

SELECT product_id, product_name, selling_price
FROM products
WHERE selling_price < (
    SELECT AVG(selling_price)
    FROM products
);

-- Customer who has the highesty total spending

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spending = (
    SELECT MAX(customer_total)
    FROM (
        SELECT
            o.customer_id,
            SUM(oi.quantity * oi.unit_price *
                (1 - COALESCE(oi.discount_percent, 0) / 100)
            ) AS customer_total
        FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    ) AS customer_totals
);

-- Customers who have placed at least one order using a subquery

SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

-- Products that have never been ordered using a subquery

SELECT product_id, product_name
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
    WHERE product_id IS NOT NULL
);

-- Products whose price is greater than the average price of their category

SELECT
    p.product_id,
    p.product_name,
    p.selling_price,
    c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.selling_price > (
    SELECT AVG(p2.selling_price)
    FROM products p2
    WHERE p2.category_id = p.category_id
);

-- Orders Containing the most expensive product

SELECT DISTINCT
    o.order_id,
    o.order_date,
    o.order_status
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.selling_price = (
    SELECT MAX(selling_price)
    FROM products
);

-- Customers who have purchased a product from the most expensive category

SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category_id IN (
    SELECT category_id
    FROM products
    GROUP BY category_id
    HAVING AVG(selling_price) = (
        SELECT MAX(category_avg_price)
        FROM (
            SELECT AVG(selling_price) AS category_avg_price
            FROM products
            GROUP BY category_id
        ) AS category_averages
    )
);

-- Exists / Not Exists

-- Customers who have at least one order using EXISTS

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Customers who have no order using NOT EXISTS

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Customers who have both orders and successful payments

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
AND EXISTS (
    SELECT 1
    FROM orders o
    JOIN payments p ON p.order_id = o.order_id
    WHERE o.customer_id = c.customer_id
      AND p.payment_status = 'Paid'
);

-- Views

-- Create a View conatining customer id, name, email, city, and state

CREATE OR REPLACE VIEW customer_details_view AS
SELECT customer_id, customer_name, email, city, state
FROM customers;

-- View containing product, category, price, stock, and rating

CREATE OR REPLACE VIEW product_details_view AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.selling_price,
    p.stock_quantity,
    p.rating
FROM products p
LEFT JOIN categories c
    ON p.category_id = c.category_id;
    
-- Customer spending view showing total spending by customer

CREATE OR REPLACE VIEW customer_spending_view AS
SELECT
    c.customer_id,
    c.customer_name,
    ROUND(COALESCE(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 0), 2) AS total_spending
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Category Performance view

CREATE OR REPLACE VIEW category_performance_view AS
SELECT
    c.category_id,
    c.category_name,
    COUNT(DISTINCT p.product_id) AS number_of_products,
    COALESCE(SUM(oi.quantity), 0) AS total_quantity_sold,
    ROUND(COALESCE(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 0), 2) AS total_revenue
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name;

-- Use a view to find the top 5 customers by revenue

SELECT *
FROM customer_spending_view
ORDER BY total_spending DESC
LIMIT 5;

-- Modify an excisting view using CREATE OR REPLACE VIEW.

CREATE OR REPLACE VIEW customer_details_view AS
SELECT
    customer_id,
    customer_name,
    email,
    phone,
    city,
    state
FROM customers;

-- Windows Fuctions

-- Rank Customers based on total spenf]ding using RANK()

SELECT
    customer_id,
    customer_name,
    total_spending,
    RANK() OVER (ORDER BY total_spending DESC) AS customer_rank
FROM customer_spending_view;

-- Use DENSE_RANK() to ranl products by price

SELECT
    product_id,
    product_name,
    selling_price,
    DENSE_RANK() OVER (
        ORDER BY selling_price DESC
    ) AS price_rank
FROM products;

-- Use ROW_NUMBER() to assigh a unique ranking to orders based on order amount

SELECT
    order_id,
    order_amount,
    ROW_NUMBER() OVER (
        ORDER BY order_amount DESC
    ) AS order_rank
FROM (
    SELECT
        order_id,
        SUM(
            quantity * unit_price *
            (1 - COALESCE(discount_percent, 0) / 100)
        ) AS order_amount
    FROM order_items
    GROUP BY order_id
) AS order_totals;

-- Caluculate Running total of sales

SELECT
    order_id,
    order_date,
    order_amount,
    SUM(order_amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM (
    SELECT
        o.order_id,
        o.order_date,
        SUM(
            oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)
        ) AS order_amount
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.order_date
) AS order_totals;

-- Calculate category-wise product ranking based on price

SELECT
    c.category_name,
    p.product_id,
    p.product_name,
    p.selling_price,
    RANK() OVER (
        PARTITION BY c.category_id
        ORDER BY p.selling_price DESC
    ) AS category_price_rank
FROM products p
JOIN categories c
    ON p.category_id = c.category_id;
    
-- Data Quality Analysis

-- All Customers with missing email addresses

SELECT *
FROM customers
WHERE email IS NULL;

-- Products with zero stocks

SELECT product_id, product_name, stock_quantity
FROM products
WHERE stock_quantity = 0;

-- Orders with missing shipping addresses

SELECT order_id, customer_id, order_date, shipping_address
FROM orders
WHERE shipping_address IS NULL;

-- Shipments where delivery date is earliuer than shipment date

SELECT
    shipment_id,
    order_id,
    shipped_date,
    delivery_date
FROM shipments
WHERE shipped_date IS NOT NULL
  AND delivery_date IS NOT NULL
  AND delivery_date < shipped_date;
  
-- Orders that do not have corresponding shipment records

SELECT
    o.order_id,
    o.order_date,
    o.order_status
FROM orders o
LEFT JOIN shipments s
    ON o.order_id = s.order_id
WHERE s.shipment_id IS NULL;

-- SQL QUERIES

-- What is the total revenue generated by the company?

SELECT ROUND(SUM(
    quantity * unit_price *
    (1 - COALESCE(discount_percent, 0) / 100)
), 2) AS total_revenue
FROM order_items;

-- What is the Aerage order value?

SELECT ROUND(AVG(order_amount), 2) AS average_order_value
FROM (
    SELECT order_id,
           SUM(quantity * unit_price *
               (1 - COALESCE(discount_percent, 0) / 100)
           ) AS order_amount
    FROM order_items
    GROUP BY order_id
) AS order_totals;

-- Which Customer generated the highest revenue?

SELECT c.customer_id, c.customer_name,
       ROUND(SUM(oi.quantity * oi.unit_price *
           (1 - COALESCE(oi.discount_percent, 0) / 100)
       ), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Which product generated the highest revenue?

SELECT p.product_id, p.product_name,
       ROUND(SUM(oi.quantity * oi.unit_price *
           (1 - COALESCE(oi.discount_percent, 0) / 100)
       ), 2) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Which category generated the highest revenue?

SELECT c.category_name,
       ROUND(SUM(oi.quantity * oi.unit_price *
           (1 - COALESCE(oi.discount_percent, 0) / 100)
       ), 2) AS total_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Which products are currently low ion stock but have high sales?

SELECT p.product_name,
       SUM(oi.quantity) AS quantity_sold,
       p.stock_quantity AS remaining_stock
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.stock_quantity
HAVING p.stock_quantity <= 10
   AND SUM(oi.quantity) >= 3
ORDER BY quantity_sold DESC;

-- Which customers have palced multiple orders?

SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;

-- What percentage of orders are completed?

SELECT ROUND(
    100.0 * SUM(order_status = 'Delivered') / NULLIF(COUNT(*), 0),
    2
) AS completed_order_percentage
FROM orders;

-- Which payment method is used mosy frequently?

SELECT payment_method,
       COUNT(*) AS usage_count
FROM payments
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 1;

-- How many orders are pending payment?

SELECT COUNT(DISTINCT order_id) AS pending_payment_orders
FROM payments
WHERE payment_status = 'Pending';

-- What is the average delivery time?

SELECT ROUND(
    AVG(DATEDIFF(delivery_date, shipped_date)), 2
) AS average_delivery_days
FROM shipments
WHERE shipped_date IS NOT NULL
  AND delivery_date IS NOT NULL;
  
-- which city generates the highest sales?

SELECT c.city,
       ROUND(SUM(oi.quantity * oi.unit_price *
           (1 - COALESCE(oi.discount_percent, 0) / 100)
       ), 2) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.city
ORDER BY total_sales DESC
LIMIT 1;

-- which state generates the highest sales?

SELECT c.state,
       ROUND(SUM(oi.quantity * oi.unit_price *
           (1 - COALESCE(oi.discount_percent, 0) / 100)
       ), 2) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.state
ORDER BY total_sales DESC
LIMIT 1;

-- which category has the highest number of products?

SELECT c.category_name,
       COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_products DESC
LIMIT 1;

-- Which customers purchase the highest numbern of products?

SELECT c.customer_id, c.customer_name,
       SUM(oi.quantity) AS total_products_purchased
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity) = (
    SELECT MAX(total_quantity)
    FROM (
        SELECT o2.customer_id,
               SUM(oi2.quantity) AS total_quantity
        FROM orders o2
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        GROUP BY o2.customer_id
    ) AS customer_totals
);

-- which customers have purchased products from multiple categories?

SELECT c.customer_id, c.customer_name,
       COUNT(DISTINCT p.category_id) AS categories_purchased
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT p.category_id) > 1;

-- Identify high value customers based on their total spending

SELECT c.customer_id, c.customer_name,
       ROUND(SUM(oi.quantity * oi.unit_price *
           (1 - COALESCE(oi.discount_percent, 0) / 100)
       ), 2) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spending > 20000
ORDER BY total_spending DESC;

-- Final Business report

-- customer analysis

-- A. Customer summary KPIs
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN EXISTS (
        SELECT 1 FROM orders o
        WHERE o.customer_id = c.customer_id
    ) THEN 1 ELSE 0 END) AS active_customers,
    SUM(CASE WHEN NOT EXISTS (
        SELECT 1 FROM orders o
        WHERE o.customer_id = c.customer_id
    ) THEN 1 ELSE 0 END) AS customers_with_no_orders
FROM customers c;

-- B. Top customers by spending
SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 10;

-- C. Average customer spending (including customers with no orders)
SELECT ROUND(AVG(total_spending), 2) AS average_customer_spending
FROM (
    SELECT
        c.customer_id,
        COALESCE(SUM(
            oi.quantity * oi.unit_price *
            (1 - COALESCE(oi.discount_percent, 0) / 100)
        ), 0) AS total_spending
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id
) AS customer_totals;

-- Prepare product analysis

-- A. Total products
SELECT COUNT(*) AS total_products
FROM products;

-- B. highest priced products
SELECT product_id, product_name, selling_price
FROM products
ORDER BY selling_price DESC
LIMIT 5;

-- C. Best Selling products
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY quantity_sold DESC
LIMIT 5;

-- Prepare a sales analysis

-- A. Total orders and revenue
SELECT
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT ROUND(SUM(
        quantity * unit_price *
        (1 - COALESCE(discount_percent, 0) / 100)
    ), 2) FROM order_items) AS total_revenue;
    
-- B. Average order value

SELECT ROUND(AVG(order_amount), 2) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(quantity * unit_price *
            (1 - COALESCE(discount_percent, 0) / 100)
        ) AS order_amount
    FROM order_items
    GROUP BY order_id
) AS order_totals;

-- C. highest value order
SELECT
    o.order_id,
    o.order_date,
    ROUND(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 2) AS order_amount
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date
ORDER BY order_amount DESC
LIMIT 1;

-- Category analaysis

SELECT
    c.category_name,
    COUNT(DISTINCT p.product_id) AS number_of_products,
    COALESCE(SUM(oi.quantity), 0) AS quantity_sold,
    ROUND(COALESCE(SUM(
        oi.quantity * oi.unit_price *
        (1 - COALESCE(oi.discount_percent, 0) / 100)
    ), 0), 2) AS total_revenue,
    ROUND(AVG(p.selling_price), 2) AS average_product_price
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

-- Payment anaysis

-- A. Payment method distribution
SELECT
    payment_method,
    COUNT(*) AS payment_count,
    ROUND(SUM(amount), 2) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY payment_count DESC;

-- B. Successful, failed, and pending payments

SELECT
    payment_status,
    COUNT(*) AS payment_count,
    ROUND(SUM(amount), 2) AS total_amount
FROM payments
GROUP BY payment_status;

-- Delivery analysis

-- A. shipment analysis

SELECT
    COUNT(*) AS total_shipments,
    SUM(CASE WHEN delivery_date IS NOT NULL
             THEN 1 ELSE 0 END) AS delivered_shipments,
    SUM(CASE WHEN delivery_date IS NULL
             THEN 1 ELSE 0 END) AS pending_shipments,
    ROUND(AVG(
        CASE WHEN shipped_date IS NOT NULL
                   AND delivery_date IS NOT NULL
             THEN DATEDIFF(delivery_date, shipped_date)
        END
    ), 2) AS average_delivery_days
FROM shipments;

-- B. Courier wise delivery performance

SELECT
    courier_name,
    COUNT(*) AS total_shipments,
    SUM(CASE WHEN delivery_date IS NOT NULL
             THEN 1 ELSE 0 END) AS delivered_shipments,
    ROUND(AVG(
        CASE WHEN shipped_date IS NOT NULL
                   AND delivery_date IS NOT NULL
             THEN DATEDIFF(delivery_date, shipped_date)
        END
    ), 2) AS average_delivery_days
FROM shipments
GROUP BY courier_name
ORDER BY delivered_shipments DESC;

-- atleast five business problems and provide SQL evidence

-- 1. product with low or zero stock

SELECT product_id, product_name, stock_quantity
FROM products
WHERE stock_quantity <= 10
ORDER BY stock_quantity;

-- 2. customers who have never ordered
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- 3. orders without payment records
SELECT o.order_id, o.order_date, o.order_status
FROM orders o
WHERE NOT EXISTS (
    SELECT 1
    FROM payments p
    WHERE p.order_id = o.order_id
);

-- 4. orders without shipping records
SELECT o.order_id, o.order_date, o.order_status
FROM orders o
WHERE NOT EXISTS (
    SELECT 1
    FROM shipments s
    WHERE s.order_id = o.order_id
);

-- 5. payments that do not match order totals
SELECT
    p.payment_id,
    p.order_id,
    p.amount AS payment_amount,
    ot.order_amount
FROM payments p
JOIN (
    SELECT order_id,
           SUM(quantity * unit_price *
               (1 - COALESCE(discount_percent, 0) / 100)
           ) AS order_amount
    FROM order_items
    GROUP BY order_id
) ot ON p.order_id = ot.order_id
WHERE p.amount IS NOT NULL
  AND ABS(p.amount - ot.order_amount) > 0.01;
  
-- Final SQl report

SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,

    (SELECT COUNT(DISTINCT customer_id)
     FROM orders) AS customers_with_orders,

    (SELECT COUNT(*) FROM products) AS total_products,

    (SELECT COUNT(*) FROM orders) AS total_orders,

    (SELECT ROUND(SUM(
        quantity * unit_price *
        (1 - COALESCE(discount_percent, 0) / 100)
    ), 2)
     FROM order_items) AS total_revenue,

    (SELECT ROUND(AVG(order_amount), 2)
     FROM (
         SELECT order_id,
                SUM(quantity * unit_price *
                    (1 - COALESCE(discount_percent, 0) / 100)
                ) AS order_amount
         FROM order_items
         GROUP BY order_id
     ) AS order_totals) AS average_order_value,

    (SELECT COUNT(*)
     FROM products
     WHERE stock_quantity <= 10) AS low_stock_products,

    (SELECT COUNT(*)
     FROM orders o
     WHERE NOT EXISTS (
         SELECT 1 FROM payments p
         WHERE p.order_id = o.order_id
     )) AS orders_without_payments,

    (SELECT COUNT(*)
     FROM orders o
     WHERE NOT EXISTS (
         SELECT 1 FROM shipments s
         WHERE s.order_id = o.order_id
     )) AS orders_without_shipments;