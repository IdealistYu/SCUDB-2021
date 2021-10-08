SELECT RegionDescription, FirstName, LastName, BirthDate
FROM Employee, EmployeeTerritory, Territory, Region
WHERE EmployeeTerritory.EmployeeId = Employee.Id AND EmployeeTerritory.TerritoryId = Territory.Id AND Territory.RegionId = Region.Id
GROUP BY RegionId 
HAVING MAX(BirthDate)
ORDER BY RegionId;