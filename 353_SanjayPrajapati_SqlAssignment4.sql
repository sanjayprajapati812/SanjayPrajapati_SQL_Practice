

USE SP353SanjayPrajapati


CREATE TABLE SPEmployees(
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(250),
	LastName VARCHAR(250),
	Title VARCHAR(256),
	BirthDate DATE,
	HireDate DATE,
	ReportsTo INT,
	Address NVARCHAR(MAX)
)

CREATE TABLE SPCustomers(
	CustomerID INT PRIMARY KEY IDENTITY(1,1),
	CompanyName VARCHAR(250),
	ContactName VARCHAR(250),
	ContactTitle VARCHAR(250),
	Address NVARCHAR(MAX),
	City VARCHAR(150),
	Country VARCHAR(150)
)

CREATE TABLE SPOrders(
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT FOREIGN KEY REFERENCES SPCustomers(CustomerID),
	EmployeeID INT FOREIGN KEY REFERENCES SPEmployees(EmployeeID),
	OrderDate DATE
)

INSERT INTO SPEmployees (FirstName, LastName, Title, BirthDate, HireDate, ReportsTo, Address)
VALUES
('John', 'Doe', 'Manager', '1980-01-01', '2000-01-01', NULL, '123 Main St'),
('Jane', 'Smith', 'Assistant Manager', '1985-05-05', '2010-01-01', 1, '456 Elm St'),
('Bob', 'Johnson', 'Supervisor', '1975-12-31', '1995-01-01', 1, '789 Oak St'),
('Sarah', 'Williams', 'Sales Associate', '1990-03-15', '2015-01-01', 2, '10 Maple Ave'),
('Mike', 'Brown', 'Sales Associate', '1992-07-22', '2017-01-01', 2, '20 Pine St'),
('Karen', 'Jones', 'Customer Service Representative', '1995-11-10', '2018-01-01', 3, '30 Cedar Rd'),
('Chris', 'Lee', 'Customer Service Representative', '1993-02-28', '2016-01-01', 3, '40 Walnut Ln'),
('Lisa', 'Taylor', 'IT Specialist', '1988-06-14', '2012-01-01', 1, '50 Birch St'),
('David', 'Miller', 'Software Developer', '1991-09-30', '2017-01-01', 8, '60 Oak St'),
('Amy', 'Wilson', 'Marketing Manager', '1982-04-20', '2005-01-01', 1, '70 Elm St'),
('Mark', 'Garcia', 'Graphic Designer', '1993-12-15', '2019-01-01', 10, '80 Maple Ave'),
('Emily', 'Anderson', 'HR Coordinator', '1995-08-03', '2018-01-01', 1, '90 Pine St'),
('Alex', 'Davis', 'Accountant', '1987-11-01', '2012-01-01', 1, '100 Cedar Rd'),
('Laura', 'Clark', 'Office Manager', '1980-02-15', '2005-01-01', NULL, '110 Walnut Ln'),
('Kevin', 'Wright', 'Sales Manager', '1978-07-30', '2000-01-01', 1, '120 Birch St'),
('Olivia', 'Thomas', 'Marketing Coordinator', '1996-01-10', '2020-01-01', 11, '130 Oak St'),
('Jacob', 'White', 'IT Manager', '1984-05-18', '2010-01-01', 1, '140 Elm St'),
('Megan', 'Scott', 'Software Engineer', '1992-09-22', '2016-01-01', 8, '150 Maple Ave'),
('Ryan', 'Hall', 'Customer Service Manager', '1989-03-05', '2015-01-01', 3, '160 Pine St'),
('Jessica', 'Adams', 'Sales Representative', '1991-06-11', '2017-01-01', 15, '170 Cedar Rd');

INSERT INTO SPCustomers (CompanyName, ContactName, ContactTitle, Address, City, Country)
VALUES 
('ABC Inc.', 'John Smith', 'CEO', '123 Main St.', 'Los Angeles', 'USA'),
('XYZ Corporation', 'Emily Johnson', 'Marketing Director', '456 Market St.', 'MUMBAI', 'INDIA'),
('Acme Ltd.', 'Michael Lee', 'Sales Manager', '789 5th Ave.', 'Chicago', 'USA'),
('Green Energy Solutions', 'Samantha Chen', 'Operations Manager', '987 Pine St.', 'San Francisco', 'USA'),
('Innovative Products', 'Robert Kim', 'Product Manager', '2468 Oak St.', 'Toronto', 'Canada'),
('Global Enterprises', 'Julia Garcia', 'Chief Financial Officer', '555 Broadway', 'SHANGAI', 'CHAINA'),
('Peak Performance', 'David Brown', 'Operations Director', '777 8th Ave.', 'Houston', 'USA'),
('Premier Solutions', 'Sarah Johnson', 'Sales Director', '3333 Market St.', 'Philadelphia', 'RASHIA'),
('Tech Innovations', 'Mark Wilson', 'Chief Technology Officer', '111 Silicon Valley', 'San Jose', 'USA'),
('Sunrise Industries', 'Jenny Park', 'Human Resources Manager', '222 Sunrise Blvd.', 'Vancouver', 'Canada'),
('Dynamic Enterprises', 'Daniel Wong', 'Marketing Manager', '9999 Business St.', 'Boston', 'JAPAN'),
('Innovative Solutions', 'Susan Lee', 'IT Director', '1234 IT Ave.', 'Seattle', 'USA'),
('Globe Products', 'John Doe', 'Chief Executive Officer', '3333 Market St.', 'Washington DC', 'USA'),
('Peak Industries', 'Tom Lee', 'Operations Manager', '777 8th Ave.', 'Dallas', 'USA'),
('Digital Innovations', 'Lisa Kim', 'Product Director', '2468 Oak St.', 'Montreal', 'Canada'),
('Global Solutions', 'Elena Rodriguez', 'Chief Operating Officer', '555 Broadway', 'Austin', 'JAPAN'),
('Quality Enterprises', 'Paul Thompson', 'Sales Manager', '789 5th Ave.', 'Detroit', 'USA'),
('Solutions Plus', 'Anna Chen', 'Marketing Director', '987 Pine St.', 'San Diego', 'USA'),
('Sunset Enterprises', 'Benjamin Garcia', 'Operations Director', '123 Main St.', 'Phoenix', 'ENGLAND'),
('Tech Solutions', 'Michelle Lee', 'IT Manager', '456 Market St.', 'Newark', 'ENGLAND');


INSERT INTO SPOrders (CustomerID, EmployeeID, OrderDate)
VALUES 
(1, 3, '2022-01-15'),
(12, 2, '2022-02-10'),
(19, 15, '2022-03-20'),
(13, 15, '2022-04-05'),
(4, 4, '2022-05-12'),
(12, 13, '2022-06-22'),
(5, 2, '2022-07-30'),
(3, 11, '2022-08-08'),
(11, 4, '2022-09-17'),
(4, 15, '2022-10-25'),
(17, 1, '2022-11-15'),
(5, 14, '2022-12-31'),
(3, 12, '2023-01-08'),
(18, 5, '2023-02-18'),
(16, 3, '2023-03-06'),
(2, 14, '2023-04-12'),
(15, 1, '2023-05-20'),
(3, 5, '2023-06-30'),
(11, 2, '2023-07-08'),
(4, 17, '2023-08-16');


--TRUNCATE TABLE SPCustomers

-- (1) Write a SQL query to retrieve the list of all orders made by customers in the "USA".

		SELECT O.OrderID,O.OrderDate,O.CustomerID, C.ContactName AS CUSTOMER_NAME, C.Country AS CUSTOMER_COUNTRY
		FROM SPOrders O
		INNER JOIN SPCustomers C ON O.CustomerID = C.CustomerID
		WHERE C.Country='USA'

-- (2) Write a SQL query to retrieve the list of all customers who have placed an order.

		SELECT DISTINCT  C.CustomerID, C.CompanyName , C.ContactTitle, C.ContactName, C.Address, C.City, C.Country 
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID

-- (3) Write a SQL query to retrieve the list of all employees who have not yet placed an order.
		SELECT * FROM SPEmployees
		WHERE EmployeeID 
		NOT IN(
				SELECT DISTINCT O.EmployeeID
				FROM SPOrders O
				INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID
				)
		

-- (4) Write a SQL query to retrieve the list of all employees who have placed an order.

		SELECT DISTINCT E.EmployeeID, E.FirstName+''+E.LastName AS EMP_NAME, E.Title AS EMP_TITLE, E.BirthDate AS EMP_BIRTH_DATE
		FROM SPOrders O
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID

-- (5) Write a SQL query to retrieve the list of all customers who have not yet placed an order.

		SELECT * 
		FROM SPCustomers
		WHERE CustomerID 
		NOT IN(
				SELECT DISTINCT  C.CustomerID
				FROM SPOrders O
				INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
				)

-- (6) Write a SQL query to retrieve the list of all customers who have placed an order, along with the order date.

		SELECT O.OrderID,C.CustomerID, C.CompanyName, O.OrderDate
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		ORDER BY C.CustomerID ASC

-- (7) Write a SQL query to retrieve the list of all orders placed by a particular customer.

		SELECT O.OrderID, O.CustomerID, C.CompanyName ,C.ContactName AS CUSTOMER_NAME
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		WHERE C.CustomerID = 3


-- (8) Write a SQL query to retrieve the list of all orders placed by a particular employee.

		SELECT O.OrderID, O.CustomerID,  O.OrderDate,O.EmployeeID, E.FirstName+' '+E.LastName AS EMP_NAME
		FROM SPOrders O
		INNER JOIN SPEmployees E  ON O.EmployeeID = E.EmployeeID
		WHERE E.EmployeeID = 3

-- (9) Write a SQL query to retrieve the list of all orders placed by a particular customer on a particular date.

		SELECT O.CustomerID, O.OrderID, O.EmployeeID, C.CompanyName, O.OrderDate
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		WHERE C.CustomerID = 3 AND O.OrderDate='2022-08-08'

-- (10) Write a SQL query to retrieve the list of all customers who have not yet placed an order, sorted by their country.

		SELECT * 
		FROM SPCustomers
		WHERE CustomerID 
		NOT IN(
				SELECT DISTINCT  C.CustomerID
				FROM SPOrders O
				INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
				)
		ORDER BY Country ASC

-- (11) Write a SQL query to retrieve the list of all orders placed by customers in the "USA", sorted by order date.

		SELECT O.OrderID,O.EmployeeID,O.CustomerID, O.OrderDate,C.ContactName, C.Country 
		FROM SPOrders O
		INNER JOIN SPCustomers C ON O.CustomerID = C.CustomerID
		WHERE C.Country='USA'
		ORDER BY O.OrderDate ASC

-- (12) Write a SQL query to retrieve the list of all employees who have not yet placed an order, sorted by last name.

		SELECT * FROM SPEmployees
		WHERE EmployeeID 
		NOT IN(
				SELECT DISTINCT O.EmployeeID
				FROM SPOrders O
				INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID
				)
		ORDER BY LastName

-- (13) Write a SQL query to retrieve the list of all customers who have placed an order, sorted by their company name.

		SELECT DISTINCT  C.CustomerID, C.CompanyName , C.ContactTitle, C.ContactName, C.Address, C.City, C.Country 
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		ORDER BY C.CompanyName
 
-- (14) Write a SQL query to retrieve the list of all employees who have placed an order, sorted by their hire date.
		
		SELECT DISTINCT E.EmployeeID, E.FirstName+' '+ E.LastName AS EMP_NAME, E.HireDate AS EMP_HIRE_DATE
		FROM SPOrders O
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID
		ORDER BY E.HireDate

-- (15) Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, sorted by their company name.

		SELECT O.CustomerID, O.OrderID, C.CompanyName, O.OrderDate
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		WHERE O.OrderDate='2022-08-08'
		ORDER BY C.CompanyName
		
-- (16) Write a SQL query to retrieve the list of all customers who have placed an order, along with the employee who handled the order.

		SELECT C.CustomerID, C.ContactName AS CUSTOMER_NAME, E.EmployeeID, E.FirstName+' '+E.LastName AS EMP_NAME
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID
 
-- (17) Write a SQL query to retrieve the list of all employees who have placed an order, along with the customer who placed the order.

		SELECT E.EmployeeID, E.FirstName+' '+E.LastName AS EMP_NAME, C.CustomerID, C.ContactName AS CUSTOMER_NAME
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID

-- (18) Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date.

		SELECT O.OrderID, O.OrderDate,C.CustomerID,C.ContactName AS CUSTOMER_NAME,C.Country AS CUSTOMER_COUNTRY
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		WHERE C.Country = 'USA'

-- (19) Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular year, along with the employee name and order date.
		
		SELECT O.OrderID, O.OrderDate , E.FirstName+' '+E.LastName AS EMP_NAME ,E.BirthDate
		FROM SPEmployees E
		RIGHT JOIN SPOrders O ON O.EmployeeID = E.EmployeeID
		WHERE YEAR(E.BirthDate) = 1995
		
-- (20) Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order.

		SELECT O.OrderID, O.OrderDate,C.CustomerID, C.ContactName AS CUSTOMER_NAME, E.EmployeeID, E.FirstName +' '+E.LastName AS EMP_NAME
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID

-- (21) Write a SQL query to retrieve the list of all orders placed by customers who have a particular contact title, along with the customer name and order date.

		SELECT O.OrderID, O.OrderDate,C.CustomerID,C.ContactName AS CUSTOMER_NAME,C.ContactTitle
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		WHERE C.ContactTitle='Marketing Director'

-- (22) Write a SQL query to retrieve the list of all orders placed by employees who have a particular job title, along with the employee name and order date.

		SELECT O.OrderID, O.OrderDate,E.EmployeeID, E.FirstName+' '+E.LastName AS EMP_NAME, E.Title AS EMP_TITLE
		FROM SPOrders O
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID 
		WHERE E.Title = 'Sales Associate'

-- (23) Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, along with the customer name, order date, and employee who handled the order.
		
		SELECT O.OrderID, O.OrderDate,C.CustomerID, C.ContactName AS CUSTOMER_NAME, E.EmployeeID, E.FirstName+' '+E.LastName AS EMP_NAME
		FROM SPOrders O
		RIGHT JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID
		WHERE O.OrderDate = '2022-05-12'


-- (24) Write a SQL query to retrieve the list of all orders placed by customers in a particular city, along with the customer name and order date.

		SELECT O.OrderID, O.OrderDate,C.CustomerID,C.ContactName AS CUSTOMER_NAME,C.City AS CUSTOMER_CITY
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		WHERE C.City='San Francisco'

-- (25) Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular city, along with the employee name and order date.

		SELECT O.OrderID, O.OrderDate,E.EmployeeID,E.FirstName+' '+E.LastName AS EMP_NAME,E.Address
		FROM SPOrders O
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID 
		WHERE E.Address = '110 Walnut Ln'

-- (26) Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order, sorted by order date.
		
		SELECT O.OrderID, O.OrderDate,C.CustomerID,C.ContactName AS CUSTOMER_NAME,E.EmployeeID,E.FirstName+' '+E.LastName AS EMP_NAME
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		INNER JOIN SPEmployees E ON O.EmployeeID = E.EmployeeID
		ORDER BY OrderDate

-- (27) Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date, sorted by order date.

		SELECT O.OrderID, O.OrderDate,C.CustomerID,C.ContactName AS CUSTOMER_NAME,C.Country AS CUSTOMER_COUNTRY
		FROM SPOrders O
		INNER JOIN SPCustomers C  ON O.CustomerID = C.CustomerID
		WHERE C.Country = 'USA'
		ORDER BY OrderDate