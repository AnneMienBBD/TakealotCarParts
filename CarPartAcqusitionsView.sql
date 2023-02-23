USE CarPartTakealotDB;
GO

CREATE VIEW vCarPartAcquisition
AS
SELECT [Scrapyard].ScrapyardOwner, ScrapyardName, [Scrapyard].PhoneNumber, [Scrapyard].Email, [Suburb].SuburbName, 
	[Suburb].City, [Scrapyard].StreetAddress, [CarPart].CarPartName, [VehicleBrand].BrandName, [Vehicle].VehicleModel, 
	[Vehicle].VehicleYear, QuantityAcquired, [Acquisition].AcquisitionDate

FROM CarPartAcquisition RIGHT JOIN Acquisition 
ON [CarPartAcquisition].AcquisitionId = [Acquisition].AcquisitionId

RIGHT JOIN Scrapyard
ON [Acquisition].ScrapyardId = [Scrapyard].ScrapyardId

RIGHT JOIN CarPart
ON [CarPart].CarPartId = [CarPartAcquisition].CarPartId

RIGHT JOIN Vehicle
ON [CarPart].VehicleId = [Vehicle].VehicleId

RIGHT JOIN VehicleBrand
ON [Vehicle].BrandId = [VehicleBrand].BrandId

RIGHT JOIN Suburb
ON [Scrapyard].SuburbId = [Suburb].SuburbId

GROUP BY [Scrapyard].ScrapyardOwner, QuantityAcquired, ScrapyardName, [CarPart].CarPartName, [VehicleBrand].BrandName,
	[Suburb].SuburbName, [Suburb].City, [Vehicle].VehicleModel, [Vehicle].VehicleYear, [Scrapyard].PhoneNumber, 
	[Scrapyard].Email, [Scrapyard].StreetAddress, [Acquisition].AcquisitionDate

GO
