create database ecartproject;

use ecartproject;

create table Adminn(
AdminnID int primary key,
Adminnname varchar(255) not null,
Adminnusername varchar(255) not null,
Adminnpassword varchar(255) not null,
Adminnrole varchar(255) not null
);

create table Customer(
CustomerID int primary key,
Customername varchar(255) not null,
Customerusername varchar(255) not null,
Customerpassword varchar(255) not null,
Customerphonenumber int not null,
Customeraddress varchar(255) not null
);

create table Categories(
CategoryID int primary key,
Categoryname varchar(255) not null
);

create table Products(
ProductID int primary key,
Productname varchar(255) not null,
Productprice int not null,
CategoryID int foreign key references Categories(CategoryID),
Stockquantity int not null
);

create table Cart(
CartID int primary key,
CustomerID int foreign key references Customer(CustomerID)
);

create table Cartitems(
CartitemsID int primary key,
CartID int foreign key references Cart(CartID),
ProductID int foreign key references Products(ProductID),
Quantity int not null
);

create table Orders(
OrderID int primary key,
CustomerID int foreign key references Customer(CustomerID),
Orderdate date not null,
Totalamount int not null
);

create table Orderdetails(
OrderitemsID int primary key,
OrderID int foreign key references Orders(OrderID),
ProductID int foreign key references Products(ProductID),
Quantity int not null
);

create table Payments( 
PaymentID int primary key, 
OrderID int foreign key references Orders(OrderID), 
TotalAmount int not null, 
Paymenttype varchar (50), 
Paymentstatus varchar(50), 
PayDate Date  
); 

create table ShippingAddress( 
ShippingID int primary key, 
OrderID int foreign key references Orders(OrderID), 
CustomerID int foreign key references Customer(CustomerID), 
BillingAddress varchar(255) not null, 
ShippingAddress varchar(255) not null, 
ZipCode int not null 
); 

 

create table Vendors( 
VendorID int primary key, 
VendorName varchar(255) not null, 
CompanyName varchar(255) not null, 
Categories varchar(100) not null, 
Area varchar(255), 
Contact int not null 
); 

create table Inventory( 
InventoryID int primary key, 
InventoryName varchar(255) not null, 
ProductID int foreign key references Products(ProductID), 
Stock int,  
Lastupdate date 
); 

create table Sales( 
SalesID int primary key, 
CustomerID int Foreign key references Customer(CustomerID), 
ProductID int foreign key references Products(ProductID), 
Quantity int not null, 
UnitPrice int not null, 
TotalAmount int not null, 
SalesDate Date not null, 
); 

create table Ledger( 
LedgerID int primary key, 
InventoryID int foreign key references Inventory(InventoryID), 
CreditAmount int, 
DebitAmount int, 
TransactionDate date, 
); 

create table Tracking( 
TrackingID int primary key, 
Deliverystatus varchar(50), 
OrderID int foreign key references Orders(OrderID), 
EstimateDelivery Varchar(50) 
); 

select * from Adminn 
select * from Cart 
select * from Cartitems 
select * from Categories 
select * from Customer 
select * from Inventory 
select * from Ledger 
select * from Orderdetails 
select * from Orders 
select * from Payments 
select * from Products 
select * from Sales 
select * from ShippingAddress 
select * from Tracking 
select * from Vendors
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DATA

INSERT INTO Adminn (AdminnID, Adminnname, Adminnusername, Adminnpassword, Adminnrole)
VALUES
(1, 'Admin1', 'adminuser1', 'pass1', 'Manager'),
(2, 'Admin2', 'adminuser2', 'pass2', 'Staff'),
(3, 'Admin3', 'adminuser3', 'pass3', 'Staff'),
(4, 'Admin4', 'adminuser4', 'pass4', 'Manager'),
(5, 'Admin5', 'adminuser5', 'pass5', 'Support'),
(6, 'Admin6', 'adminuser6', 'pass6', 'Staff'),
(7, 'Admin7', 'adminuser7', 'pass7', 'Manager'),
(8, 'Admin8', 'adminuser8', 'pass8', 'Support'),
(9, 'Admin9', 'adminuser9', 'pass9', 'Staff'),
(10, 'Admin10', 'adminuser10', 'pass10', 'Manager');

Select * from Adminn


INSERT INTO Customer (CustomerID, Customername, Customerusername, Customerpassword, Customerphonenumber, Customeraddress)
VALUES
(1, 'Name1', 'user1', 'pass1', '001', 'Address1'),
(2, 'Name2', 'user2', 'pass2', '002', 'Address2'),
(3, 'Name3', 'user3', 'pass3', '003', 'Address3'),
(4, 'Name4', 'user4', 'pass4', '004', 'Address4'),
(5, 'Name5', 'user5', 'pass5', '005', 'Address5'),
(6, 'Name6', 'user6', 'pass6', '006', 'Address6'),
(7, 'Name7', 'user7', 'pass7', '007', 'Address7'),
(8, 'Name8', 'user8', 'pass8', '008', 'Address8'),
(9, 'Name9', 'user9', 'pass9', '009', 'Address9'),
(10, 'Name10', 'user10', 'pass10', '010', 'Address10'); 

select * from Customer


INSERT INTO Categories (CategoryID, Categoryname)
VALUES
(1, 'Category1'),
(2, 'Category2'),
(3, 'Category3'),
(4, 'Category4'),
(5, 'Category5'),
(6, 'Category6'),
(7, 'Category7'),
(8, 'Category8'),
(9, 'Category9'),
(10,'Category10');

select * from Categories

INSERT INTO Products (ProductID, ProductName, Price, CategoryID, Stock)
VALUES
(101, 'Product1', 100, 1, 48),
(102, 'Product2', 200, 2, 59),
(103, 'Product3', 150, 3, 37),
(104, 'Product4', 300, 4, 28),
(105, 'Product5', 250, 5, 19),
(106, 'Product6', 400, 6, 33),
(107, 'Product7', 500, 7, 24),
(108, 'Product8', 350, 8, 43),
(109, 'Product9', 600, 9, 14),
(110, 'Product10', 700, 10, 8);

select *  from Products


INSERT INTO Cart (CartID, CustomerID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4),
(6, 2),
(7, 5),
(8, 3),
(9, 6),
(10, 4);

select * from Cart


INSERT INTO CartItems (CartItemID, CartID, ProductID, Quantity)
VALUES
(1, 1, 101, 2),
(2, 1, 102, 1),
(3, 2, 103, 3),
(4, 3, 104, 1),
(5, 4, 105, 2),
(6, 5, 101, 1),
(7, 6, 102, 4),
(8, 7, 106, 2),
(9, 8, 103, 1),
(10, 9, 107, 3);

select * from Cartitems

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2024-01-15', 200),
(2, 2, '2024-02-10', 150),
(3, 3, '2024-03-05', 200),
(4, 4, '2024-04-20', 600),
(5, 5, '2024-05-11', 250),
(6, 6, '2024-06-18', 1200),
(7, 7, '2024-07-25', 200),
(8, 8, '2024-08-09', 500),
(9, 9, '2024-09-14', 400),
(10, 10, '2024-10-30', 350);

Select * from Orders


INSERT INTO Orderdetails(OrderItemsID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 101, 2),
(2, 2, 103, 1),
(3, 3, 102, 1),
(4, 4, 104, 2),
(5, 5, 105, 1),
(6, 6, 106, 3),
(7, 7, 101, 2),
(8, 8, 107, 1),
(9, 9, 102, 2),
(10, 10, 108, 1);

select * from Orderdetails


INSERT INTO Payments (PaymentID, OrderID, TotalAmount, Paymenttype, Paymentstatus, PayDate)
VALUES
(1, 1, 500, 'Cash', 'Paid', '2024-01-16'),
(2, 2, 800, 'Card', 'Pending', '2024-02-12'),
(3, 3, 1200, 'Online', 'Paid', '2024-03-07'),
(4, 4, 300, 'Cash', 'Paid', '2024-04-22'),
(5, 5, 950, 'Card', 'Failed', '2024-05-13'),
(6, 6, 700, 'Online', 'Paid', '2024-06-20'),
(7, 7, 400, 'Cash', 'Paid', '2024-07-26'),
(8, 8, 1500, 'Card', 'Paid', '2024-08-11'),
(9, 9, 2200, 'Online', 'Pending', '2024-09-15'),
(10, 10, 1100, 'Cash', 'Paid', '2024-11-01');

select * from Payments


INSERT INTO ShippingAddress (ShippingID, OrderID, CustomerID, BillingAddress, ShippingAddress, ZipCode)
VALUES
(1, 1, 1, 'Billing1', 'Ship1', '10001'),
(2, 2, 2, 'Billing2', 'Ship2', '10002'),
(3, 3, 3, 'Billing3', 'Ship3', '10003'),
(4, 4, 4, 'Billing4', 'Ship4', '10004'),
(5, 5, 5, 'Billing5', 'Ship5', '10005'),
(6, 6, 6, 'Billing6', 'Ship6', '10006'),
(7, 7, 7, 'Billing7', 'Ship7', '10007'),
(8, 8, 8, 'Billing8', 'Ship8', '10008'),
(9, 9, 9, 'Billing9', 'Ship9', '10009'),
(10, 10, 10, 'Billing10', 'Ship10', '10010');

select * from ShippingAddress


INSERT INTO Vendors (VendorID, VendorName, CompanyName, Categories, Area, Contact)
VALUES
(1, 'Vendor1', 'Company1', 'Electronics', 'Area1', '10001'),
(2, 'Vendor2', 'Company2', 'Clothing', 'Area2', '10002'),
(3, 'Vendor3', 'Company3', 'Furniture', 'Area3', '10003'),
(4, 'Vendor4', 'Company4', 'Books', 'Area4', '10004'),
(5, 'Vendor5', 'Company5', 'Shoes', 'Area5', '10005'),
(6, 'Vendor6', 'Company6', 'Electronics', 'Area6', '10006'),
(7, 'Vendor7', 'Company7', 'Clothing', 'Area7', '10007'),
(8, 'Vendor8', 'Company8', 'Toys', 'Area8', '10008'),
(9, 'Vendor9', 'Company9', 'Sports', 'Area9', '10009'),
(10, 'Vendor10', 'Company10', 'Furniture', 'Area10', '10010');

select * from Vendors

INSERT INTO Inventory (InventoryID, InventoryName, ProductID, Stock, LastUpdate)
VALUES
(1, 'Inventory1', 101, 50, '2024-01-01'),
(2, 'Inventory2', 102, 60, '2024-02-01'),
(3, 'Inventory3', 103, 40, '2024-03-01'),
(4, 'Inventory4', 104, 30, '2024-04-01'),
(5, 'Inventory5', 105, 20, '2024-05-01'),
(6, 'Inventory6', 106, 35, '2024-06-01'),
(7, 'Inventory7', 107, 25, '2024-07-01'),
(8, 'Inventory8', 108, 45, '2024-08-01'),
(9, 'Inventory9', 109, 15, '2024-09-01'),
(10,'Inventory10',110, 10, '2024-10-01');

Select * from Inventory

INSERT INTO Sales (SalesID, CustomerID, ProductID, Quantity, UnitPrice, TotalAmount, SaleDate)
VALUES
(1, 1, 101, 2, 100, 200, '2024-01-10'),
(2, 2, 102, 1, 200, 200, '2024-02-15'),
(3, 3, 103, 3, 150, 450, '2024-03-12'),
(4, 4, 104, 2, 300, 600, '2024-04-20'),
(5, 5, 105, 1, 250, 250, '2024-05-05'),
(6, 6, 106, 2, 400, 800, '2024-06-14'),
(7, 7, 107, 1, 500, 500, '2024-07-21'),
(8, 8, 108, 2, 350, 700, '2024-08-18'),
(9, 9, 109, 1, 600, 600, '2024-09-09'),
(10,10,110, 2, 700,1400, '2024-10-11');

select * from Sales


INSERT INTO Ledger (LedgerID, InventoryID, CreditAmount, DebitAmount, TransactionDate)
VALUES
(1, 1, 5000, 0, '2025-01-10'),
(2, 2, 0, 2000, '2025-01-12'),
(3, 3, 3000, 0, '2025-01-15'),
(4, 1, 0, 1500, '2025-01-20'),
(5, 4, 7000, 0, '2025-02-01'),
(6, 5, 0, 2500, '2025-02-05'),
(7, 2, 4000, 0, '2025-02-10'),
(8, 3, 0, 1800, '2025-02-12'),
(9, 6, 6000, 0, '2025-02-15'),
(10, 1, 0, 2200, '2025-02-18');

select * from Ledger


INSERT INTO Tracking (TrackingID, Deliverystatus, OrderID, EstimateDelivery)
VALUES
(1, 'Shipped', 1, '2024-01-20'),
(2, 'Delivered', 2, '2024-02-15'),
(3, 'Pending', 3, '2024-03-12'),
(4, 'Shipped', 4, '2024-04-25'),
(5, 'Delivered', 5, '2024-05-18'),
(6, 'Pending', 6, '2024-06-22'),
(7, 'Shipped', 7, '2024-07-29'),
(8, 'Delivered', 8, '2024-08-14'),
(9, 'Pending', 9, '2024-09-21'),
(10, 'Shipped', 10, '2024-10-30');

select * from Tracking

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--JOINS

--which product goes against which order id and quantity
select Orderdetails.OrderID,Products.Productname,Orderdetails.Quantity,Products.Productprice
from Orderdetails
inner join Products on Orderdetails.ProductID = Products.ProductID;

--view all customers who ordered or not ordered something and amount of the order
select customer.customername, orders.orderid,Orders.Totalamount
from customer
left join orders on customer.customerid = orders.customerid;

--products with category name
select p.ProductID,p.Productname,p.Productprice,c.Categoryname
from Products as P
inner join Categories as C on p.CategoryID = c.CategoryID;

--order history of customer
select c.CustomerID,c.Customername,o.OrderID,o.Orderdate,o.Totalamount
from Orders o
inner join Customer c on c.CustomerID = o.CustomerID
where c.CustomerID = 1;

--cart details of customers
select c.customername, car.cartid, p.productname, p.productprice, crti.quantity
from customer c
inner join cart car on c.customerid = car.customerid
inner join cartitems crti on car.cartid = crti.cartid
inner join products p on crti.productid = p.productid
where c.CustomerID = 110;

--customers who have not ordered anything but registered
select c.customername
from customer c
left join orders o on c.customerid = o.customerid
where o.orderid = null;

--customer who have ordered
select c.customername
from customer c
inner join orders o on c.customerid = o.customerid

--customer payment details
select Payments.PaymentID,Payments.OrderID,Customer.Customername,Payments.Paymenttype,Payments.Paymentstatus,Payments.PayDate
from Payments
inner join Orders on Payments.OrderID = Orders.OrderID 
inner join Customer on Orders.CustomerID = Customer.CustomerID;

--shipping details
select o.orderid, s.ShippingID,c.Customername,s.ShippingAddress,s.BillingAddress
from orders o
inner join ShippingAddress s on o.orderid = s.orderid
inner join Customer c on o.CustomerID = c.CustomerID;

--sales
select s.salesid, p.productname, s.quantity, s.TotalAmount, s.SalesDate
from Sales s
inner join products p on s.productid = p.productid;

--product with cat name and inventory status
select p.Productname,c.Categoryname,i.Stock,i.Lastupdate
from Products p
inner join Categories c on c.CategoryID = p.CategoryID
inner join Inventory i on i.ProductID = p.ProductID;

--tracking status with order id
select o.OrderID,t.EstimateDelivery,t.Deliverystatus
from Orders o 
inner join Tracking t on o.OrderID = t.OrderID

--history of customer orders
select c.Customername,p.Productname,s.TotalAmount,s.SalesDate
from Sales s
inner join Products p on p.ProductID = s.ProductID
inner join Customer c on s.CustomerID = c.CustomerID

--inventory and ledger
select i.InventoryName,l.CreditAmount,l.DebitAmount,l.TransactionDate
from Inventory i 
inner join Ledger l on i.InventoryID = l.InventoryID;

--details of customer,shipping,payment and tracking info
select o.OrderID,c.Customername,s.ShippingAddress,s.BillingAddress,p.Paymenttype,p.Paymentstatus,p.TotalAmount,t.EstimateDelivery,t.Deliverystatus
from Orders o
inner join Customer c on c.CustomerID = o.CustomerID 
inner join ShippingAddress s on s.CustomerID = s.CustomerID
inner join Payments p on p.OrderID = o.OrderID
inner join Tracking t on t.OrderID = o.OrderID;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Procedures

-- Total Sale Per Month
CREATE PROCEDURE TotalSalePerMonth
AS
SELECT  
    YEAR(Orderdate) AS OrderYear,
    MONTH(Orderdate) AS OrderMonth,
    SUM(Totalamount) AS TotalSales
FROM Orders
GROUP BY YEAR(Orderdate), MONTH(Orderdate)
ORDER BY OrderYear, OrderMonth;

exec TotalSalePerMonth;

-- Total Sale Per Day
CREATE PROCEDURE TotalSalePerDay
AS
SELECT  
    CAST(Orderdate AS DATE) AS OrderDay,
    SUM(Totalamount) AS TotalSales
FROM Orders
GROUP BY CAST(Orderdate AS DATE)
ORDER BY OrderDay;

exec TotalSalePerDay;

-- Total Sale Per Year
CREATE PROCEDURE TotalSalePerYear
AS
SELECT  
    YEAR(Orderdate) AS OrderYear,
    SUM(Totalamount) AS TotalSales
FROM Orders
GROUP BY YEAR(Orderdate)
ORDER BY OrderYear;

exec TotalSalePerYear;

-- Average Sale Per Day
CREATE PROCEDURE AverageSalePerDay
AS
SELECT  
    AVG(DailySales) AS AverageDailySale
FROM (
    SELECT CAST(Orderdate AS DATE) AS SaleDay, SUM(Totalamount) AS DailySales
    FROM Orders
    GROUP BY CAST(Orderdate AS DATE)
) AS DailySummary;

exec AverageSalePerDay;

-- Average Sale Per Month
CREATE PROCEDURE AverageSalePerMonth
AS
SELECT  
    AVG(MonthlySales) AS AverageMonthlySale
FROM (
    SELECT YEAR(Orderdate) AS Y, MONTH(Orderdate) AS M, SUM(Totalamount) AS MonthlySales
    FROM Orders
    GROUP BY YEAR(Orderdate), MONTH(Orderdate)
) AS MonthlySummary;

exec AverageSalePerMonth;

-- Average Sale Per Year
CREATE PROCEDURE AverageSalePerYear
AS
SELECT  
    AVG(YearlySales) AS AverageYearlySale
FROM (
    SELECT YEAR(Orderdate) AS Y, SUM(Totalamount) AS YearlySales
    FROM Orders
    GROUP BY YEAR(Orderdate)
) AS YearlySummary;

exec AverageSalePerYear;

-- Update Product Details
CREATE PROCEDURE UpdateProductDetails
    @ProductID INT,
    @ProductName NVARCHAR(100),
    @Price DECIMAL(10,2),
    @Quantity INT
AS
UPDATE Products
SET ProductName = @ProductName, Productprice = @Price, Stockquantity = @Quantity
WHERE ProductID = @ProductID;

EXEC UpdateProductDetails --(EXAMPLE TO RUN THIS QUERY)
 @ProductID = 12,
 @ProductName = 'Sony HT-S350 Home Theater',
 @Price = 799.99,
 @Quantity = 20;

 SELECT * FROM Products --(TO CHECK UPDATE IN TABLE)

-- Quantity of a Product
CREATE PROCEDURE GetProductQuantity
    @ProductID INT
AS
SELECT ProductName, Stockquantity
FROM Products
WHERE ProductID = @ProductID;

EXEC GetProductQuantity @ProductID = 13;

-- ProductNameAndPrice
CREATE PROCEDURE GetProductNameAndPrice
    @ProductID INT
AS
BEGIN
    SELECT ProductName, Productprice
    FROM Products
    WHERE ProductID = @ProductID;
END;

exec GetProductNameAndPrice @ProductID = 12;

-- Number of Orders Till Date
CREATE PROCEDURE TotalOrderCount
AS
SELECT COUNT(*) AS TotalOrders
FROM Orders;

exec TotalOrderCount;

-- Number of Customers
CREATE PROCEDURE TotalCustomerCount
AS
SELECT COUNT(*) AS TotalCustomers
FROM Customer;

exec TotalCustomerCount;

-- Number of Products
CREATE PROCEDURE TotalProductCount
AS
SELECT COUNT(*) AS TotalProducts
FROM Products;

exec TotalProductCount;

-- Most Ordered Product
CREATE PROCEDURE MostOrderedProduct
AS
SELECT TOP 1 p.ProductID, p.ProductName, SUM(s.Quantity) AS TotalOrdered
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalOrdered DESC;

exec MostOrderedProduct;

-- Orders by Customer
CREATE PROCEDURE GetOrdersByCustomer
    @CustomerID INT
AS
BEGIN
    SELECT *
    FROM Orders
    WHERE CustomerID = @CustomerID;
END

EXEC GetOrdersByCustomer @CustomerID = 7;

-- getdeliverystatus
CREATE PROCEDURE GetDeliveryStatus
    @OrderID INT
AS
BEGIN
    SELECT OrderID, DeliveryStatus
    FROM Tracking
    WHERE OrderID = @OrderID;
END

exec GetDeliveryStatus @orderID = 7623;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Triggers
-- Auto-Update Product Stock After Sale
CREATE TRIGGER reducestockaftersale 
ON Sales 
AFTER INSERT 
AS 
BEGIN 
    UPDATE Products 
    SET Stockquantity = Products.Stockquantity - i.Quantity 
    FROM Products 
    JOIN INSERTED i ON Products.ProductID = i.ProductID; 
END;

--Test Case:
INSERT INTO Sales (SalesID, CustomerID, ProductID, Quantity, UnitPrice, TotalAmount, SalesDate) 
VALUES (16, 4, 3, 1, 150000, 150000, GETDATE());

--Prevent Overselling
CREATE TRIGGER preventoversell 
ON Sales 
INSTEAD OF INSERT 
AS 
BEGIN 
    IF EXISTS ( 
        SELECT 1 
        FROM INSERTED i 
        JOIN Products p ON i.ProductID = p.ProductID 
        WHERE i.Quantity > p.Stockquantity 
    ) 
    BEGIN 
        RAISERROR('Insufficient stock for the sale', 16, 1); 
        ROLLBACK TRANSACTION; 
        RETURN; 
    END 

    -- Proceed if stock is available 
    INSERT INTO Sales (SalesID, CustomerID, ProductID, Quantity, UnitPrice, TotalAmount, SalesDate) 
    SELECT SalesID, CustomerID, ProductID, Quantity, UnitPrice, TotalAmount, SalesDate 
    FROM INSERTED; 
END;

--Test Case:
INSERT INTO Sales (SalesID, CustomerID, ProductID, Quantity, UnitPrice, TotalAmount, SalesDate) 
VALUES (17, 5, 13, 9, 60000, 540000, GETDATE());

--Recalculate Order Total After Insert/Update/Delete
--After Insert
CREATE TRIGGER recalculateordertotalinsert 
ON Orderdetails 
AFTER INSERT 
AS 
BEGIN 
    UPDATE o 
    SET Totalamount = ISNULL(recalc.Total, 0) 
    FROM Orders o 
    JOIN ( 
        SELECT od.OrderID, SUM(od.Quantity * p.Productprice) AS Total 
        FROM Orderdetails od 
        JOIN Products p ON od.ProductID = p.ProductID 
        WHERE od.OrderID IN (SELECT DISTINCT OrderID FROM INSERTED) 
        GROUP BY od.OrderID 
    ) recalc ON o.OrderID = recalc.OrderID; 
END;

--After Update
CREATE TRIGGER recalculateordertotalupdate 
ON Orderdetails 
AFTER UPDATE 
AS 
BEGIN 
    UPDATE o 
    SET Totalamount = ISNULL(recalc.Total, 0) 
    FROM Orders o 
    JOIN ( 
        SELECT od.OrderID, SUM(od.Quantity * p.Productprice) AS Total 
        FROM Orderdetails od 
        JOIN Products p ON od.ProductID = p.ProductID 
        WHERE od.OrderID IN ( 
            SELECT DISTINCT OrderID FROM INSERTED 
            UNION 
            SELECT DISTINCT OrderID FROM DELETED 
        ) 
        GROUP BY od.OrderID 
    ) recalc ON o.OrderID = recalc.OrderID; 
END;


--After Delete
CREATE TRIGGER trg_recalculate_order_total_delete 
ON Orderdetails 
AFTER DELETE 
AS 
BEGIN 
    UPDATE o 
    SET Totalamount = ISNULL(recalc.Total, 0) 
    FROM Orders o 
    JOIN ( 
        SELECT od.OrderID, SUM(od.Quantity * p.Productprice) AS Total 
        FROM Orderdetails od 
        JOIN Products p ON od.ProductID = p.ProductID 
        WHERE od.OrderID IN (SELECT DISTINCT OrderID FROM DELETED) 
        GROUP BY od.OrderID 
    ) recalc ON o.OrderID = recalc.OrderID; 

    -- Set total to 0 if no items left 
    UPDATE o 
    SET Totalamount = 0 
    FROM Orders o 
    WHERE o.OrderID IN (SELECT DISTINCT OrderID FROM DELETED) 
    AND NOT EXISTS ( 
        SELECT 1 FROM Orderdetails od WHERE od.OrderID = o.OrderID 
    ); 
END;

--Auto-Update Inventory Timestamp
CREATE TRIGGER trg_inventory_lastupdate 
ON Inventory 
AFTER UPDATE 
AS 
BEGIN 
    UPDATE Inventory 
    SET Lastupdate = GETDATE() 
    FROM Inventory i 
    JOIN INSERTED ins ON i.InventoryID = ins.InventoryID; 
END;

-- Auto-Delete CartItems When Cart is Deleted
CREATE TRIGGER trg_delete_cartitems_with_cart 
ON Cart 
AFTER DELETE 
AS 
BEGIN 
    DELETE FROM Cartitems 
    WHERE CartID IN (SELECT CartID FROM DELETED); 
END;

--Prevent Duplicate Products in Cart
CREATE TRIGGER preventduplicatecartitem 
ON Cartitems 
INSTEAD OF INSERT 
AS 
BEGIN 
    IF EXISTS ( 
        SELECT 1 
        FROM INSERTED i 
        JOIN Cartitems c 
        ON i.CartID = c.CartID AND i.ProductID = c.ProductID 
    ) 
    BEGIN 
        RAISERROR('Product already exists in the cart.', 16, 1); 
        RETURN; 
    END 
    INSERT INTO Cartitems (CartitemsID, CartID, ProductID, Quantity) 
    SELECT CartitemsID, CartID, ProductID, Quantity 
    FROM INSERTED; 
END;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--AGGREGATE FUNCTIONS 

--Total Revenue Generated

SELECT SUM(TotalAmount) AS TotalRevenue 
FROM Sales;

--Average Order Value 
SELECT AVG(Totalamount) AS AverageOrderValue 
FROM Orders;

--Highest-Selling Product ( By Revenue)
SELECT TOP 1 ProductID, SUM(TotalAmount) AS Revenue 

FROM Sales 

GROUP BY ProductID 

ORDER BY Revenue DESC; 
 

 --Total Quantity Sold per Product 
 SELECT ProductID, SUM(Quantity) AS TotalSold 

FROM Sales 

GROUP BY ProductID; 


--Top Spending Customers 
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent 

FROM Sales 

GROUP BY CustomerID 

ORDER BY TotalSpent DESC; 

--Low Stock Products
SELECT TOP 5 ProductID, Productname, Stockquantity 

FROM Products 

ORDER BY Stockquantity ASC;

--Average Stock per Category 
SELECT CategoryID, AVG(Stockquantity) AS AvgStock 

FROM Products 

GROUP BY CategoryID;

--Most Stocked Product 
SELECT TOP 1 ProductID, Productname, Stockquantity 

FROM Products 

ORDER BY Stockquantity DESC; 

--Customer with Most Orders 
SELECT TOP 1 CustomerID, COUNT(*) AS TotalOrders 

FROM Orders 

GROUP BY CustomerID 

ORDER BY TotalOrders DESC; 

--Most Used Payment Type 
SELECT Paymenttype, COUNT(*) AS UsageCount 

FROM Payments 

GROUP BY Paymenttype 

ORDER BY UsageCount DESC;

--Orders Per Day
SELECT Orderdate, COUNT(*) AS OrderCount 

FROM Orders 

GROUP BY Orderdate 
ORDER BY Orderdate DESC; 
 
 --Vendors per Category
 SELECT Categories AS CategoryName, COUNT(*) AS VendorCount 

FROM Vendors 

GROUP BY Categories; 


