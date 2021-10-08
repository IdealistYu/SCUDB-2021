SELECT CategoryName, (SELECT COUNT(*) FROM Product WHERE CategoryId=Category.Id) as Num, ROUND(AVG(UnitPrice),2), MIN(UnitPrice), MAX(UnitPrice), SUM(UnitsOnOrder)
FROM Product, Category
WHERE CategoryId=Category.Id AND Num>10
GROUP BY Category.Id
ORDER BY CategoryId;