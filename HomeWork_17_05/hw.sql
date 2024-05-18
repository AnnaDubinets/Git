
1. Создать таблицу друзей с использованием механизма валидации данных в SQL

CREATE TABLE friends (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


2. Добавить в таблицу друзей несколько записей

INSERT INTO friends (first_name, last_name, email, phone_number) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567');


3. Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)

