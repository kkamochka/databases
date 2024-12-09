create table books (
    book_id int primary key,
    title varchar(100),
    author varchar(100),
    price decimal(10, 2),
    quantity int
);

create table customers (
    customer_id int primary key,
    name varchar(100),
    email varchar(100)
);

create table orders (
    order_id int primary key,
    book_id int,
    customer_id int,
    order_date date,
    quantity int,
    foreign key (book_id) references books(book_id),
    foreign key (customer_id) references customers(customer_id)
);

insert into books (book_id, title, author, price, quantity)
values
    (1, 'database', 'k. pak', 40.00, 10),
    (2, 'oop', 'b. johnson', 35.00, 10),
    (3, 'ads', 'p. leen', 50.00, 15);

insert into customers (customer_id, name, email)
values
    (101, 'calvin', 'c_calvin@gmail.com'),
    (102, 'klein', 'k_kleine@gmail.com');

----------------------------------------------------------------

begin transaction;

insert into orders (order_id, book_id, customer_id, order_date, quantity)
values (1, 1, 101, current_date, 2);

update books
set quantity = quantity - 2
where book_id = 1;

commit;

----------------------------------------------------------------

begin transaction;

do $$
begin
    if (select quantity from books where book_id = 3) < 10 then
        rollback;
        raise notice 'недостаточно книг в наличии';
    else
        insert into orders (order_id, book_id, customer_id, order_date, quantity)
        values (2, 3, 102, current_date, 10);

        update books
        set quantity = quantity - 10
        where book_id = 3;

        commit;
    end if;
end $$;
----------------------------------------------------------------

set transaction isolation level read committed;

begin transaction;

update books
set price = 45.00
where book_id = 1;

set transaction isolation level read committed;
begin transaction;

-- read price before commit
select price from books where book_id = 1;
-- and after
select price from books where book_id = 1;

commit;

----------------------------------------------------------------

begin transaction;

update customers
set email = 'new_email@gmail.com'
where customer_id = 101;

commit;

select * from customers where customer_id = 101;
