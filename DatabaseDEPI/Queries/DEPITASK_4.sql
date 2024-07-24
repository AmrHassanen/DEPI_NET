-------------------------------------------  Stored Procedures  -----------------------------------------
Create or Alter Procedure OnlineMarket.CreateUser(
@Username Nvarchar(250),
@Email Nvarchar(250),
@PasswordHash Nvarchar(250),
@Status Nvarchar(250),
@AddressLine1 Nvarchar(250),
@AddressLine2 Nvarchar(250),
@City Nvarchar(50),
@State Nvarchar(100),
@PostalCode Nvarchar(50),
@CountryID Int)
AS
Begin
	Insert Into OnlineMarket.Users
	(
	UserName,
	Email,
	PasswordHash,
	[Status],
	AddressLine1,
	AddressLine2,
	City,
	[State],
	PostalCode,
	CountryID,
	CreateAt
	)
	Values(
	@Username,
	@Email,
	@PasswordHash,
	@Status,
	@AddressLine1,
	@AddressLine2,
	@City,
	@State,
	@PostalCode,
	@CountryID,
	GetDate()
	)
End
------------------------------- EXEC Storted Procedure  --------------------------
EXEC OnlineMarket.CreateUser 
    @Username = 'AmrYasserMohmedHassaneen',
    @Email = 'amroyasser@gmail.com',
    @PasswordHash = '12345zZ!',
    @Status = 'Single',
    @AddressLine1 = 'Ras-Elpar',
    @AddressLine2 = 'Ezpet-Elborg',
    @City = 'Damitta',
    @State = 'Egypt',
    @PostalCode = '057',
    @CountryID = 1;

---------------------------------    UpdateUserStatus    -------------------------------------
Create Or Alter Procedure OnlineMarket.UpdateUserStatus
(
   @UserID Int ,
   @Status Nvarchar(250) 
)
AS
Begin
	Update OnlineMarket.Users
	Set Status = @Status
	Where Id = @UserID
End 

--------------------------------  Exec OnlineMarket.UpdateUserStatus Stored Procedure  -------------------------------
Exec OnlineMarket.UpdateUserStatus
    @UserId = 1 ,
	@Status = 'Married'



---------------------------------- Create Item Management Stored Procedure  ----------------------------------
Create Or Alter Procedure OnlineMarket.ItemManagement
(
@SellerID Int,
@CategoryID Int,
@Title Nvarchar(250),
@Description Nvarchar(250),
@StartingPrice decimal(10,2),
@CurrentPrice decimal(10,2),
@StartDate DateTime,
@EndDate DateTime,
@ImageURL Nvarchar(250)
)
As
Begin
	Insert Into OnlineMarket.Items
	(
	SellerID,
	CategoryID,
	Title,
	[Description],
	StartingPrice,
	CurrentPrice,
	StartDate,
	EndDate,
	ImageURL,
	CreatedAt
	)
	Values
	(
	@SellerID,
	@CategoryID,
	@Title,
	@Description,
	@StartingPrice,
	@CurrentPrice,
	@StartDate,
	@EndDate,
	@ImageURL,
	Getdate()
	)
End


-----------------------------------------  EXEC OnlineMarket.ItemManagement Stored Procedure ----------------------------------
EXEC OnlineMarket.ItemManagement
	@SellerID = 1,
	@CategoryID = 3,
	@Title = 'Item 1',
	@Description = 'This is good Item',
	@StartingPrice = 144.22,
	@CurrentPrice = 133.22 ,
	@StartDate = '2024/12/9',
	@EndDate = '2024/12/12',
	@ImageURL = 'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msDTq.img'

---------------------------------------  Create Stored Procedure Bid Management   -----------------------------------
Create Or Alter Procedure OnlineMarket.PlaceBid
(
	@ItemID Int,
	@UserID Int,
	@BidAmount Decimal (10,2),
	@CurrentPrice Decimal (10,2)
)
AS
Begin
	Insert Into OnlineMarket.Bids
	(
	ItemID,
	UserID,
	BidAmount,
	BidTime
	)
	Values
	(
	 @ItemID,
	 @UserID,
	 @BidAmount,
	 GETDATE()
	)
	Update OnlineMarket.Items
	Set CurrentPrice = @CurrentPrice
	Where Id = @ItemID
End 


----------------------------------------  EXEC Stored Procedure OnlineMarket.PlaceBid  ---------------------------------
EXEC OnlineMarket.PlaceBid
	@ItemID  = 2,
	@UserID = 1,
	@BidAmount = 122.22,
	@CurrentPrice  = 123.22




------------------------------------  Retrieve all items along with their respective seller information.  --------------------------------
Create Procedure OnlineMarket.RetrieveAllItems
As
Begin
	Select * 
	From OnlineMarket.Items OI Inner Join OnlineMarket.Users OU
	ON Ou.Id = OI.SellerID
End
-----------------------------------------  EXEC OnlineMarket.RetrieveAllItems  ------------------------------
EXEC OnlineMarket.RetrieveAllItems

-----------------------------------------   Retrieve all users along with their items, if they have any  ---------------------------------
Create Or Alter Procedure OnlineMarket.RetrieveAllUsers
AS
Begin
	Select *
	From OnlineMarket.Users OU Left Outer Join OnlineMarket.Items OI
	ON OU.Id = OI.SellerID
End

--------------------------------------   EXEC OnlineMarket.RetrieveAllUsers   --------------------------------------------------
EXEC OnlineMarket.RetrieveAllUsers

--------------------------------------  Retrieve all users and their items, showing all users and all items, even if there is no match  -------------
Create Or Alter Procedure OnlineMarket.RetrieveAllUsersWithNOMatch
AS
Begin
	Select *
	From OnlineMarket.Users OU Full Outer Join OnlineMarket.Items OI
	ON OU.Id = OI.SellerID
End


-----------------------------------  EXEC OnlineMarket.RetrieveAllUsersWithNOMatch  -----------------------------------
EXEC OnlineMarket.RetrieveAllUsersWithNOMatch


-----------------------------------  Retrieve items with the number of bids each item has received. ---------------------
Create Procedure OnlineMarket.RetrieveItems
AS 
Begin
	Select *
	From OnlineMarket.Items OI Inner Join OnlineMarket.Bids OB
	ON OI.Id = OB.ItemID
End

------------------------------------  EXEC OnlineMarket.RetrieveItems  --------------------------------
 EXEC OnlineMarket.RetrieveItems

----------------------------------   Retrieve users and the total amount they have spent on orders -------------------------
Create OR Alter Procedure OnlineMarket.RetrieveUsers
AS
Begin
	Select OU.Id , OU.UserName , Sum(OO.TotalAmount) AS Total
	From OnlineMarket.Users OU Inner Join OnlineMarket.Orders OO
	ON OU.Id = OO.BuyerID
	Group BY OU.Id , OU.UserName
End

----------------------------------  EXEC OnlineMarket.RetrieveUsers  -------------------------------------------
EXEC OnlineMarket.RetrieveUsers


---------------------------------  Retrieve items along with their category names.  ----------------------------
Create Procedure OnlineMarket.RetrieveItemsWithCategoryNames
As
Begin
	Select OI.* , OC.CategoryName
	From OnlineMarket.Items OI Inner Join OnlineMarket.Categories OC
	ON OC.Id = OI.CategoryID
End

--------------------------------  EXEC OnlineMarket.RetrieveItemsWithCategoryNames ---------------------------------
EXEC OnlineMarket.RetrieveItemsWithCategoryNames