SELECT * 
FROM
(SELECT CompanyName,Round(percentage, 2) AS percentage FROM (SELECT DISTINCT CompanyName,(SELECT COUNT(*)*100.0 FROM(SELECT * FROM 'Order' WHERE ShippedDate>RequiredDate) WHERE ShipVia='1')/
(SELECT COUNT(*) FROM(SELECT * FROM 'Order') WHERE ShipVia='1') AS percentage FROM "Order",Shipper WHERE "Order".ShipVia=Shipper.Id AND
ShipVia='1') 
UNION ALL
SELECT CompanyName,Round(percentage, 2) FROM (SELECT DISTINCT CompanyName,(SELECT COUNT(*)*100.0 FROM(SELECT * FROM 'Order' WHERE ShippedDate>RequiredDate) WHERE ShipVia='2')/
(SELECT COUNT(*) FROM(SELECT * FROM 'Order') WHERE ShipVia='2') AS percentage FROM "Order",Shipper WHERE "Order".ShipVia=Shipper.Id AND
ShipVia='2') 
UNION ALL
SELECT CompanyName,Round(percentage, 2) FROM (SELECT DISTINCT CompanyName,(SELECT COUNT(*)*100.0 FROM(SELECT * FROM 'Order' WHERE ShippedDate>RequiredDate) WHERE ShipVia='3')/
(SELECT COUNT(*) FROM(SELECT * FROM 'Order') WHERE ShipVia='3') AS percentage FROM "Order",Shipper WHERE "Order".ShipVia=Shipper.Id AND
ShipVia='3'))
ORDER BY percentage DESC;