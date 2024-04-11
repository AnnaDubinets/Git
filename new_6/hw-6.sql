Задача 1. Вывести стоимость заказа 10258

SELECT *
FROM OrderDetails
WHERE OrderID = 10258


Задача 2. Вывести кол/распределение заказов по клиентам (проекция: имяклиента, ко-возаказов)


SELECT 
Customers.CustomerName, 
COUNT(Orders.OrderID) AS order_count
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName

Задача 3. Вывести кол/распределение заказов по менеджерам (проекция: фамилияменеджера, ко-возаказов)

SELECT 
Employees.LastName, 
COUNT(Orders.OrderID) AS order_count
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.LastName


Задача 4. Вывести минимальную стоимость товаров для каждой категории (проекция: названиекатегории, минстоимость_товаров)

SELECT Categories.CategoryName, 
MIN(Products.Price) AS min_price
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName


Задача 6. Вывести доход каждого менеджера за весь период, исходя из ставки в 5% от суммы его заказов (проекция: фамилия_менеджера, доход)

SELECT
	Employees.LastName,
	SUM(OrderDetails.Quantity * Products.Price) * .05 AS salary
FROM OrderDetails

JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

GROUP BY Employees.EmployeeID