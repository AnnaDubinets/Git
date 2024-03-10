Задача 1. Вывести данные о товарах (проекция: названиетовара, цена, названиекатегории, названиекомпаниипоставщика)

SELECT 
       Products.ProductName AS Name_Product,
       Products.Price AS Price,
       Categories.CategoryName AS Name_Category,
       Suppliers.SupplierName AS Name_Company
FROM Products
JOIN Categories ON Products.CategoryId = Categories.CategoryId
JOIN Suppliers ON Products.SupplierId = Suppliers.SupplierID


Задача 2. Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)


SELECT Orders.OrderID AS Number_Orders,
       Customers.CustomerName AS Firstname_Customer,
       Customers.Country AS Country_Clients
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE  NOT Customers.Country = 'France'


Задача 3. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT
		ProductName AS Name_product,
        Price * 1.08 AS Price_USD 
FROM Products
ORDER BY Price DESC
LIMIT 1


Задача 4. Вывести список стран, которые поставляют морепродукты

SELECT 
    Customers.Country
FROM Orders
JOIN Customers ON Orders.CustomerId = Customers.CustomerID
JOIN Products ON Orders.ProductID = Products.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE 
    Categories.CategoryName = 'SeeFoods'


Задача 5. Вывести два самых дорогих товара из категории Beverages из USA

SELECT 
		Products.ProductName AS NameProduct,
        Products.Price AS PriceProduct
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
  Categories.CategoryName = 'Beverages' AND Customers.country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2
