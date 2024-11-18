DROP TABLE IF EXISTS salesman CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;

create table salesman (
    salesman_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    commission DECIMAL(5, 2)
);

create table customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    grade INT,
    salesman_id INT REFERENCES salesman(salesman_id)
);

create table orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    customer_id INT REFERENCES customers(customer_id),
    salesman_id INT REFERENCES salesman(salesman_id)
);

create role junior_dev login;

/*Create a view for those salesmen belongs to the city New York.*/
create view ny_salesmen as
select * from salesman where city = 'New York';

/*Create a view that shows for each order the salesman and
customer by name. Grant all privileges to «junior_dev" */
create view order_salesman_customer as
select o.order_id, o.order_date, s.name as salesman_name, c.name as customer_name
from orders o
join salesman s on o.salesman_id = s.salesman_id
join customers c on o.customer_id = c.customer_id;

grant all privileges select order_salesman_customer to junior_dev;

/*Create a view that shows all of the customers who have the
highest grade. Grant only select statements to «junior_dev»*/
create view top_customers as
select * from customers
where grade = (select MAX(grade) from customers);

grant select on top_customers to junior_dev;

/*Create a view that shows the number of the salesman in each
city.*/
create view salesman_count_by_city as
select city, COUNT(*) as number_of_salesmen from salesman
group by city;

/*Create a view that shows each salesman with more than one
customers*/
create view salesmen_with_multiple_customers as
select s.salesman_id, s.name, COUNT(c.customer_id) as customer_count
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.salesman_id, s.name
having COUNT(c.customer_id) > 1;

/*Create role «intern» and give all privileges of «junior_dev».*/
create role intern;
grant junior_dev to intern;

