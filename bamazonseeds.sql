CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products(
item_id INT AUTO_INCREMENT NOT NULL,
product_name VARCHAR (255),
department_name VARCHAR (255),
price DECIMAL (50, 2),
stock_quantity INT,
PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('almonds', 'food', 11.68, 20); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('rice','food', 5.99, 50); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('basketball', 'sports', 22.17, 40); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('weights', 'sports', 55.95, 9); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('tshirt', 'clothes', 16.00, 90); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('sandals', 'clothes', 28.56, 57); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('kindle', 'tech', 119.99, 200); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('laptop', 'tech', 389.55, 4); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('DVD', 'media', 5.65, 30); 
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('book', 'media', 17.99, 80); 