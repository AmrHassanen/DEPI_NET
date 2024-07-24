<<<<<<< HEAD
----------   First Thing Is Bulid The DataBase  --------------------
CREATE DATABASE ECOMMERCE
GO

----------    Build Two Schemas The First One Is The Production And The Secound IS Sales   --------------
CREATE SCHEMA Production
GO

CREATE SCHEMA Sales
GO

----------    Make The First Table In The Schema Sales The First Table Is Customer    ---------------
CREATE TABLE Production.Customers
(
   Id int identity(1,1) primary key,
   First_Name varchar (250)  not null,
   Last_Name varchar (250)  not null,
   Phone varchar (250),
   Email varchar (250) not null,
   Street varchar (250),
   City varchar (250),
   [State] varchar (250),
   Zip_Code varchar (5)
);


----------   Make The Secound Table In The Schema Production The Table Is Category   ---------------------

CREATE TABLE Production.Category
(
    Id int Identity (1,1) primary key,
    Category_Name varchar(250) not null
);


-----------    Make The Thrid Table In The Schema Production The Table Is Brands      --------------------

CREATE TABLE Production.Brands
(
    Id int identity (1,1) primary key,
    Brand_Name varchar (250) not null
);


-----------    Make The Fourth Table In The Schema Production The Table Is Products    ------------------

CREATE TABLE Production.Products
(
    Id int identity (1,1) primary key,
    Product_Name varchar (250) not null,
    Model_Year smallint not null,
    List_price decimal (10,2) not null,
    foreign key (Id) references Production.Brands(Id) , 
    foreign key (Id) references production.Category(Id)
);

-----    Alter To Add Brand_Id and Category_Id    ----------


ALTER TABLE Production.Products
ADD Brand_Id int,
    Category_Id int;

--------    Alter Contraints	-----------------------------------------------------------

ALTER TABLE Production.Products
ADD CONSTRAINT FK_Products_Brands FOREIGN KEY (Brand_Id) REFERENCES Production.Brands(Id),
    CONSTRAINT FK_Products_Category FOREIGN KEY (Category_Id) REFERENCES Production.Category(Id) ;

-------------   Make The Fiveth Table In The Schema Sales The Table Is Stores

CREATE TABLE Sales.Stores
(
    Id int Identity (1,1) primary key,
    Store_Name varchar (250) not null,
	Phone varchar (250) ,
    Email varchar (250) ,
    Street varchar (250) ,
    City varchar (250) ,
    [State] varchar (10),
    Zip_Code varchar (5)
);

--------------    Make The Sixth Table In The Schema Production The Table Is Stocks

CREATE TABLE Production.Stocks
(
    Store_Id INT,
    Product_Id INT,
    Quantity INT,
    PRIMARY KEY (Store_Id, Product_Id)
);


--------------    Make The Seven Table In The Schema Sales The Table Is Staffs

CREATE TABLE Sales.Staffs
(
    Staff_Id INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(250) NOT NULL,
    Last_Name VARCHAR(250) NOT NULL,
    Email VARCHAR(250) NOT NULL,
    Phone VARCHAR(250),
    Active TINYINT NOT NULL,
    Store_Id INT,
    Manager_Id INT,
    FOREIGN KEY (Store_Id) REFERENCES Sales.Stores(Id) on delete no action
);


----     Alter ON Manger_Id    ------------
ALTER TABLE Sales.Staffs
ADD CONSTRAINT FK_Staffs_Manager FOREIGN KEY (Manager_Id) REFERENCES Sales.Staffs(Staff_Id);




------------    Make The Eight Table In The Schema Sales The Table Is Order

CREATE TABLE Sales.Orders
(
    Order_Id INT IDENTITY(1,1) PRIMARY KEY,
    Customer_Id INT,
    Order_Status TINYINT NOT NULL,
    Order_Date DATE NOT NULL,
    Required_Date DATE NOT NULL,
    Shipped_Date DATE,
    Store_Id INT,
    Staff_Id INT,
    FOREIGN KEY (Customer_Id) REFERENCES Production.Customers(Id),
    FOREIGN KEY (Store_Id) REFERENCES Sales.Stores(Id),
    FOREIGN KEY (Staff_Id) REFERENCES Sales.Staffs(Staff_Id)
)

----------     Make The 9 Table In This Schema Sales The Table Is Order_Item
CREATE TABLE Sales.Order_Items
(
    Order_Id INT,
    Item_Id INT,
    Product_Id INT,
    FOREIGN KEY (Product_Id) REFERENCES Production.Products(Id),
    Quantity INT NOT NULL,
    List_Price DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(4,2),
    CONSTRAINT PK_OrderItem PRIMARY KEY (Order_Id, Item_Id) 
);


=======
----------   First Thing Is Bulid The DataBase  --------------------
CREATE DATABASE ECOMMERCE
GO

----------    Build Two Schemas The First One Is The Production And The Secound IS Sales   --------------
CREATE SCHEMA Production
GO

CREATE SCHEMA Sales
GO

----------    Make The First Table In The Schema Sales The First Table Is Customer    ---------------
CREATE TABLE Production.Customers
(
   Id int identity(1,1) primary key,
   First_Name varchar (250)  not null,
   Last_Name varchar (250)  not null,
   Phone varchar (250),
   Email varchar (250) not null,
   Street varchar (250),
   City varchar (250),
   [State] varchar (250),
   Zip_Code varchar (5)
);


----------   Make The Secound Table In The Schema Production The Table Is Category   ---------------------

CREATE TABLE Production.Category
(
    Id int Identity (1,1) primary key,
    Category_Name varchar(250) not null
);


-----------    Make The Thrid Table In The Schema Production The Table Is Brands      --------------------

CREATE TABLE Production.Brands
(
    Id int identity (1,1) primary key,
    Brand_Name varchar (250) not null
);


-----------    Make The Fourth Table In The Schema Production The Table Is Products    ------------------

CREATE TABLE Production.Products
(
    Id int identity (1,1) primary key,
    Product_Name varchar (250) not null,
    Model_Year smallint not null,
    List_price decimal (10,2) not null,
    foreign key (Id) references Production.Brands(Id) , 
    foreign key (Id) references production.Category(Id)
);

-----    Alter To Add Brand_Id and Category_Id    ----------


ALTER TABLE Production.Products
ADD Brand_Id int,
    Category_Id int;

--------    Alter Contraints	-----------------------------------------------------------

ALTER TABLE Production.Products
ADD CONSTRAINT FK_Products_Brands FOREIGN KEY (Brand_Id) REFERENCES Production.Brands(Id),
    CONSTRAINT FK_Products_Category FOREIGN KEY (Category_Id) REFERENCES Production.Category(Id) ;

-------------   Make The Fiveth Table In The Schema Sales The Table Is Stores

CREATE TABLE Sales.Stores
(
    Id int Identity (1,1) primary key,
    Store_Name varchar (250) not null,
	Phone varchar (250) ,
    Email varchar (250) ,
    Street varchar (250) ,
    City varchar (250) ,
    [State] varchar (10),
    Zip_Code varchar (5)
);

--------------    Make The Sixth Table In The Schema Production The Table Is Stocks

CREATE TABLE Production.Stocks
(
    Store_Id INT,
    Product_Id INT,
    Quantity INT,
    PRIMARY KEY (Store_Id, Product_Id)
);


--------------    Make The Seven Table In The Schema Sales The Table Is Staffs

CREATE TABLE Sales.Staffs
(
    Staff_Id INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(250) NOT NULL,
    Last_Name VARCHAR(250) NOT NULL,
    Email VARCHAR(250) NOT NULL,
    Phone VARCHAR(250),
    Active TINYINT NOT NULL,
    Store_Id INT,
    Manager_Id INT,
    FOREIGN KEY (Store_Id) REFERENCES Sales.Stores(Id) on delete no action
);


----     Alter ON Manger_Id    ------------
ALTER TABLE Sales.Staffs
ADD CONSTRAINT FK_Staffs_Manager FOREIGN KEY (Manager_Id) REFERENCES Sales.Staffs(Staff_Id);




------------    Make The Eight Table In The Schema Sales The Table Is Order

CREATE TABLE Sales.Orders
(
    Order_Id INT IDENTITY(1,1) PRIMARY KEY,
    Customer_Id INT,
    Order_Status TINYINT NOT NULL,
    Order_Date DATE NOT NULL,
    Required_Date DATE NOT NULL,
    Shipped_Date DATE,
    Store_Id INT,
    Staff_Id INT,
    FOREIGN KEY (Customer_Id) REFERENCES Production.Customers(Id),
    FOREIGN KEY (Store_Id) REFERENCES Sales.Stores(Id),
    FOREIGN KEY (Staff_Id) REFERENCES Sales.Staffs(Staff_Id)
)

----------     Make The 9 Table In This Schema Sales The Table Is Order_Item
CREATE TABLE Sales.Order_Items
(
    Order_Id INT,
    Item_Id INT,
    Product_Id INT,
    FOREIGN KEY (Product_Id) REFERENCES Production.Products(Id),
    Quantity INT NOT NULL,
    List_Price DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(4,2),
    CONSTRAINT PK_OrderItem PRIMARY KEY (Order_Id, Item_Id) 
);


>>>>>>> f7f78c69eb03d91f167306b0622047e277718e79
--------------------------------   Alters Of This Schema   -------------------------------------