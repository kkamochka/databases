DROP database lab5;
CREATE DATABASE lab5;

drop table customers;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255) ,
    city VARCHAR(255) ,
    grade integer,
    salesman_id VARCHAR(255)
);

drop table orders;

CREATE TABLE orders(
    order_num INT PRIMARY KEY,
    puch_amount DECIMAL(10,2),
    order_date DATE,
    customer_id INT,
    salesman_id INT,
    name VARCHAR(255),
    city VARCHAR(255),
    comission INT
    );

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAl(3, 2)
);

INSERT INTO customers VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

INSERT INTO salesman VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

/* 3. Select the total purchase amount of all orders.*/
SELECT SUM(puch_amount) AS total_purchase_amount
FROM orders;

/* 4. Select the average purchase amount of all orders.*/
SELECT AVG(puch_amount) AS total_purchase_amount
FROM orders;

/*5. Select how many customer have listed their names.*/
SELECT COUNT(DISTINCT cust_name) AS number_of_customers
FROM customers;

/* 6. Select the minimum purchase amount of all the orders.*/
SELECT MIN(puch_amount) AS minimum_purchase_amount
FROM orders;

/* 7. Select customer with all information whose name ends with the
letter 'b'.*/
SELECT *
FROM customers
WHERE cust_name LIKE '%b';

/* 8. Select the average purchase amount of all orders made in the
last 30 days.*/
SELECT AVG(puch_amount) AS average_purchase_amount
FROM orders
