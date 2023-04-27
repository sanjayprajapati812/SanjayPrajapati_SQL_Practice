
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

CREATE TABLE OrdersSC(
	 OrdersId INT PRIMARY KEY,
	 OrdersPurchaseAmount DECIMAL,
	 Ordersdate DATE,
	 CustomerId INT FOREIGN KEY REFERENCES Customer(CustomerId),
	 SalesmanId INT FOREIGN KEY REFERENCES Salesman(SalesmanId)
)

--drop table OrdersSC

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
	(3011 , 'SANJAY'   , 'Dallas'   ,   200 , 5002),
	(3002 , 'Nick Rimando'   , 'New York'   ,   100 , 5001),
    (3007 , 'Brad Davis'     , 'New York'   ,   200 , 5001),
    (3005 , 'Graham Zusi'    , 'California' ,   200 , 5002),
    (3008 , 'Julian Green'   , 'London'     ,   300 , 5002),
    (3004 , 'Fabian Johnson' , 'Paris'      ,   300 , 5006),
    (3009 , 'Geoff Cameron'  , 'Berlin'     ,   100 , 5003),
    (3003 , 'Jozy Altidor'   , 'Moscow'     ,   200 , 5007),
    (3001 , 'Brad Guzan'     , 'London'     ,   null , 5005)

INSERT INTO OrdersSC(
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


select * from Product
select * from ProductCompany
select * from SPEmployeeDetails
select * from SPEmployeeDetailsDepartment
select * from Salesman
select * from Customer
select * from OrdersSC



-- 1. Write a SQL statement to prepare a list with salesman name, customer name AND their cities for the salesmen AND customer who belongs to the same city

		SELECT S.SalesmanName,C.CustomerName,S.SalesmanCity 
		FROM Salesman S
		INNER JOIN Customer C 
		ON S.SalesmanCity = C.CustomerCity


--2. Write a SQL statement to make a list with order no, purchase amount, customer name AND their cities for those OrdersSC which order amount BETWEEN 500 AND 2000

		SELECT O.OrdersId,O.OrdersPurchaseAmount,C.CustomerName, C.CustomerCity 
		FROM OrdersSC O
		INNER JOIN Customer C 
		ON O.CustomerId = C.CustomerId
		WHERE O.OrdersPurchaseAmount BETWEEN 500 AND 2000


-- 3. Write a SQL statement to know which salesman are working for which customer.

		SELECT O.OrdersId,O.CustomerId,C.CustomerName,O.SalesmanId,S.SalesmanName 
		FROM OrdersSC O
		INNER JOIN Customer C 
		ON O.CustomerId = C.CustomerId 
		INNER JOIN Salesman S
		ON O.SalesmanId= S.SalesmanId



-- 4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission FROM the company is more than 12%

		SELECT C.CustomerId,C.CustomerName,C.SalesmanId,S.SalesmanName,S.SalesmanCommission 
		FROM Customer C
        INNER JOIN Salesman S 
        ON C.SalesmanId = S.SalesmanId
        WHERE S.SalesmanCommission > .12


-- 5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city WHERE their customer lives, AND gets a commission is above 12%

		SELECT C.CustomerName,C.SalesmanId,S.SalesmanName,S.SalesmanCommission,C.CustomerCity,S.SalesmanCity 
		FROM Customer C
        INNER JOIN Salesman S 
        ON C.SalesmanId = S.SalesmanId
        WHERE S.SalesmanCommission > .12
        AND C.CustomerCity <> S.SalesmanCity

-- 6. Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, which customer gives the order AND which salesman works for that customer AND how much commission he gets for an order.

        
		SELECT O.OrdersId,O.OrdersDate,O.OrdersPurchaseAmount,C.CustomerName,O.SalesmanId,S.SalesmanName,S.SalesmanCommission 
		FROM OrdersSC O
		INNER JOIN Customer C 
		ON O.CustomerId = C.CustomerId 
		INNER JOIN Salesman S
		ON O.SalesmanId= S.SalesmanId


-- 7. Write a SQL statement to make a JOIN ON the tables salesman, customer AND OrdersSC in such a form that the same column of each table will appear once AND only the relational rows will come.

        

-- 8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. 

        SELECT * 
		FROM Customer C
		ORDER BY C.CustomerName ASC

-- 9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 AND works either through a salesman or by own. 

        SELECT * 
		FROM Customer C
        WHERE C.CustomerGrade < 300
		ORDER BY C.CustomerName ASC

--10. Write a SQL statement to make a report with customer name, city, order number, order date, AND order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more OrdersSC.

		SELECT O.OrdersId,O.OrdersDate,C.CustomerName,C.CustomerCity,O.OrdersPurchaseAmount
        FROM OrdersSC O 
        LEFT JOIN Customer C 
        ON O.CustomerId = C.CustomerId 
        Order by O.OrdersDate ASC
    


--11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount salesman name AND commission to find that either any of the existing customers have placed no order or placed one or more OrdersSC by their salesman or by own. 

        SELECT  C.CustomerName,C.CustomerCity,O.OrdersId,O.OrdersDate,O.OrdersPurchaseAmount,S.SalesmanName,S.SalesmanCommission
		FROM Customer C
		LEFT JOIN OrdersSC O  ON O.CustomerId = C.CustomerId
		LEFT JOIN Salesman S ON O.SalesmanId = S.SalesmanId


-- 12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet JOIN under any of the customers.  

        SELECT C.CustomerName,S.SalesmanId,S.SalesmanName 
		FROM Salesman S
        LEFT JOIN Customer C
        On C.SalesmanId=S.SalesmanId


-- 13. Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet JOIN under any of the customers who placed either one or more OrdersSC or no order to their supplier.

        SELECT  S.SalesmanName,S.SalesmanCommission,C.CustomerName,C.CustomerCity,O.OrdersId,O.OrdersDate,O.OrdersPurchaseAmount
	    FROM Salesman S
	    LEFT JOIN OrdersSC O ON O.SalesmanId = S.SalesmanId
	    LEFT JOIN Customer C ON O.CustomerId = C.CustomerId


-- 14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to JOIN any of the customer. The customer may have placed, either one or more OrdersSC ON or above order amount 2000 AND must have a grade, or he may not have placed any order to the associated supplier.

        SELECT  S.SalesmanName,S.SalesmanCommission,C.CustomerName,O.OrdersId,O.OrdersDate,O.OrdersPurchaseAmount,C.CustomerGrade
	    FROM Salesman S
	    LEFT JOIN Customer C ON C.SalesmanId = S.SalesmanId
	    LEFT JOIN OrdersSC O ON O.CustomerId = C.CustomerId
        WHERE O.OrdersPurchaseAmount>=2 
        AND C.CustomerGrade IS NOT NULL;

-- 15 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for those customers FROM the existing list who placed one or more OrdersSC or which order(s) have been placed by the customer who is not ON the list.

		SELECT O.OrdersId,O.OrdersDate,C.CustomerName,C.CustomerCity,O.OrdersPurchaseAmount
        FROM OrdersSC O 
        LEFT JOIN Customer C 
		ON O.CustomerId = C.CustomerId


--16 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers ON the list who must have a grade AND placed one or more OrdersSC or which order(s) have been placed by the customer who is neither in the list not have a grade. 
		
		SELECT O.OrdersId,O.OrdersDate,C.CustomerName,C.CustomerCity,O.OrdersPurchaseAmount,C.CustomerGrade
        FROM OrdersSC O 
        LEFT JOIN Customer C 
		ON O.CustomerId = C.CustomerId
		WHERE C.CustomerGrade IS NOT NULL;


--17 . Write a SQL statement to make a cartesian product BETWEEN salesman AND customer i.e. each salesman will appear for all customer AND vice versa.
		SELECT * 
		FROM Salesman 
		CROSS JOIN Customer

--18 . Write a SQL statement to make a cartesian product BETWEEN salesman AND customeri.e. each salesman will appear for all customer AND vice versa for that customer who belongs to a city.

		SELECT * 
		FROM Salesman 
		CROSS JOIN Customer C 
		WHERE C.CustomerCity IS NOT NULL

--19 . Write a SQL statement to make a cartesian product BETWEEN salesman AND customer i.e. each salesman will appear for all customer AND vice versa for those salesmen who belongs to a city AND the customers who must have a grade. 

		SELECT * 
		FROM Salesman S 
		CROSS JOIN Customer C 
		WHERE C.CustomerGrade IS NOT NULL AND S.SalesmanCity IS NOT NULL

--20 . Write a SQL statement to make a cartesian product BETWEEN salesman AND customer i.e. each salesman will appear for all customer AND vice versa for those salesmen who must belong a city which is not the same AS his customer AND the customers should have an own grade. 
			
		SELECT * 
		FROM Salesman S 
		CROSS JOIN Customer C 
		WHERE C.CustomerGrade IS NOT NULL AND S.SalesmanCity IS NOT NULL AND S.SalesmanCity<>C.CustomerCity 

--21 . Write a SQL query to display all the data FROM the item_mast, including all the data for each item's producer company.

		SELECT P.*, C.ProductCompanyName 
		FROM Product P 
		LEFT JOIN ProductCompany C
		ON P.ProductCompanyId = C.ProductCompanyId
		
		
--22 . Write a SQL query to display the item name, price, AND company name of all the product

		SELECT P.ProductName,P.ProductPrice,C.ProductCompanyName 
		FROM Product P 
		LEFT JOIN ProductCompany C
		ON P.ProductCompanyId=C.ProductCompanyId

--23 . Write a SQL query to display the average price of items of each company, showing the name of the company. 

		SELECT AVG(P.ProductPrice) 
		AS averageprice,P.ProductCompanyId
		FROM Product P
		INNER JOIN ProductCompany C
		ON P.ProductCompanyId=C.ProductCompanyId
		GROUP BY P.ProductCompanyId

--24 . Write a SQL query to display the names of the company whose products have an average price larger than or equal to Rs. 350.

		SELECT AVG(P.ProductPrice) AS averageprice,P.ProductCompanyId
		FROM Product P
		INNER JOIN ProductCompany C
		ON P.ProductCompanyId=C.ProductCompanyId
		GROUP BY P.ProductCompanyId
		HAVING AVG(P.ProductPrice)>=350

--25 . Write a SQL query to display the name of each company along with the ID AND price for their most expensive product.

		SELECT P.ProductName,P.ProductPrice,P.ProductCompanyId,C.ProductCompanyName
		FROM Product P
		INNER JOIN ProductCompany C
		ON P.ProductCompanyId=C.ProductCompanyId
		WHERE P.ProductPrice = (
									SELECT MAX(P.ProductPrice)
									FROM Product P
									WHERE P.ProductCompanyId = C.ProductCompanyId
								);

	 
--26 . Write a query in SQL to display all the data of employees including their department

		SELECT E.*,D.SPEmployeeDetailsDepartmentName 
		FROM SPEmployeeDetails E
		LEFT JOIN SPEmployeeDetailsDepartment D
		ON D.SPEmployeeDetailsDepartmentId = E.SPEmployeeDetailsDepartmentId



--27 . Write a query in SQL to display the first name AND last name of each employee, along with the name AND sanction amount for their department.
	
		SELECT E.*,D.SPEmployeeDetailsDepartmentName,D.SPEmployeeDetailsDepartmentAllotment 
		FROM SPEmployeeDetails E
		LEFT JOIN SPEmployeeDetailsDepartment D
		ON D.SPEmployeeDetailsDepartmentId=E.SPEmployeeDetailsDepartmentId



--28 . Write a query in SQL to find the first name AND last name of employees working for departments with a budget more than Rs. 50000. 

		SELECT E.*,D.SPEmployeeDetailsDepartmentName,D.SPEmployeeDetailsDepartmentAllotment 
		FROM SPEmployeeDetails E
		LEFT JOIN SPEmployeeDetailsDepartment D
		ON D.SPEmployeeDetailsDepartmentId=E.SPEmployeeDetailsDepartmentId
		WHERE D.SPEmployeeDetailsDepartmentAllotment >50000



--29 . Write a query in SQL to find the names of departments WHERE more than two employees are working.
		SELECT * 
		FROM SPEmployeeDetailsDepartment D 
		WHERE D.SPEmployeeDetailsDepartmentId IN(
														SELECT D.SPEmployeeDetailsDepartmentId FROM SPEmployeeDetails E
														INNER JOIN SPEmployeeDetailsDepartment D
														ON D.SPEmployeeDetailsDepartmentId=E.SPEmployeeDetailsDepartmentId
														GROUP BY D.SPEmployeeDetailsDepartmentId
														HAVING count(*)>2
												)
		


--30 . Write a query to display all the OrdersSC FROM the OrdersSC table issued by the salesman 'Paul Adam'

		SELECT O.*,S.SalesmanName 
		FROM OrdersSC O
		INNER JOIN Salesman	S
		ON O.SalesmanId=S.SalesmanId
		WHERE S.SalesmanName='Paul Adam'



--31 . Write a query to display all the OrdersSC for the salesman who belongs to the city London.

		SELECT O.*,S.SalesmanName 
		FROM OrdersSC O
		INNER JOIN Salesman	S
		ON O.SalesmanId=S.SalesmanId
		WHERE S.SalesmanCity='London'
		


--32 . Write a query to find all the OrdersSC issued against the salesman who may works for customer whose id is 3007.

		SELECT *
		FROM OrdersSC O
		WHERE O.SalesmanId =  (
									SELECT DISTINCT O.SalesmanId 
									FROM OrdersSC O 
									WHERE O.CustomerId =3007
								);



--33 . Write a query to display all the OrdersSC which values are greater than the average order value for 10th October 2012.

		SELECT * FROM OrdersSC O
		WHERE O.OrdersPurchaseAmount > (
												SELECT avg(O.OrdersPurchaseAmount) 
												FROM OrdersSC O 
												WHERE O.OrdersDate='2012-10-10'
										)

--34 . Write a query to find all OrdersSC attributed to a salesman in New york.

		SELECT O.*,S.SalesmanName,S.SalesmanCity 
		FROM OrdersSC O
		INNER JOIN Salesman S
		ON O.SalesmanId=S.SalesmanId
		WHERE S.SalesmanCity='New york'

--35 . Write a query to count the customers with grades above New York's average

		SELECT count(*) AS COUNT_OF_CUSTOMER 
		FROM Customer C
		WHERE C.CustomerGrade> (
									SELECT avg(C.CustomerGrade) 
									FROM Customer C 
									WHERE  C.CustomerCity='New york'
								)
					   
--36 . Write a query to display all the customers with OrdersSC issued ON date 17th August, 2012

		SELECT O.*,C.CustomerName 
		FROM OrdersSC O
		LEFT JOIN Customer C
		ON O.CustomerId=C.CustomerId
		WHERE O.OrdersDate = '2012-08-17'

--37 . Write a query to find the name AND numbers of all salesmen who had more than one customer. 

		SELECT * 
		FROM Salesman S 
		WHERE S.SalesmanId in (
									SELECT C.SalesmanId FROM Customer C 
									GROUP BY C.SalesmanId
									HAVING count(*)>1
								)



-- (38) Write a query to find all OrdersSC with order amounts which are above-average amounts for their customers.

		SELECT * 
		FROM OrdersSC O
		WHERE O.OrdersPurchaseAmount > (
											SELECT AVG(OrdersPurchaseAmount) FROM OrdersSC
											WHERE CustomerId = O.CustomerId
										)

-- (39) Write a queries to find all OrdersSC with order amounts which are on or above-average amounts for their customers.  

		SELECT * 
		FROM OrdersSC O
		WHERE O.OrdersPurchaseAmount >= (
											SELECT AVG(OrdersPurchaseAmount) FROM OrdersSC
											WHERE CustomerId = O.CustomerId
										)

-- (40) Write a query to find the sums of the amounts from the OrdersSC table, grouped by date, eliminating all those dates where the sum was not at least 1000.00 
      --above the maximum order amount for that date

		SELECT SUM(O.OrdersPurchaseAmount) AS TOTAL_ORDER_PUR_AMOUNT, O.Ordersdate FROM OrdersSC O
		GROUP BY O.Ordersdate
		HAVING SUM(O.OrdersPurchaseAmount) > 1000 + MAX(O.OrdersPurchaseAmount)
		

-- (41) Write a query to extract the data from the customer table if and only if one or more of the customers in the customer table are located in London. 

		SELECT * 
		FROM Customer
		WHERE EXISTS (
							SELECT CustomerId FROM Customer
							WHERE CustomerCity='London'
						)

-- (42) Write a query to find the salesmen who have multiple customers. 

		SELECT * 
		FROM Salesman
		WHERE SalesmanId IN (
								SELECT O.SalesmanId FROM OrdersSC O
								INNER JOIN Customer C ON O.CustomerId = C.CustomerId
								GROUP BY O.SalesmanId
								HAVING COUNT(O.CustomerId) > 1
							 )

-- (43) Write a query to find all the salesmen who worked for only one customer

		SELECT * 
		FROM Salesman
		WHERE SalesmanId IN (
								SELECT O.SalesmanId FROM OrdersSC O
								INNER JOIN Customer C ON O.CustomerId = C.CustomerId
								GROUP BY O.SalesmanId
								HAVING COUNT(O.CustomerId) = 1
							 )

-- (44) Write a query that extract the rows of all salesmen who have customers with more than one OrdersSC.


		SELECT * 
		FROM Salesman
		WHERE SalesmanId IN (
								SELECT O.SalesmanId FROM OrdersSC O
								INNER JOIN Customer C ON O.CustomerId = C.CustomerId
								GROUP BY O.CustomerId,O.SalesmanId
								HAVING COUNT(OrdersId)>1
							 )
		
		

-- (45) Write a query to find salesmen with all information who lives in the city where any of the customers lives. 

		SELECT *
		FROM Salesman
		WHERE SalesmanCity IN ( SELECT CustomerCity FROM Customer)



-- (46) Write a query to find all the salesmen for whom there are customers that follow them.

		SELECT S.SalesmanId,S.SalesmanName,S.SalesmanCity,S.SalesmanCommission,C.CustomerId,C.CustomerName,C.CustomerCity
		FROM Customer C
		INNER JOIN Salesman S ON C.SalesmanId = S.SalesmanId
		WHERE S.SalesmanCity  = C.CustomerCity



-- (47) Write a query to display the salesmen which name are alphabetically lower than the name of the customers.

		SELECT S.SalesmanId,S.SalesmanName,S.SalesmanCity,S.SalesmanCommission,C.CustomerId,C.CustomerName
		FROM Customer C
		INNER JOIN Salesman S ON C.SalesmanId = S.SalesmanId
		WHERE S.SalesmanName < C.CustomerName



-- (48) Write a query to display the customers who have a greater gradation than any customer who belongs to the alphabetically lower than the city New York.

		SELECT * 
		FROM Customer
		WHERE CustomerGrade > (
										SELECT MIN(CustomerGrade) 
										FROM Customer
										WHERE CustomerCity < 'New York'
								)

-- (49) Write a query to display all the OrdersSC that had amounts that were greater than at least one of the OrdersSC on September 10th 2012. 

		SELECT * 
		FROM OrdersSC
		WHERE OrdersPurchaseAmount > (
										SELECT TOP 1 OrdersPurchaseAmount
										FROM OrdersSC
										WHERE Ordersdate = '2012-09-10'
								)

-- (50) Write a query to find all OrdersSC with an amount smaller than any amount for a customer in London.

		SELECT * 
		FROM OrdersSC
		WHERE OrdersPurchaseAmount < (
										SELECT MIN(O.OrdersPurchaseAmount) 
										FROM OrdersSC O
										INNER JOIN Customer C ON O.CustomerId = C.CustomerId
										WHERE C.CustomerCity = 'London'
								)

-- (51) Write a query to display all OrdersSC with an amount smaller than any amount for a customer in London.

		SELECT * 
		FROM OrdersSC
		WHERE OrdersPurchaseAmount < (
										SELECT MIN(O.OrdersPurchaseAmount) 
										FROM OrdersSC O
										INNER JOIN Customer C ON O.CustomerId = C.CustomerId
										WHERE C.CustomerCity = 'London'
								)

-- (52) Write a query to display only those customers whose grade are, in fact, higher than every customer in New York. 

		SELECT * 
		FROM Customer
		WHERE CustomerGrade > (
										SELECT MAX(CustomerGrade) 
										FROM Customer 
										WHERE CustomerCity = 'New York'
								)

-- (53) Write a query to find only those customers whose grade are, higher than every customer to the city New York. 

		SELECT * 
		FROM Customer
		WHERE CustomerGrade > (
										SELECT MAX(CustomerGrade) 
										FROM Customer 
										WHERE CustomerCity = 'New York'
								)

-- (54) Write a query to get all the information for those customers whose grade is not as the grade of customer who belongs to the city London

		SELECT * 
		FROM Customer
		WHERE CustomerGrade NOT IN (
										SELECT CustomerGrade 
										FROM Customer 
										WHERE CustomerCity = 'London'AND NOT CustomerGrade IS NULL
									)

-- (55) Write a query to find all those customers whose grade are not as the grade, belongs to the city Paris.

		SELECT * 
		FROM Customer
		WHERE CustomerGrade NOT IN (
										SELECT CustomerGrade 
										FROM Customer 
										WHERE CustomerCity = 'Paris'
									)

-- (56) Write a query to find all those customers who hold a different grade than any customer of the city Dallas.

		SELECT * 
		FROM Customer
		WHERE CustomerGrade NOT IN (
										SELECT CustomerGrade 
										FROM Customer 
										WHERE CustomerCity = 'Dallas'
									)

-- (57) Write a SQL query to find the average price of each manufacturer's products along with their name.

		SELECT PD.ProductCompanyId, AVG(ProductPrice) AS AVG_PRODUCT_PRICE, PC.ProductCompanyName
		FROM Product PD
		INNER JOIN ProductCompany PC ON PD.ProductCompanyId = PC.ProductCompanyId
		GROUP BY PD.ProductCompanyId, PC.ProductCompanyName

-- (58) Write a SQL query to display the average price of the products which is more than or equal to 350 along with their names.

		SELECT PD.ProductCompanyId, AVG(ProductPrice) AS AVG_PRODUCT_PRICE, PC.ProductCompanyName
		FROM Product PD
		INNER JOIN ProductCompany PC ON PD.ProductCompanyId = PC.ProductCompanyId
		GROUP BY PD.ProductCompanyId, PC.ProductCompanyName
		HAVING AVG(ProductPrice)>=350

-- (59) Write a SQL query to display the name of each company, price for their most expensive product along with their Name.

		
		SELECT PD.ProductCompanyId, MAX(ProductPrice) AS MAX_PRODUCT_PRICE, PC.ProductCompanyName 
		FROM Product PD
		INNER JOIN ProductCompany PC ON PD.ProductCompanyId = PC.ProductCompanyId
		GROUP BY PD.ProductCompanyId, PC.ProductCompanyName
		
