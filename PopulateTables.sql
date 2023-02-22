CREATE PROCEDURE [dbo].[uspPopulateTables] AS
BEGIN

	INSERT INTO PartType
	VALUES('engine'), ('bumper'), ('steering wheel'), ('battery'), ('brake')

	INSERT INTO VehicleBrand
	VALUES('Honda'), ('Toyota'), ('Suzuki'), ('Kia')

	INSERT INTO Vehicle
	VALUES('Amaze','2020', 1), ('Etios','2010',2), ('Swift','2019',3), ('Picanto','2020',4), ('Ignis','2019',3)

	INSERT INTO CarPart
	VALUES ('1.5l N15A1 four-cylinder turbo-diesel', 1, 1, 24500, 30000),
	('Front Bumper Stiffener 12-20', 2,2,1500, 3000),
	('2011 DBA-ZC72S Steering Wheel', 3, 3, 500, 1700),
	('Exide 616CS 12V Battery', 4,4, 970, 1600),
	('Front brake pads', 5, 5, 770, 1600)

	INSERT INTO Suburb
	VALUES('Faerie Glen', '0081', 'Pretoria'),
	('Garsfontein', '0073', 'Pretoria'),
	('Randburg', '0043', 'Johannesburg'),
	('Heuwelsig', '9301', 'Bloemfontein'),
	('Rondebosch', '7701', 'Cape Town')

	INSERT INTO Scrapyard
	VALUES('Zoom zoom', 'Peter Thomasson', '0845642211', 'thomasson@gmail.com', '50 Cliffendale dr', null, 1),
	('Vehicle Center', 'Randall Forest', '0872345543', 'forest@vehiclecenter.com', '67 Jacqueline dr', 'Old Farm Village', 2),
	('John''s Scrapyard', 'John Webster', '0734446766', 'webster@gmail.com', '4 Anne road', null, 3),
	('Scrappy', 'Pieter van der Merwe', '0732218965', 'pieter@scrappy.co.za', '6 Juta str', null, 4),
	('Ultimate Scrapyard', 'Yvonne Marshall', '0629764553', 'marshall@ultimatescrapyard.co.za','89 Central road', null, 5)

	INSERT INTO Acquisition
	VALUES('2021-03-04',1),
	('2021-06-14',2),
	('2022-07-20',3),
	('2022-04-04',4),
	('2023-01-05',5)

	INSERT INTO CarPartAcquisition
	VALUES (1,1,4), (1,2,10), (1,3,8), (1,4,6), (2,5,7), (2,3,15), (2,1,16), (3,1,25), (3,2,7), (3,3,6), (3,4,1), (3,5,3), (4,2,4), (4,5,8), (4,4,2), (5,3,1), (5,4,5), (5,1,6)

	INSERT INTO Customer
	VALUES('Johanna', 'van Rensburg', '0835672443', 'johannar@gmail.com', '27 Old Farm road', '5 Grand Villas', 1),
	('Tiaan', 'Blohm', '0854327775', 'blohmies@gmail.com', '26 Garsfontein road', null, 2 ),
	('Graham', 'Bell', '0723354672', 'bellg@yahoo.com', '3 Manitoba drive', null, 3),
	('Susan', 'Steele', '0642337654', 'steeleworks@gmail.com', 'Ogilvie Thompson street', '8 Rayton Rich', 4),
	('Kelly', 'Underwood', '0825447883', 'underwood@yahoo.com', '65 Melville dr', null, 5)

	INSERT INTO Orders
	VALUES('2023-02-04',1),
	('2023-02-08',2),
	('2023-02-10',3),
	('2023-02-14',4),
	('2023-02-25',5),
	('2023-02-27',1)

	INSERT INTO CarPartOrder
	VALUES (1,1,1), (1,2,1), (1,3,1), (2,4,1), (2,5,1), (3,1,2), (3,4,1),(4,4,2), (4,2,1),(5,5,1), (5,1,3),(6,3,1),(6,1,1)

END
