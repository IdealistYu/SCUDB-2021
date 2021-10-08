SELECT ProductName, CompanyName, ContactName
FROM (SELECT ProductName, CompanyName, ContactName, MIN(OrderDate)
FROM Product, OrderDetail, 'Order', Customer
WHERE Discontinued=1 AND ProductId=Product.Id AND OrderId='Order'.Id AND CustomerId=Customer.Id
GROUP BY ProductName
ORDER BY ProductName);