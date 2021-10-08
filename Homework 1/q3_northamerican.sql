SELECT Id,ShipCountry,'NorthAmerica' 
FROM 'Order' 
WHERE ShipCountry='USA' OR ShipCountry='Mexico' OR ShipCountry='Canada'
UNION ALL
SELECT Id,ShipCountry,'OtherPlace' 
FROM 'Order' 
WHERE ShipCountry!='USA' AND ShipCountry!='Mexico' AND ShipCountry!='Canada' 
ORDER BY Id
LIMIT 20 OFFSET 5197;