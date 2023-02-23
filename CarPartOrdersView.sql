USE CarPartTakealotDB;
GO

CREATE VIEW vPartOrders
AS
SELECT [CarPart].CarPartName, [VehicleBrand].BrandName, [Vehicle].VehicleModel, [Vehicle].VehicleYear,
	[CarPart].RetailPrice, [Customer].FirstName, [Customer].LastName, [Customer].PhoneNumber, [Customer].Email,[Suburb].SuburbName, [Suburb].City,
	[Customer].StreetName, [Customer].StreetNumber, QuantityOrdered, [Orders].OrderDate

FROM CarPartOrder RIGHT JOIN Orders 
ON [CarPartOrder].OrderId = [Orders].OrderId

RIGHT JOIN CarPart
ON [CarPartOrder].CarPartId = [CarPart].CarPartId

RIGHT JOIN Customer
ON [Orders].CustomerId = [Customer].CustomerId

RIGHT JOIN Vehicle
ON [CarPart].VehicleId = [Vehicle].VehicleId

RIGHT JOIN VehicleBrand
ON [Vehicle].VehicleId = [VehicleBrand].BrandId

RIGHT JOIN Suburb
ON [Customer].SuburbId = [Suburb].SuburbId

GROUP BY QuantityOrdered, [CarPart].CarPartName, [Customer].FirstName, [Customer].LastName, [CarPart].RetailPrice,
	[Orders].OrderDate, [Vehicle].VehicleModel, [Vehicle].VehicleYear, [VehicleBrand].BrandName, [Customer].PhoneNumber,
	[Customer].Email, [Suburb].SuburbName, [Suburb].City, [Customer].StreetName, [Customer].StreetNumber

GO
