
CREATE PROCEDURE [dbo].[uspStockQuantity]
AS
BEGIN 
  SELECT SUM(QuantityAcquired) - SUM(QuantityOrdered) AS 'Quantity in Inventory',CarPartName, BrandName, VehicleModel, TypeName
  FROM CarPartAcquisition
  JOIN CarPart
  ON CarPartAcquisition.CarPartId = CarPart.CarPartId
  JOIN CarPartOrder
  ON CarPartOrder.CarPartId = CarPart.CarPartId
  JOIN Vehicle
  ON Vehicle.VehicleId = CarPart.VehicleId
  JOIN PartType
  ON PartType.PartTypeId = CarPart.PartTypeId
  JOIN VehicleBrand
  ON VehicleBrand.BrandId = Vehicle.BrandId
  GROUP BY CarPartName, TypeName, BrandName, VehicleModel
  END
  


