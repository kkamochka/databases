CREATE DATABASE lab 1;
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (id)
);
ALTER TABLE users ADD isadmin INT;
ALTER TABLE users MODIFY isadmin BOOLEAN;
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;
CREATE TABLE tasks (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    user_id INT,
    PRIMARY KEY (id)
);
DROP TABLE tasks;
DROP DATABASE "lab 1";
