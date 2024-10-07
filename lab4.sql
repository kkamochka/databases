

CREATE DATABASE lab4;

--создаем таблицу Warehouses
CREATE TABLE Warehouses (
    code INTEGER PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);


INSERT INTO Warehouses (code, location, capacity) VALUES -- добавляем данные Warehouses
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 2),
(5, 'San Francisco', 8);


CREATE TABLE Boxes ( --создаем таблицу Boxes
    code CHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);


INSERT INTO Boxes (code, contents, value, warehouse) VALUES -- добавляем данные в Boxes
('OMN7', 'Rocks', 180, 1),
('4H8P', 'Rocks', 250, 4),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 2),
('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouses;
SELECT * FROM Boxes WHERE value > 150;


SELECT DISTINCT contents FROM Boxes; -- выбираем все те, чторазличаются по содержимому

SELECT warehouse, COUNT(*) AS box_count FROM Boxes GROUP BY warehouse; -- а тут мы выбираем код склада и номер ящика в каждом складе warehouse


SELECT warehouse, COUNT(*) AS box_count FROM Boxes GROUP BY warehouse HAVING COUNT(*) > 2; -- выбиарем ток те где больше 2 ящиков


INSERT INTO Warehouses (code, location, capacity) VALUES (6, 'New York', 3); --добавляем
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes -- по заданию уменьшаем на 15прц 
SET value = value * 0.85
WHERE code = (
    SELECT code FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2
);

DELETE FROM Boxes WHERE value < 150;

DELETE FROM Boxes
USING Warehouses
WHERE Boxes.warehouse = Warehouses.code AND Warehouses.location = 'New York'
RETURNING Boxes.*;
