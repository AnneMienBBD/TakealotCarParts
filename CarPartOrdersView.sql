USE CarPartTakealotDB;
GO

CREATE VIEW vPartOrders
AS
SELECT [CarPartOrder].OrderId, [CarPartOrder].CarPartId, [CarPart].CarPartName, [Orders].CustomerId, QuantityOrdered
FROM CarPartOrder RIGHT JOIN Orders 
ON [CarPartOrder].OrderId = [Orders].OrderId
RIGHT JOIN CarPart
ON [CarPartOrder].CarPartId = [CarPart].CarPartId
GROUP BY [CarPartOrder].OrderId,[Orders].CustomerId, QuantityOrdered, [CarPartOrder].CarPartId, [CarPart].CarPartName

GO