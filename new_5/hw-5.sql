Задача 1. Вывести ко-во поставщиков не из UK и не из China

SELECT 
COUNT(*)
FROM Suppliers
WHERE 
Country NOT IN ('UK', 'China')

Задача 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT 
    AVG(Price) AS AvgPrice,
    MAX(Price) AS MaxPrice,
    MIN(Price) AS MinPrice,
    COUNT(*) AS TotalProducts
FROM Products
WHERE 
CategoryID IN (3, 5)

Задача 3. Вывести общую сумму проданных товаров

SELECT 
SUM(Products.Price) AS TotalSales
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID

Задача 4. Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)

SELECT 
    Orders.OrderID,
    Customers.CustomerName,
    Customers.Country,
    Employees.LastName AS ManagerLastName,
    Shippers.ShipperName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID



Задача 5. Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT 
SUM(Products.Price) AS TotalSalesGermany
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID