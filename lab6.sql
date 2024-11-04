CREATE DATABASE lab6 IF NOT EXISTS;

drop table locations;
CREATE TABLE location(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(25),
    city VARCHAR(30),
    state VARCHAR(12),
);

drop table departments;
CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(30) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES location
);

drop table employees;
CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);
/* Select the first name, last name, department id, and department name for each employee.*/

select employees.first_name, employees.last_name, employees.department_id, departments.department_name FROM employees
join departments on employees.department_id = departments.department_id;

/*Select the first name, last name, department id and department name, for all employees for departments 80 or 40.*/

Select employee.first_name, employee.last_name, employee.department, employee.department_name from employee
join departnemts into employee.department_id = departments.department_id;
where employee.department_id in (40, 80);

/*Select the first and last name, department, city, and state province for each employee*/
Select employee.first_name, employee.last_name, department.department_name, location.city, location.state
from employee
join department on employee.department_id = department.department_id;
join location on department.location_id = location.location_id;

/*Select all departments including those where does not have any employee*/
select departments.department_id, departments.department_name,  employees.employee_id,  employees.first_name,  employees.last_name
from departments
left join  employees on departments.department_id = employees.department_id;

/*Select the first name, last name, department id and name, for
all employees who have or have not any department.*/
select  employees.first_name,  employees.last_name,  employees.department_id,  departments.department_name
from  employees
left join departments on employees.department_id = departments.department_id;
