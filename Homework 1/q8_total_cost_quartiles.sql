SELECT CompanyNameCorrected, CustomerId, Cost
FROM (SELECT *, NTILE(4) OVER (ORDER BY Cost) AS ExpendituresQuartiles FROM (SELECT IFNULL(CompanyName, 'MISSING_NAME') AS CompanyNameCorrected, CustomerId, ROUND(SUM(Quantity*UnitPrice),2) AS Cost
FROM 'Order' INNER JOIN OrderDetail ON OrderDetail.OrderId = 'Order'.Id LEFT JOIN Customer ON Customer.Id = 'Order'.CustomerId
GROUP BY CustomerId))
WHERE ExpendituresQuartiles = 1
ORDER BY Cost;