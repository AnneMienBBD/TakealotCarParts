CREATE PROCEDURE [dbo].[uspCreateTables] AS
BEGIN

	CREATE TABLE [dbo].[PartType](
		[PartTypeId] [int] IDENTITY(1,1) PRIMARY KEY,
		[TypeName] [varchar](50) NOT NULL,
	);

	CREATE TABLE VehicleBrand(
		[BrandId] [int] IDENTITY(1,1) PRIMARY KEY,
		[BrandName] [varchar](50) NOT NULL
	);

	CREATE TABLE [dbo].[Vehicle](
		[VehicleId] [int] IDENTITY(1,1) PRIMARY KEY,
		[VehicleModel] [varchar](120) NOT NULL,
		[VehicleYear] [varchar](4) NOT NULL,
		[BrandId] [int] NOT NULL,
		FOREIGN KEY(BrandId) REFERENCES VehicleBrand(BrandId)
	);


	CREATE TABLE [dbo].[CarPart](
		[CarPartId] [int] IDENTITY(1,1) PRIMARY KEY,
		[CarPartName] [varchar](120) NOT NULL,
		[PartTypeId] [int] NOT NULL,
		[VehicleId] [int] NOT NULL,
		[CostPrice] [decimal](13,4) NOT NULL,
		[RetailPrice] [decimal](13,4) NOT NULL,
		FOREIGN KEY(PartTypeId) REFERENCES PartType(PartTypeId),
		FOREIGN KEY(VehicleId) REFERENCES Vehicle(VehicleId),
	);

	CREATE TABLE [dbo].[Suburb](
		[SuburbId] [int] IDENTITY(1,1) PRIMARY KEY,
		[SuburbName] [varchar](50) NOT NULL,
		[PostalCode] [varchar](4) NOT NULL,
		[City] [varchar](50) NOT NULL,
	);

	CREATE TABLE [dbo].[Scrapyard](
		[ScrapyardId] [int] IDENTITY(1,1) PRIMARY KEY,
		[ScrapyardName] [varchar](100) NOT NULL,
		[ScrapyardOwner] [varchar](100) NOT NULL,
		[PhoneNumber] [varchar](13) NOT NULL,
		[Email] [varchar](50) NOT NULL,
		[StreetAddress] [varchar](50) NOT NULL,
		[ApartmentBlock] [varchar](50) NULL,
		[SuburbId] [int] NOT NULL,
		FOREIGN KEY(SuburbId) REFERENCES Suburb(SuburbId),
	);

	CREATE TABLE [dbo].[Acquisition](
		[AcquisitionId] [int] IDENTITY(1,1) PRIMARY KEY,
		[AcquisitionDate] [date] NOT NULL,
		[ScrapyardId] [int] NOT NULL,
		FOREIGN KEY(ScrapyardId) REFERENCES Scrapyard(ScrapyardId),
	);

	CREATE TABLE [dbo].[CarPartAcquisition](
		[AcquisitionId] [int],
		[CarPartId] [int],
		[QuantityAcquired] [smallint] NOT NULL,
		FOREIGN KEY(CarPartId) REFERENCES CarPart(CarPartId),
		FOREIGN KEY(AcquisitionId) REFERENCES Acquisition(AcquisitionId),
		CONSTRAINT PK_CarPartAcquisition PRIMARY KEY(CarPartId, AcquisitionId),
	);

	CREATE TABLE [dbo].[Customer](
		[CustomerId] [int] IDENTITY(1,1) PRIMARY KEY,
		[FirstName] [varchar](50) NOT NULL,
		[LastName] [varchar](50) NOT NULL,
		[PhoneNumber] [varchar](13) NOT NULL,
		[Email] [varchar](50) NOT NULL,
		[StreetAddress] [varchar](50) NOT NULL,
		[ApartmentBlock] [varchar](50) NULL,
		[SuburbId] [int] NOT NULL,
		FOREIGN KEY(SuburbId) REFERENCES Suburb(SuburbId),
	);

	CREATE TABLE [dbo].[Orders](
		[OrderId] [int] IDENTITY(1,1) PRIMARY KEY,
		[OrderDate] [date] NOT NULL,
		[CustomerId] [int] NOT NULL,
		FOREIGN KEY(CustomerId) REFERENCES Customer(CustomerId),
	);

	CREATE TABLE [dbo].[CarPartOrder](
		[OrderId] [int],
		[CarPartId] [int],
		[QuantityOrdered] [smallint] NOT NULL,
		FOREIGN KEY(CarPartId) REFERENCES CarPart(CarPartId),
		FOREIGN KEY(OrderId) REFERENCES Orders(OrderId),
		CONSTRAINT PK_CarPartOrder PRIMARY KEY(CarPartId, OrderId),
	);
END

GO
