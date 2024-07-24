---------------    First Create DataBase    -----------------
Create DataBase  Online_Marketplace
Go

-------------- Secound Create schema -------------------
Create Schema OnlineMarket
Go

---------------    Active DataBase   ------------------
Use Online_Marketplace
Go

---------------     Create Tables And Make Relationships Between Tables     -----------------------
---------------   1 --- Create Users Table   --------------------------------
Create Table OnlineMarket.Users
(
	Id Int Identity (1,1) Primary Key ,
	UserName Nvarchar(250) NOT NULL,
	Email Nvarchar(250) NOT NULL,
	PasswordHash Nvarchar(250) NOT NULL,
	[Status] Nvarchar(250) NOT NULL,
	AddressLine1 Nvarchar(250),
	AddressLine2 Nvarchar(250),
	City Nvarchar(50),
	[State] Nvarchar(100),
	PostalCode Nvarchar(50),
	CreateAt DATETIME NOT NULL,
	CountryID INT,
	Foreign Key (CountryID) References OnlineMarket.Countries(Id),
)
-----------------------  2  ----    Create Table Countries    ---------------------
Create Table OnlineMarket.Countries
(
	Id Int Identity (1,1) Primary Key ,
	CountryName Nvarchar(250) NOT NULL,
)

-----------------------  3  -----  Create Table Categories    ------------------------
Create Table OnlineMarket.Categories
(
	Id Int Identity (1,1) Primary Key ,
	CategoryName Nvarchar(250) NOT NULL,
	[Description] Nvarchar
)

----------------------- 3   ------  Create Table Items       ---------------------------
Create Table OnlineMarket.Items
(
	Id int Identity (1,1) Primary Key ,
	Title Nvarchar(250) NOT NULL,
	[Description] Nvarchar(250),
	StartingPrice Decimal (10 , 2) NOT NULL,
	CurrentPrice Decimal (10 , 2) ,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	ImageURL Nvarchar(250),
	CreatedAt DATETIME NOT NULL,
	SellerID Int,
	CategoryID Int ,
	Foreign Key (SellerID) References OnlineMarket.Users(Id),
	Foreign Key (CategoryID) References OnlineMarket.Categories(Id)
) 

-----------------------  4 ----  Create Table Bids -----------------------
Create Table OnlineMarket.Bids
(
	Id Int Identity (1,1) Primary Key ,
	BidAmount  Decimal (10,2) NOT NULL,
	BidTime DATETIME NOT NULL,
	ItemID Int,
	UserID Int,
	Foreign Key (ItemID) References OnlineMarket.Items(Id),
	Foreign Key (UserID) References OnlineMarket.Users(Id)
)


------------------   5 -------  Create Table Orders  ----------------
Create Table OnlineMarket.Orders
(
	Id Int Identity (1,1) Primary Key ,
	OrderDate DATETIME NOT NULL,
	TotalAmount Decimal (10,2) NOT NULL,
	BuyerID Int ,
	ItemID Int ,
	Foreign Key (BuyerID) References OnlineMarket.Users(Id),
	Foreign Key (ItemID) References OnlineMarket.Items(Id)
)

----------------  6 ------ Create Table Notifications -------------------
Create Table OnlineMarket.Notifications
(
	Id Int Identity (1,1) Primary Key ,
	[Message] Nvarchar (250) ,
	IsRead BIT NOT NULL,
	CreatedAt DATETIME NOT NULL,
	UserID Int,
	Foreign Key (UserID) References OnlineMarket.Users(Id)
)
