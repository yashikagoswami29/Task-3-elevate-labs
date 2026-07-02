CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);

INSERT INTO customers VALUES
(1,'Rahul','Delhi'),
(2,'Priya','Mumbai'),
(3,'Amit','Jaipur'),
(4,'Neha','Pune');

INSERT INTO products VALUES
(101,'Laptop',50000),
(102,'Mobile',20000),
(103,'Headphones',3000),
(104,'Keyboard',1500);

INSERT INTO orders VALUES
(1,1,101,1,'2025-07-01'),
(2,2,102,2,'2025-07-02'),
(3,3,103,3,'2025-07-03'),
(4,1,104,2,'2025-07-04'),
(5,4,102,1,'2025-07-05');

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

SELECT * FROM products
WHERE price > 5000;

SELECT * FROM products
ORDER BY price DESC;

SELECT customer_id,
SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer_id;

SELECT c.customer_name,
p.product_name,
o.quantity
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id;

SELECT c.customer_name,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name,
       o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT *
FROM products
WHERE price >
(
SELECT AVG(price)
FROM products
);

SELECT SUM(quantity) AS total_quantity
FROM orders;

SELECT AVG(price) AS average_price
FROM products;

CREATE VIEW sales_summary AS
SELECT customer_id,
SUM(quantity) AS total_sales
FROM orders
GROUP BY customer_id;

SELECT * FROM sales_summary;

CREATE INDEX idx_customer
ON orders(customer_id);


