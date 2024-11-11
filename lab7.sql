DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS locations CASCADE;

CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(25),
    city VARCHAR(30),
    state VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(30) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations(location_id)
);

CREATE TABLE employee(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments(department_id)
);

INSERT INTO locations (street_address, postal_code, city, state)
VALUES
    ('Dostyk', '10001', 'Almaty', 'ALA'),
    ('Abaya', '10010', 'Astana', 'AST'),
    ('Tole Bi', '10100', 'Balkhash', 'KG');

INSERT INTO departments (department_name, budget, location_id)
VALUES
    ('HR', 500000, 1),
    ('Sales', 800000, 2),
    ('IT', 1000000, 3),
    ('Marketing', 600000, NULL);

INSERT INTO employee (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('Malika', 'Barzhaksy', 'm.barzhaksy@example.com', '87777716868', 200000, 1),
    ('Janar', 'Kalieva', 'j.kalieva@example.com', '87777726868', 300000, 2),
    ('Alina', 'Mubarakova', 'a.mubarakova@example.com', '87777736868', 280000, 3),
    ('Bogdan', 'Perevalov', 'b.perevalov@example.com', '87777746868', 350000, NULL)

/*SELECT * FROM countries WHERE name = ‘string’;*/
create index idx_countries_name on locations(city);

/*SELECT * FROM employees WHERE name = ‘string’
AND surname = ‘string’;*/
create INDEX idx_employees_name_surname on employee(first_name, last_name);

/*SELECT * FROM employees WHERE salary < value1
AND salary > value2;*/
create unique INDEX idx_employees_salary_range on employee(salary);

/*SELECT * FROM employees WHERE substring(name
from 1 for 4) = ‘abcd’;*/
create INDEX idx_employees_name_substring on employee((substring(first_name from 1 for 4)));

/*SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id WHERE
d.budget > value2 AND e.salary < value2;*/
create INDEX idx_employees_departments_budget_salary on employee(department_id);
create INDEX idx_departments_budget on departments(budget);
