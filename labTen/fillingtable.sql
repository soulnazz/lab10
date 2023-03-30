/*Наполнить таблицу данными*/

INSERT INTO Customers (FName,MName, LName,[Address],City,Phone,DateInSystem)
VALUES
('Dilnaz', 'Kutmanbekovna', 'Salyaeva', 'Sheralieva 233','Bishkek','0779285195', DATEADD (DAY,-85,GETDATE())),
('Asel', 'Nurkamilovna', 'Baatyrbaeva', 'Tynalieva 32','Bishkek','0777454451',DATEADD (DAY,-45,GETDATE())),
('Ainazik', 'Zhyrgalbekovna', 'Tileshbaeva', 'Turusbekova 12','Osh','0700457896',DATEADD (DAY,-55,GETDATE()));
GO
INSERT INTO Employess(FName,MName, LName,Post,Salary,PriorSalary)
VALUES
('Asan', 'Toktorovich', 'Nootuzbaev', 'Director',2000,300),
('Malika', 'Manasovna', 'Akylbekova', 'Meneger',700,150),
('Belek', 'Oskonbaevich', 'Ayatov', 'Meneger',800,150);
GO

INSERT INTO EmployessInfo(ID,MaritalStatus,BirthDate,[Address],	Phone)
VALUES
(1,'женат', '1992-12-02', 'Малдыбаева 12', '0550505050'),
(2,'не замужем', '1999-05-27', 'Ахунбаева 34', '0550454545'),
(3,'не женат', '1999-01-02', 'Meneger','0500787878');
GO
INSERT INTO Products(name)
VALUES
('Ноутбук ASUS D345'),
('Смартфон Samsung Galaxy S6 SS 32GB'),
('Телевизор LG 55LB631V');
GO
INSERT INTO ProductDetails(ID,Color,[Description])
VALUES
(1,'black','Loerererfdfsdfdsdcdc'),
(2,'white','dcdscfdscfdsfdsf'),
(3,'grey','ssdcdscsdsddcsad');
GO

INSERT INTO Stocks(ProductID,Qty)
VALUES
(1,30),
(2,20),
(3,16);
GO

INSERT INTO Orders(CustomerID,EmployeeID,OrderDate)
VALUES
(1,3,DATEADD(DAY,-85,GETDATE())),
(2,2,DATEADD(DAY,-34,GETDATE())),
(3,1,DATEADD(DAY,-85,GETDATE()));
GO

INSERT INTO OrderDetails(OrderID,LineItem,ProductID,Qty,Price)
VALUES
(1,1,1,1,295),
(2,1,2,1,445),
(2,2,3,1,564);
GO
SELECT*FROM Customers
SELECT*FROM Employess
SELECT*FROM Stocks
SELECT*FROM EmployessInfo
SELECT*FROM Orders
SELECT*FROM Products
SELECT*FROM ProductDetails
SELECT*FROM OrderDetails