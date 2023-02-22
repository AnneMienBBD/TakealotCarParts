USE CarPartTakealotDB;
GO

CREATE VIEW vCarPartAcquisitions
AS
SELECT [CarPartAcquisition].AcquisitionId, [Acquisition].ScrapyardId, ScrapyardName, [CarPartAcquisition].CarPartId, [CarPart].CarPartName, QuantityAcquired
FROM CarPartAcquisition RIGHT JOIN Acquisition 
ON [CarPartAcquisition].AcquisitionId = [Acquisition].AcquisitionId
RIGHT JOIN Scrapyard
ON [Acquisition].ScrapyardId = [Scrapyard].ScrapyardId
RIGHT JOIN CarPart
ON [CarPart].CarPartId = [CarPartAcquisition].CarPartId
GROUP BY [CarPartAcquisition].AcquisitionId, [Acquisition].ScrapyardId, [CarPartAcquisition].CarPartId, QuantityAcquired, ScrapyardName, [CarPart].CarPartName

GO