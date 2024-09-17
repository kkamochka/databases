CREATE DATABASE lab1;
CREATE TABLE clients(
    client_id SERIAL,
    first_name VARCHAR(60),
    last_name VARCHAR(60),
    email VARCHAR(100),
    date_joined DATE
);
ALTER TABLE clients
ADD COLUMN status INTEGER CHECK(status=1 OR status=0);
ALTER TABLE clients DROP CONSTRAINT clients_status_check,
ALTER COLUMN status TYPE BOOLEAN USING CASE WHEN status = 0 then FALSE WHEN status = 1 then TRUE
    else FALSE END;
ALTER TABLE clients
ALTER COLUMN status SET DEFAULT TRUE;
ALTER TABLE clients
ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
CREATE TABLE orders(
    order_id SERIAL,
    order_name VARCHAR(100),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);
SELECT * FROM clients;
DROP TABLE orders;
DROP DATABASE lab1;