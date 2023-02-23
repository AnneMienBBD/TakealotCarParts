USE CarPartTakealotDB;
GO

CREATE PROCEDURE [dbo].[uspPartOrdersHistory]
AS
SELECT [CarPart].CarPartName, [PartType].TypeName, [VehicleBrand].BrandName, [Vehicle].VehicleModel, [Vehicle].VehicleYear, SUM(QuantityAcquired) as TotalAcquired, SUM(QuantityOrdered) as TotalOrdered
FROM CarPartAcquisition 
RIGHT JOIN CarPartOrder 
ON [CarPartAcquisition].CarPartId = [CarPartOrder].CarPartId
RIGHT JOIN CarPart
ON [CarPartAcquisition].CarPartId = [CarPart].CarPartId
RIGHT JOIN Vehicle
ON [CarPart].VehicleId = [Vehicle].VehicleId
RIGHT JOIN VehicleBrand
ON [Vehicle].BrandId = [VehicleBrand].BrandId
RIGHT JOIN PartType
ON[CarPart].PartTypeId = [PartType].PartTypeId
GROUP BY [CarPart].CarPartName, [Vehicle].VehicleModel, [Vehicle].VehicleYear, [VehicleBrand].BrandName, [PartType].TypeName

GO