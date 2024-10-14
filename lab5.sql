CREATE DATABASE lab5;

CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

CREATE TABLE Orders (
    order_number INT,
    purchase_amount DECIMAL(10, 2),
    order_date DATE,
    customer_id INT,
    salesman_id INT
);

CREATE TABLE Salesman (
    salesman_id INT,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAl(3, 2)
);

INSERT INTO Customers VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO Orders VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

INSERT INTO Salesman VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

--3 задание
SELECT SUM(purchase_amount) AS total_purchase_amount
FROM Orders;

--4 задание
SELECT AVG(purchase_amount) AS average_purchase_amount
FROM Orders;

--5 задание
SELECT COUNT(customer_name) AS count_customer_name
FROM Customers;

--6 задание
SELECT MIN(purchase_amount) AS minimum_purchase_amount
FROM Orders;

--7 задание
SELECT * FROM customers
WHERE customer_name LIKE '%b';
