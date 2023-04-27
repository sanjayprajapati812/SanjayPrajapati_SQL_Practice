CREATE DATABASE SP353SanjayPrajapati
USE SP353SanjayPrajapati

CREATE TABLE SPEmployeeDetailsDepartment(
	SPEmployeeDetailsDepartmentId INT PRIMARY KEY,
	SPEmployeeDetailsDepartmentName VARCHAR(250) NOT NULL,
	SPEmployeeDetailsDepartmentAllotment INT
)

CREATE TABLE SPEmployeeDetails(
	SPEmployeeDetailsId INT PRIMARY KEY,
	SPEmployeeDetailsFirstName VARCHAR(250) NOT NULL,
	SPEmployeeDetailsLastName VARCHAR(250) NOT NULL,
	SPEmployeeDetailsDepartmentId INT FOREIGN KEY REFERENCES SPEmployeeDetailsDepartment(SPEmployeeDetailsDepartmentId)
)

--drop table CompanyMaster
--drop table SPEmployeeDetailsDepartment

CREATE TABLE ProductCompany(
	ProductCompanyId int primary key,
	ProductCompanyName varchar(250) NOT NULL,
)

CREATE TABLE Product(
	ProductId INT PRIMARY KEY,
	ProductName VARCHAR(250),
	ProductPrice DECIMAL,
	ProductCompanyId INT FOREIGN KEY REFERENCES ProductCompany(ProductCompanyId)
)


CREATE TABLE Salesman(
	SalesmanId INT PRIMARY KEY,
	SalesmanName VARCHAR(250) NOT NULL,
	SalesmanCity VARCHAR(100),
	SalesmanCommission DECIMAL(4,2)
)

CREATE TABLE Customer(
	 CustomerId INT PRIMARY KEY,
	 CustomerName VARCHAR(250),
	 CustomerCity VARCHAR(100),
	 CustomerGrade INT,
	 SalesmanId INT FOREIGN KEY REFERENCES Salesman(SalesmanId)
)

CREATE TABLE Orders(
	 OrdersId INT PRIMARY KEY,
	 OrdersPurchaseAmount DECIMAL,
	 Ordersdate DATE,
	 CustomerId INT FOREIGN KEY REFERENCES Customer(CustomerId),
	 SalesmanId INT FOREIGN KEY REFERENCES Salesman(SalesmanId)
)

--drop table Orders

INSERT INTO SPEmployeeDetailsDepartment (
	SPEmployeeDetailsDepartmentId,
	SPEmployeeDetailsDepartmentName,
	SPEmployeeDetailsDepartmentAllotment
)
VALUES
	( 57,'IT',65000),
	(63,'Finance',15000),
	(47,'HR',240000),
	(27, 'RD',55000),
	(89,'QC',75000)

INSERT INTO SPEmployeeDetails(
	SPEmployeeDetailsId,
	SPEmployeeDetailsFirstName,
	SPEmployeeDetailsLastName,
	SPEmployeeDetailsDepartmentId
)
VALUES
	( 127323, 'Michale' , 'Robbin'    , 57),
	( 526689, 'Carlos'  ,  'Snares'   ,  63),
	( 843795, 'Enric'   ,  'Dosio'    ,  57),
	( 328717, 'Jhon'    ,  'Snares'   ,  63),
	( 444527, 'Joseph'  ,  'Dosni'    ,  47),
	( 659831, 'Zanifer' ,  'Emily'    ,  47),
	( 847674, 'Kuleswar',  'Sitaraman',  57),
	( 748681, 'Henrey'  ,  'Gabriel'  ,  47),
	( 555935, 'Alex'    ,  'Manuel'   ,  57),
	( 539569, 'George'  ,  'Mardy'    ,  27),
	( 733843, 'Mario'   ,  'Saule'    ,  63),
	( 631548, 'Alan'    , 'Snappy'    , 27) ,
	( 839139, 'Maria'   ,  'Foster'   ,  57)

INSERT INTO ProductCompany(
	ProductCompanyId,
	ProductCompanyName
)
VALUES
	(11, 'Samsung'),
    (12, 'iBall'),
    (13, 'Epsion'),
    (14, 'Zebronics'),
    (15, 'Asus'),
    (16, 'Frontech')


INSERT INTO Product(
	ProductId,
	ProductName,
	ProductPrice,
	ProductCompanyId
)
VALUES
	(101, 'Mother Board'    , 3200, 15),
    (102, 'Key Board'       ,  450, 16),
    (103, 'ZIP drive'       ,  250, 14),
    (104, 'Speaker'         ,  550, 16),
    (105, 'Monitor'         , 5000, 11),
    (106, 'DVD drive'       ,  900, 12),
    (107, 'CD drive'        ,  800, 12),
    (108, 'Printer'         , 2600, 13),
    (109, 'Refill cartridge',  350, 13),
    (110, 'Mouse'           ,  250, 12)

INSERT INTO Salesman(
	SalesmanId,
	SalesmanName,
	SalesmanCity,
	SalesmanCommission
)
VALUES
		( 5001 , 'James Hoog' , 'New York' ,  0.15),
        ( 5002 , 'Nail Knite' , 'Paris'    ,  0.13),
        ( 5005 , 'Pit Alex'   , 'London'   ,  0.11),
        ( 5006 , 'Mc Lyon'   , 'Paris'    ,  0.14),
        ( 5007 , 'Paul Adam'  , 'Rome'     ,  0.13),
        ( 5003 , 'Lauson Hen' , 'San Jose' ,  0.12)

INSERT INTO Customer(
	CustomerId,
	CustomerName,
	CustomerCity,
	CustomerGrade,
	SalesmanId
)
VALUES
	(3002 , 'Nick Rimando'   , 'New York'   ,   100 , 5001),
    (3007 , 'Brad Davis'     , 'New York'   ,   200 , 5001),
    (3005 , 'Graham Zusi'    , 'California' ,   200 , 5002),
    (3008 , 'Julian Green'   , 'London'     ,   300 , 5002),
    (3004 , 'Fabian Johnson' , 'Paris'      ,   300 , 5006),
    (3009 , 'Geoff Cameron'  , 'Berlin'     ,   100 , 5003),
    (3003 , 'Jozy Altidor'   , 'Moscow'     ,   200 , 5007),
    (3001 , 'Brad Guzan'     , 'London'     ,   null , 5005)

INSERT INTO Orders(
	OrdersId,
	OrdersPurchaseAmount,
	Ordersdate,
	CustomerId,
	SalesmanId
)
VALUES
	(70001, 150.5    ,   '2012-10-05' , 3005  , 5002),
	(70009, 270.65   ,   '2012-09-10' , 3001  , 5005),
	(70002, 65.26    ,   '2012-10-05' , 3002  , 5001),
	(70004, 110.5    ,   '2012-08-17' , 3009  , 5003),
	(70007, 948.5    ,   '2012-09-10' , 3005  , 5002),
	(70005, 2400.6   ,   '2012-07-27' , 3007  , 5001),
	(70008, 5760     ,   '2012-09-10' , 3002  , 5001),
	(70010, 1983.43  ,   '2012-10-10' , 3004  , 5006),
	(70003, 2480.4   ,   '2012-10-10' , 3009  , 5003),
	(70012, 250.45   ,   '2012-06-27' , 3008  , 5002),
	(70011, 75.29    ,   '2012-08-17' , 3003  , 5007),
	(70013, 3045.6   ,   '2012-04-25' , 3002  , 5001)

SELECT * 
FROM Orders
INNER JOIN Customer ON Orders.CustomerId=Customer.CustomerId
INNER JOIN Salesman ON Orders.SalesmanId=Salesman.SalesmanId


--(1) Write a SQL statement to find the total purchase amount of all orders.

SELECT SUM(OrdersPurchaseAmount) AS total_purchase_amount
FROM Orders



--(2) Write a SQL statement to find the average purchase amount of all orders.

SELECT AVG(OrdersPurchaseAmount) AS average_purchase_amount
FROM Orders



--(3) Write a SQL statement to find the number of salesmen currently listing for all of their customers

SELECT  SalesmanId,COUNT(*) AS salesmen_listing_customers
FROM Customer
GROUP BY SalesmanId




--(4) Write a SQL statement to know how many customer have listed their names.

SELECT COUNT(*) AS Customer_listed_names 
FROM Customer 
WHERE CustomerName IS NOT NULL



--(5) Write a SQL statement find the number of customers who gets at least a gradation for his/her performance

SELECT count(*) AS Customer_Get_Gradation 
FROM Customer 
WHERE CustomerGrade IS NOT NULL



--(6) Write a SQL statement to get the maximum purchase amount of all the orders

SELECT MAX(OrdersPurchaseAmount) AS maximum_purchase_amount 
FROM Orders


--(7) Write a SQL statement to get the minimum purchase amount of all the orders

SELECT MIN(OrdersPurchaseAmount) AS minimum_purchase_amount 
FROM Orders


--(8) Write a SQL statement which selects the highest grade for each of the cities of the customers.

SELECT CustomerCity, MAX(CustomerGrade) AS highest_grade 
FROM Customer
GROUP BY CustomerCity



--(9) Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount.

SELECT CustomerId, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY CustomerId



--(10) Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID,
--order date and highest purchase amount.

SELECT CustomerId, Ordersdate, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY CustomerId,Ordersdate



--(11) Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.

SELECT Ordersdate, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
WHERE Ordersdate = '2012-08-17'
GROUP BY Ordersdate


--(12) Write a SQL statement to find the highest purchase amount with their ID and order date,
--for only those customers who have highest purchase amount in a day is more than 2000.  

SELECT CustomerId, Ordersdate, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY CustomerId,Ordersdate
HAVING MAX(OrdersPurchaseAmount)>=2000


--(13) Write a SQL statement to find the highest purchase amount with their ID and order date,
--for those customers who have a higher purchase amount in a day is within the range 2000 and 6000

SELECT CustomerId, Ordersdate, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY CustomerId,Ordersdate
HAVING MAX(OrdersPurchaseAmount) BETWEEN 2000 AND 6000

--(14) Write a SQL statement to find the highest purchase amount with their ID and order date, 
--for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.  

SELECT CustomerId, Ordersdate, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY CustomerId,Ordersdate
HAVING MAX(OrdersPurchaseAmount) IN(2000, 3000, 5760, 6000)

--(15) Write a SQL statement to find the highest purchase amount with their ID,
--for only those customers whose ID is within the range 3002 and 3007.

SELECT CustomerId, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY CustomerId
HAVING MAX(OrdersPurchaseAmount) BETWEEN 3002 AND 3007


--(16) Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range
--3002 and 3007 and highest purchase amount is more than 1000.

SELECT CustomerId, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY CustomerId
HAVING (CustomerId BETWEEN 3002 AND 3007) AND (MAX(OrdersPurchaseAmount)>=1000)


--(17) Write a SQL statement to find the highest purchase amount with their ID,
--for only those salesmen whose ID is within the range 5003 and 5008. 

SELECT SalesmanId, MAX(OrdersPurchaseAmount) AS highest_purchase_amount
FROM Orders
GROUP BY SalesmanId
HAVING SalesmanId BETWEEN 5003 AND 5008

--(18) Write a SQL statement that counts all orders for a date August 17th, 2012.   

SELECT COUNT(*) AS TotalOrderCount
FROM Orders
WHERE Ordersdate = '2012-08-17'

--(19) Write a SQL statement that count the number of salesmen for whom a city is specified.
--Note that there may be spaces or no spaces in the city column if no city is specified.   

SELECT COUNT(*) AS CityNotSpecified FROM Salesman
WHERE SalesmanCity IS NULL

--(20) Write a query that counts the number of salesmen with their order date and ID registering orders for each day.

SELECT SalesmanId, Ordersdate, COUNT(SalesmanId) AS TotalCount
FROM Orders
GROUP BY SalesmanId, Ordersdate


--(21) Write a SQL query to calculate the average price of all the products.

SELECT AVG(ProductPrice) AS AVERAGE_PRAICE
FROM Product

--(22) Write a SQL query to find the number of products with a price more than or equal to Rs.350.

SELECT COUNT(*) AS TOTAL_OPRODUCT
FROM Product
WHERE ProductPrice>=350

--(23) Write a SQL query to display the average price of each company's products, along with their code.

SELECT ProductCompanyId, AVG(ProductPrice) AS AVG_PRICE_PRODUCT
FROM Product
GROUP BY ProductCompanyId


--(24) Write a query in SQL to find the sum of the allotment amount of all departments. 

SELECT SUM(SPEmployeeDetailsDepartmentAllotment) AS ALL_DEPT_ALLOT_SUM
FROM SPEmployeeDetailsDepartment


--(25) Write a query in SQL to find the number of employees in each department along with the department code.

SELECT SPEmployeeDetailsDepartmentId, COUNT(SPEmployeeDetailsId) AS TOTAL_EMPLOYEES
FROM SPEmployeeDetails
GROUP BY SPEmployeeDetailsDepartmentId