DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS products CASCADE;

CREATE TABLE employee(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER
);

create table products (
    id serial primary key,
    name text not null,
    price numeric(10, 2) not null,
    stock int not null,
    category text not null
);

INSERT INTO employee (first_name, last_name, email, phone_number, salary)
VALUES
    ('Malika', 'Barzhaksy', 'm.barzhaksy@example.com', '87777716868', 200000),
    ('Janar', 'Kalieva', 'j.kalieva@example.com', '87777726868', 300000),
    ('Alina', 'Mubarakova', 'a.mubarakova@example.com', '87777736868', 280000),
    ('Bogdan', 'Perevalov', 'b.perevalov@example.com', '87777746868', 350000);

insert into products (name, price, stock, category)
values
    ('Smartphone', 599.99, 50, 'Electronics'),
    ('Laptop', 999.99, 20, 'Electronics'),
    ('Headphones', 199.99, 100, 'Electronics'),
    ('Chair', 49.99, 200, 'Furniture'),
    ('Table', 129.99, 150, 'Furniture'),
    ('Sofa', 799.99, 10, 'Furniture');

----------------------------------------------------------------
/*1. Write a stored procedure named increase_value that takes one
integer parameter and returns the parameter value increased by
10.*/

create or replace function increase_value(input_value int, output_value int)
returns int as $$
BEGIN
    return output_value = input_value + 10;
END;
$$ language plpgsql;
---------------------------------------------------------------- done

/*2. Create a stored procedure compare_numbers that takes two
integers and returns 'Greater', 'Equal', or ‘Lesser' as an out
parameter, depending on the comparison result of these two
numbers.*/

create or replace function compare_numbers(num1 int, num2 int)
returns text as $$
BEGIN
    if num1 > num2 then
        return 'Greater';
    elseif num1 = num2 then
        return 'Equal';
    else
        return 'Lesser';
    end if;
END;
$$ language plpgsql;
---------------------------------------------------------------- done

/*3. Write a stored procedure number_series that takes an integer n
and returns a series from 1 to n. Use a looping construct within
the procedure.*/

create or replace function number_series(n int)
returns table (series int) as $$
declare
    i int := 1;
begin
    while i <= n loop
        return query select i ;
        i := i+1;
        end loop;
end;
    $$ language plpgsql;

select from number_series (6);
-------------------------------------------------------

/*4. Write a stored procedure find_employee that takes an
employee name as a parameter and returns the employee
details by performing a query.*/

create or replace function find_employee(emp_name text)
returns table( id int, firstname text) as $$
begin
    return query
        select id, employee.first_name
    from employee
    where firstname = emp_name;
end;
$$ language plpgsql;
    select*from find_employee('Malika');
----------------------------------------------------------------

/*5. Develop a stored procedure list_products that returns a table
with product details from a given category*/

create or replace function list_products(cathegory_name text)
returns table (product_id int, product_name text) as $$
    begin
        return query
        select id, name, price from products where category = cathegory_name;
    end;
    $$ language plpgsql;

    select * from list_products('Electronics');
----------------------------------------------------------------

/*6. Create two stored procedures where the first procedure calls
the second one. For example, a procedure calculate_bonus
that calculates a bonus, and another procedure update_salary
that uses calculate_bonus to update the salary of an employee.*/

create or replace function calculate_bonus(employee_id int, bonus_percentage numeric)
returns numeric as $$
    declare 
        current_salary numeric;
        bonus numeric;
    begin 
        select salary 
        into current_salary 
        from employee 
        where employee_id = $1;
        bonus:= current_salary *
                (bonus_percentage/100);
        return bonus;
    end;

    $$ language plpgsql;

create or replace function update_salary(employee_id int, bonus_percentage numeric)
language plpgsql as $$
    declare bonus numeric;
    begin
        bonus := calculate_bonus(employee_id, bonus_percentage);
        update employee 
        set salary = salary + bonus 
        where employee_id = $1;
        end;
    $$;
    
