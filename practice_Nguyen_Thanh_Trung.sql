CREATE DATABASE SellingPoint
GO

USE SellingPoint
GO

CREATE TABLE Categories(
	CateID char(6) PRIMARY KEY,
	CateName nvarchar(100),
	[Description] nvarchar(200)
)

CREATE TABLE Parts(
	PartID INT IDENTITY PRIMARY KEY,
	PartName nvarchar(100) NOT NULL,
	CateID char(6) CONSTRAINT fk_cateid FOREIGN KEY (CateID) REFERENCES Categories(CateID),
	[Description] nvarchar(1000),
	Price MONEY NOT NULL DEFAULT(0),
	Quantity INT DEFAULT(0),
	Warranty INT DEFAULT(1),
	Photo nvarchar(200) DEFAULT('photo/nophoto.png')
)
--3
INSERT INTO Categories(CateID,CateName,Description)
VALUES  ('1','RAM',NULL),
		('2','CPU',NULL),
		('3','HDD',NULL)
GO
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty)
VALUES  ('Ram 8GB',1,NULL,50,10,12),
		('Ram 16GB',1,NULL,100,20,12),
		('Ram 32GB',1,NULL,150,30,12),
		('CPU1',2,NULL,500,10,12)
GO
--4
SELECT * FROM Parts WHERE Price >100
GO
--5
SELECT Parts.*
FROM Categories
INNER JOIN Parts ON Categories.CateID = Parts.CateID
WHERE Categories.CateID = '2'
GO
--6
CREATE VIEW V_Parts AS
SELECT p.PartID, p.PartName, c.CateName, p.Price, p.Quantity
FROM Parts p
INNER JOIN Categories c ON c.CateID = p.PartID
GO
--7
CREATE VIEW V_TopParts AS
SELECT TOP 5 *
FROM Parts 
ORDER BY Price DESC