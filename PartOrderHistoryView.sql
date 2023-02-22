USE CarPartTakealotDB;
GO


CREATE VIEW vPartOrdersHistory
AS
SELECT [CarPartAcquisition].CarPartID, [CarPart].CarPartName, SUM(QuantityAcquired) as TotalAcquired, SUM(QuantityOrdered) as TotalOrdered
FROM CarPartAcquisition RIGHT JOIN CarPartOrder 
ON [CarPartAcquisition].CarPartId = [CarPartOrder].CarPartId
RIGHT JOIN CarPart
ON [CarPartAcquisition].CarPartId = [CarPart].CarPartId
GROUP BY [CarPartAcquisition].CarPartId, [CarPart].CarPartName

GO