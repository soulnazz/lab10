/*--1--Создать базу данных для интернет магазина */
CREATE DATABASE InternetShop
COLLATE Cyrillic_General_CI_AS
GO
/*--2-- Создать в базе данных таблицы*/
/*1)CUSTOMERS(ID,FNmae,MName,LName,[Address],City,Phone,DateInSystem)*/
create table Customers (
ID int not null  IDENTITY,
FName nvarchar(20)  null,
MName nvarchar(20)  null,
LName nvarchar(20)  null,
[Address] nvarchar(50) null,
City nvarchar(20)  null,
Phone char(12)  null,
DateInSystem date  DEFAULT GETDATE(),
)
GO

/*2)EMPLOYEES(ID,FName,MName,LName,Post,Salary,PriorSalary)*/
create table Employess (
ID int not null IDENTITY,
FName nvarchar(50) not null,
MName nvarchar(50)  null,
LName nvarchar(50) not null,
Post nvarchar(50) not null,
Salary money not null,
PriorSalary money  null,
)
GO


/* 3)EMPLOYEESINFO(ID,MaritalStatus,BirDate,[Address],Phone)*/
create table EmployessInfo (
ID int not null,
MaritalStatus varchar(10) not null,
BirthDate date   not null,
[Address] nvarchar(50) not null,
Phone char(12) not null,
)
GO
/*4)Products(ID,Name)*/
create table Products (
ID int not null IDENTITY,
Name nvarchar(50) not null,

)
GO

/*5)ProductsDetails(ID,Color,[Description])*/
create table ProductDetails (
ID int not null ,
Color nchar(50)  null,
[Description] nvarchar(MAX)  null,
)
GO
/*6)Stocks(ProductId,Qty)*/
create table Stocks (
ProductID int not null ,
Qty int DEFAULT 0,
)
GO

/*7)Orders(ID,CustomerID,EmployeeID,OrderDate)*/
create table Orders (
ID int not null IDENTITY,
CustomerID int  null,
EmployeeID int  null,
OrderDate date DEFAULT GETDATE()
)
GO
/*8)OrderdDetails(OrderID,LineItem,ProductID,QTY,Price,TotalPrice)*/
create table OrderDetails (
OrderID int not null  ,
LineItem int not null,
ProductID int  null,
Qty int  not null,
Price money not null,
TotalPrice AS CONVERT(money,Qty*Price),
)
GO
--3--Установить связи между таблицами
*/ALTER TABLE Customers
ADD 
PRIMARY KEY(ID)
GO

ALTER TABLE Employess
ADD 
PRIMARY KEY(ID)
GO

ALTER TABLE EmployessInfo
ADD 
UNIQUE (ID)
GO
ALTER TABLE EmployessInfo
ADD 
FOREIGN KEY  (ID) REFERENCES Employess (ID)
ON DELETE CASCADE
GO

/* connect Products  and ProductDetails,Stocks */
ALTER TABLE Products
ADD 
PRIMARY KEY(ID)
GO

ALTER TABLE ProductDetails
ADD 
UNIQUE (ID)
GO
ALTER TABLE  ProductDetails
ADD 
FOREIGN KEY  (ID) REFERENCES Products (ID)
ON DELETE CASCADE
GO
/* Stocks*/
ALTER TABLE Stocks
ADD 
UNIQUE(ProductID)
GO

ALTER TABLE  Stocks
ADD 
FOREIGN KEY  (ProductID) REFERENCES Products (ID)
ON DELETE CASCADE
GO
/*Orders */
ALTER TABLE Orders
ADD 
PRIMARY KEY(ID)
GO
ALTER TABLE  Orders
ADD 
FOREIGN KEY  (CustomerID) REFERENCES Customers (ID)
ON DELETE SET NULL
GO
ALTER TABLE  Orders
ADD 
FOREIGN KEY  (EmployeeID) REFERENCES Employess (ID)
ON DELETE SET NULL
GO

/*OrderDetails*/

ALTER TABLE OrderDetails
ADD 
PRIMARY KEY(OrderID,LineItem)
GO
ALTER TABLE  OrderDetails
ADD 
FOREIGN KEY  (OrderID) REFERENCES Orders (ID)
ON DELETE CASCADE
GO

ALTER TABLE  OrderDetails
ADD 
FOREIGN KEY  (ProductID) REFERENCES Products (ID)
ON DELETE SET NULL
GO



