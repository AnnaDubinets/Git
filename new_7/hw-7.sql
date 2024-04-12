Задача 1. Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов (проекция: название_компании, ко-во заказов)





Задача 2. Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)

SELECT OrderID, 
COUNT(ProductID) AS num_products_in_order
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(ProductID) >= 3


Задача 3. Вывести минимальную стоимость товара для каждой категории, кроме категории 2 (проекция: названиекатегории, минстоимость_товара)

SELECT Categories.CategoryName, 
MIN(Products.Price) AS min_price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE NOT Categories.CategoryID = 2
GROUP BY Categories.CategoryName


Задача 4. Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов (проекция: фамилияменеджера, к-восозданных_заказов)

SELECT LastName, 
COUNT(OrderID) AS num_orders_created
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID 
GROUP BY LastName
ORDER BY num_orders_created DESC


Задача 5. Вывести данные о товарах от поставщиков 4 и 8 (проекция: всеимеющиесяполя, ценасоскидкой1.5процента, ценаснаценкой0.5процента)


SELECT *,
       Price * 0.985 AS discounted_price, 
       Price * 1.005 AS markup_price
FROM Products
WHERE SupplierID IN (4, 8)