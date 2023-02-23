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

CREATE FUNCTION [dbo].[udfGetReceipt]
(
  @OrderID int
)
RETURNS TABLE
AS
RETURN 
	SELECT
		CarPartOrder.CarPartId,
		CarPartName,
		RetailPrice,
		QuantityOrdered
	FROM
		CarPartOrder LEFT JOIN CarPart
		ON CarPartOrder.CarPartId = CarPart.CarPartId
	WHERE
		CarPartOrder.OrderId = @OrderID

GO
