WITH 
Base AS (SELECT Product.Id, ProductName AS Name FROM Product, OrderDetail, 'Order', Customer WHERE Product.Id=ProductId AND 'Order'.Id=OrderId AND CustomerId=Customer.Id AND CompanyName='Queen Cozinha' AND OrderDate like '2014-12-25%' GROUP BY ProductId),
Temp AS (SELECT row_number() OVER (ORDER BY Id) AS Seqnum, Name FROM Base),
Res AS (SELECT Seqnum, Name FROM Temp WHERE Seqnum=1 UNION ALL SELECT Temp.Seqnum, Res.name||', '||Temp.name FROM Temp, Res WHERE Temp.Seqnum=Res.Seqnum+1)
SELECT Name 
FROM Res
ORDER BY Seqnum DESC 
LIMIT 1;