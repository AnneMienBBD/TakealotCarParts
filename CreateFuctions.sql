CREATE FUNCTION [dbo].[udfTotalOrderCost]
(
  @OrderID int
)
RETURNS [decimal]
BEGIN
	DECLARE @Cost decimal
	
	SELECT @Cost = SUM(QuantityOrdered * RetailPrice)
	FROM
		CarPartOrder LEFT JOIN CarPart
		ON CarPartOrder.CarPartId = CarPart.CarPartId
	WHERE
		OrderId = @OrderID
	
	RETURN @Cost

END

GO

CREATE FUNCTION [dbo].[udfTotalAcquisitionCost]
(
  @AcquisitionID int
)
RETURNS [decimal]
BEGIN
	DECLARE @Cost decimal
	
	SELECT @Cost = SUM(QuantityAcquired * RetailPrice)
	FROM
		CarPartAcquisition LEFT JOIN CarPart
		ON CarPartAcquisition.CarPartId = CarPart.CarPartId
	WHERE
		CarPartAcquisition.AcquisitionId = @AcquisitionID
	
	RETURN @Cost

END

GO

CREATE FUNCTION [dbo].[udfGetReceipt]
(
  @OrderID int
)
RETURNS TABLE
AS
RETURN 
	SELECT
		CarPartOrder.OrderId,
		CarPartName,
		BrandName,
		VehicleModel,
		VehicleYear,
		RetailPrice,
		QuantityOrdered,
		QuantityOrdered * RetailPrice as TotalPrice,
		
	FROM
		CarPartOrder LEFT JOIN (CarPart LEFT JOIN (Vehicle LEFT JOIN VehicleBrand
		ON Vehicle.BrandId = VehicleBrand.BrandId)
		ON CarPart.VehicleId = Vehicle.VehicleId)
		ON CarPartOrder.CarPartId = CarPart.VehicleId
	WHERE
		CarPartOrder.OrderId = @OrderID

GO

CREATE FUNCTION [dbo].[udfGetReceiptAcquisition]
(
	@AcquisitionID int
)
RETURNS TABLE
AS
RETURN
	SELECT
		CarPartAcquisition.AcquisitionID,
		CarPartName,
		BrandName,
		VehicleModel,
		VehicleYear,
		CostPrice,
		QuantityAcquired,
		QuantityAcquired * CostPrice as TotalPrice
	FROM
		CarPartAcquisition LEFT JOIN (CarPart LEFT JOIN (Vehicle LEFT JOIN VehicleBrand
		ON Vehicle.BrandId = VehicleBrand.BrandId)
		ON CarPart.VehicleId = Vehicle.VehicleId)
		ON CarPartAcquisition.CarPartId = CarPart.VehicleId
	WHERE
		CarPartAcquisition.AcquisitionId = @AcquisitionID
