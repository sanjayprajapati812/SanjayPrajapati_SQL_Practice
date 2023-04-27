CREATE TABLE customers (
  customer_id INT PRIMARY KEY identity(1,1),
  customer_name VARCHAR(255),
  customer_email VARCHAR(255),
  customer_mobile VARCHAR(20),
  customer_city VARCHAR(255),
);
use SP353SanjayPrajapati
CREATE TABLE products (
  product_id INT PRIMARY KEY identity(1,1),
  product_name VARCHAR(255),
  product_description TEXT,
  product_price DECIMAL(10,2),
);

create TABLE orders (
  order_id INT PRIMARY KEY identity(1,1),
  order_date DATE,
  order_amount DECIMAL(10,2),
  order_quantity INT,
  customer_id INT,
  product_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
);

CREATE TABLE payments(
	payment_id int primary key identity(1,1),
	payment_amount decimal(10,2),
	customer_id INT,
	foreign key (customer_id) references customers(customer_id)
)

insert into payments(
	payment_amount,
	customer_id
)
values
	(1900.00,5),(2000.00,6),(2500.64,7),(1000.76,8),(2100.73,9),(1900.00,13),(200.00,10),(250.64,13),(1000.76,14),(210.73,15),(800.83,18),(1020.63,19),(200.73,1),(800.87,5),(640.90,16);

INSERT INTO customers (customer_name, customer_email, customer_mobile, customer_city)
VALUES
  ('John Doe', 'john.doe@example.com', '555-1234', 'New York'),
  ('Jane Smith', 'jane.smith@example.com', '555-5678', 'Los Angeles'),
  ('Bob Johnson', 'bob.johnson@example.com', '555-9012', 'Chicago'),
  ('Samantha Lee', 'samantha.lee@example.com', '555-3456', 'San Francisco'),
  ('Peter Thompson', 'peter.thompson@example.com', '555-7890', 'Miami'),
  ('Emily Davis', 'emily.davis@example.com', '555-2345', 'Houston'),
  ('Michael Brown', 'michael.brown@example.com', '555-6789', 'Philadelphia'),
  ('Amanda Wilson', 'amanda.wilson@example.com', '555-0123', 'Phoenix'),
  ('David Garcia', 'david.garcia@example.com', '555-4567', 'San Diego'),
  ('Melissa Martin', 'melissa.martin@example.com', '555-8901', 'Dallas'),
  ('Erica Rodriguez', 'erica.rodriguez@example.com', '555-2345', 'Austin'),
  ('William Taylor', 'william.taylor@example.com', '555-6789', 'Seattle'),
  ('Stephanie Hernandez', 'stephanie.hernandez@example.com', '555-0123', 'Denver'),
  ('Andrew Martinez', 'andrew.martinez@example.com', '555-4567', 'Portland'),
  ('Lauren Brown', 'lauren.brown@example.com', '555-8901', 'Boston'),
  ('Christopher Jones', 'christopher.jones@example.com', '555-2345', 'Washington'),
  ('Ashley Wilson', 'ashley.wilson@example.com', '555-6789', 'Atlanta'),
  ('Nicholas Davis', 'nicholas.davis@example.com', '555-0123', 'San Antonio'),
  ('Rachel Anderson', 'rachel.anderson@example.com', '555-4567', 'Las Vegas'),
  ('Matthew Thomas', 'matthew.thomas@example.com', '555-8901', 'New Orleans');

INSERT INTO products (product_name, product_description, product_price)
VALUES
  ('Apple iPhone 13', 'The latest iPhone with a new A15 Bionic chip, improved cameras, and longer battery life.', 999.99),
  ('Samsung Galaxy S21', 'A flagship Android phone with a 120Hz display, 5G connectivity, and powerful Exynos processor.', 899.99),
  ('Sony PlayStation 5', 'The newest console from Sony with 4K gaming, ray tracing, and lightning-fast load times.', 499.99),
  ('Microsoft Xbox Series X', 'A powerful console with 4K gaming, 120Hz refresh rate, and backwards compatibility.', 499.99),
  ('Bose QuietComfort 35 II', 'Wireless noise-cancelling headphones with Alexa voice control and 20 hours of battery life.', 299.99),
  ('Apple AirPods Pro', 'Wireless earbuds with active noise cancellation, transparency mode, and adaptive EQ.', 249.99),
  ('Samsung 65" QLED 4K TV', 'A 65-inch TV with quantum dot technology, HDR10+, and smart TV capabilities.', 1499.99),
  ('LG OLED 55" 4K TV', 'A 55-inch TV with self-lit pixels, Dolby Vision IQ, and Filmmaker Mode.', 1499.99),
  ('Dyson V15 Detect', 'A cordless vacuum with laser technology that detects microscopic dust particles.', 699.99),
  ('iRobot Roomba i7+', 'A robot vacuum with self-emptying base, smart mapping, and voice control.', 999.99),
  ('GoPro HERO10 Black', 'A 5.3K action camera with HyperSmooth 4.0, TimeWarp 3.0, and 20MP photos.', 499.99),
  ('Canon EOS R5', 'A full-frame mirrorless camera with 8K video, 45MP resolution, and Dual Pixel CMOS AF II.', 3899.99),
  ('Fitbit Charge 5', 'A fitness tracker with built-in GPS, SpO2 sensor, and up to 7 days of battery life.', 179.99),
  ('Peloton Bike+', 'An indoor exercise bike with a 24" HD touchscreen, live and on-demand classes, and automatic resistance control.', 2495.00),
  ('Nespresso Vertuo Next', 'A single-serve coffee maker with 5 cup sizes and Bluetooth connectivity.', 199.99),
  ('Vitamix Ascent A3500', 'A high-performance blender with touch screen controls, variable speed control, and wireless connectivity.', 599.99),
  ('Le Creuset Dutch Oven', 'A classic cast iron Dutch oven with a colorful enamel finish and heat-resistant knob.', 389.99),
  ('All-Clad Stainless Steel Cookware Set', 'A 10-piece set of stainless steel cookware with tri-ply construction and dishwasher-safe.', 699.99),
  ('Herschel Supply Co. Little America Backpack', 'A classic backpack with a 15" laptop sleeve, front pocket with hidden zipper, and signature striped lining.', 99.99),
  ('Lululemon Align Leggings', 'High-waisted leggings made with buttery soft Nulu fabric and a minimum of seams for maximum comfort.', 98.00);



INSERT INTO orders (order_date, order_amount, order_quantity, customer_id, product_id)
VALUES
    ('2022-01-01', 100.00, 1, 1, 1),
    ('2022-01-01', 200.00, 2, 12, 3),
    ('2022-01-02', 50.00, 1, 13, 3),
    ('2022-01-02', 75.00, 3, 4, 4),
    ('2022-01-03', 300.00, 2, 5, 5),
    ('2022-01-03', 150.00, 1, 6, 18),
    ('2022-01-04', 25.00, 1, 7, 16),
    ('2022-01-04', 1000.00, 5, 8, 14),
    ('2022-01-05', 450.00, 3, 9, 13),
    ('2022-01-05', 175.00, 2, 10, 6),
    ('2022-01-06', 80.00, 1, 11, 16),
    ('2022-01-06', 200.00, 2, 2, 8),
    ('2022-01-07', 120.00, 1, 13, 4),
    ('2022-01-07', 300.00, 3, 4, 12),
    ('2022-01-08', 60.00, 1, 15, 9),
    ('2022-01-08', 100.00, 2, 6, 8),
    ('2022-01-09', 175.00, 2, 17, 6),
    ('2022-01-09', 250.00, 1, 18, 5),
    ('2022-01-10', 90.00, 1, 19, 3),
    ('2022-01-10', 150.00, 2, 6, 2);

	ALTER TABLE ORDERS
	DROP COLUMN order_amount

	
-- 1.Create a stored procedure called "get_customers" that returns all customers from the "customers" table.

		CREATE PROCEDURE get_customers
		AS
		BEGIN
			SELECT * 
			FROM customers;
		END;

		EXEC get_customers

-- 2.Create a stored procedure called "get_orders" that returns all orders from the "orders" table.

		CREATE PROCEDURE get_orders
		AS
		BEGIN
			SELECT * 
			FROM customers;
		END;

		EXEC get_orders


-- 3.Create a stored procedure called "get_order_details" that accepts an order ID as a parameter and returns the details of that order (i.e., the products and quantities).

		CREATE PROCEDURE get_order_details
		(
			@input_order_id INT
		)
	
		AS
		BEGIN
				SELECT * 
				FROM Orders 
				WHERE order_id = @input_order_id
		END;

		EXEC get_order_details @input_order_id = 7
				

-- 4.Create a stored procedure called "get_customer_orders" that accepts a customer ID as a parameter and returns all orders for that customer.

		CREATE PROCEDURE get_customer_orders
		(
			@input_customer_id INT
		)
	
		AS
		BEGIN
				SELECT * 
				FROM customers 
				WHERE customer_id = @input_customer_id
		END;

		EXEC get_customer_orders @input_customer_id = 5

-- 5.Create a stored procedure called "get_order_total" that accepts an order ID as a parameter and returns the total amount of the order.

		CREATE PROCEDURE get_order_total
		(
			@input_order_id INT
		)
	
		AS
		BEGIN
				SELECT O.order_quantity*P.product_price AS TOTAL_ORDER_AMOUNT 
				FROM Orders O
				INNER JOIN products P ON P.product_id = O.product_id
				WHERE order_id = @input_order_id
		END;

		EXEC get_order_total @input_order_id = 5

-- 6.Create a stored procedure called "get_product_list" that returns a list of all products from the "products" table.

		CREATE PROCEDURE get_product_list
		
		AS
		BEGIN
				SELECT * 
				FROM products
		END;

		EXEC get_product_list

-- 7.Create a stored procedure called "get_product_info" that accepts a product ID as a parameter and returns the details of that product.

		CREATE PROCEDURE get_product_info
		(
				@input_product_id int
		)
		AS
		BEGIN
				SELECT * 
				FROM products 
				WHERE product_id = @input_product_id
		END;

		EXEC get_product_info @input_product_id = 3


-- 8.Create a stored procedure called "get_customer_info" that accepts a customer ID as a parameter and returns the details of that customer.


		CREATE PROCEDURE get_customer_info
		(
				@input_customer_id INT
		)
		AS
		BEGIN
				SELECT * 
				FROM customers 
				WHERE customer_id = @input_customer_id
		END;

		EXEC get_customer_info @input_customer_id = 3
		
-- 9.Create a stored procedure called "update_customer_info" that accepts a customer ID and new information as parameters and updates the customer's information in the "customers" table.

		CREATE PROCEDURE update_customer_info
		(
				@customer_id int,
				@customer_name VARCHAR(255),
				@customer_email VARCHAR(255),
				@customer_mobile VARCHAR(20),
				@customer_city VARCHAR(255)
		)
		AS
		BEGIN
			UPDATE customers
			SET 
				customer_name = @customer_name,
				customer_email = @customer_email,
				customer_mobile = customer_mobile,
				customer_city = @customer_city
			WHERE customer_id = @customer_id
		END


		BEGIN TRAN 
		
			EXEC update_customer_info 1,'SANJAY','SVPRAJ@GAMIL.COM','849088089','MEHSANA'
		
		COMMIT TRAN
		ROLLBACK TRAN
		

		

-- 10.Create a stored procedure called "delete_customer" that accepts a customer ID as a parameter and deletes that customer from the "customers" table.

		CREATE PROCEDURE delete_customer
		(
				@customer_id int
		)
		AS
		BEGIN
			DELETE FROM customers
			WHERE customer_id = @customer_id
		END


		BEGIN TRAN 

		EXEC delete_customer 20

		COMMIT TRAN
		ROLLBACK TRAN
		
-- 11.Create a stored procedure called "get_order_count" that accepts a customer ID as a parameter and returns the number of orders for that customer.

		CREATE PROCEDURE get_order_count
		(
				@customer_id INT
		)
		AS
		BEGIN

				SELECT COUNT(*) AS ORDER_COUNT FROM Orders O
				INNER JOIN customers C ON O.customer_id = C.customer_id
				WHERE O.customer_id = @customer_id
		END

		EXEC get_order_count 6

-- 12.Create a stored procedure called "get_customer_balance" that accepts a customer ID as a parameter and returns the customer's balance (i.e., the total amount of all orders minus the total amount of all payments).

		CREATE PROCEDURE get_customer_balance
		(
			@customer_id INT
		)
		AS
		BEGIN

				DECLARE @total_amount_payment int = (select sum(payment_amount) 
				from payments 
				where customer_id = @customer_id)

				SELECT sum(O.order_quantity*PD.product_price) - @total_amount_payment AS CUSTOMER_BALANCE 
				FROM Orders O
				INNER JOIN customers C ON O.customer_id =C.customer_id
				INNER JOIN products PD ON O.product_id = PD.product_id
				WHERE C.customer_id = @customer_id
		END

		EXEC get_customer_balance 8


-- 13.Create a stored procedure called "get_customer_payments" that accepts a customer ID as a parameter and returns all payments made by that customer.

		CREATE PROCEDURE get_customer_payments
		(
			@customer_id INT
		)
		AS
		BEGIN

				SELECT P.payment_id,P.payment_amount, C.customer_id, C.customer_name 
				FROM payments P
				INNER JOIN customers C ON P.customer_id =C.customer_id
				WHERE P.customer_id = @customer_id
		END

		EXEC get_customer_payments 9
		
-- 14.Create a stored procedure called "add_customer" that accepts a name and address as parameters and adds a new customer to the "customers" table.

		CREATE PROCEDURE add_customer
		(
			@customer_name VARCHAR(100),
			@customer_city VARCHAR(255)
		)
		
		AS
		BEGIN
				INSERT INTO customers(customer_name,customer_city)
				VALUES (
					@customer_name,
					@customer_city
				)
		END

		EXEC add_customer 'PRAJAPATI SANJAY','AHMEDABAD'
		
-- 15.Create a stored procedure called "get_top_products" that returns the top 10 products based on sales volume.

		CREATE PROCEDURE get_top_products
		
		AS
		BEGIN
				SELECT TOP 10 P.product_id,P.product_name , SUM(O.order_quantity) AS SALES_VOLUME 
				FROM products P
				INNER JOIN Orders O ON O.product_id= P.product_id
				GROUP BY P.product_id,P.product_name
				ORDER BY SALES_VOLUME DESC
		END

		EXEC get_top_products


-- 16.Create a stored procedure called "get_product_sales" that accepts a product ID as a parameter and returns the total sales volume for that product.

		CREATE PROCEDURE get_product_sales
		(
				@product_id INT
		)
		AS
		BEGIN
				SELECT SUM(O.order_quantity) AS SALES_VOLUME 
				FROM products P
				INNER JOIN Orders O ON O.product_id= P.product_id
				WHERE P.product_id = @product_id
		END

		EXEC get_product_sales 2


-- 17.Create a stored procedure called "get_customer_orders_by_date" that accepts a customer ID and date range as parameters and returns all orders for that customer within the specified date range.

		CREATE PROCEDURE get_customer_orders_by_date
		(
				@customer_id INT,
				@date_1 DATE,
				@date_2 DATE
		)

		AS
		BEGIN
				SELECT * 
				FROM Orders O
				INNER JOIN customers C ON C.customer_id =O.customer_id
				WHERE C.customer_id = @customer_id AND O.order_date BETWEEN @date_1 AND @date_2
		END


		EXEC get_customer_orders_by_date 1,'2017-01-01','2023-01-01'

				
-- 18.Create a stored procedure called "get_order_details_by_date" that accepts an order ID and date range as parameters and returns the details of that order within the specified date range.

		CREATE PROCEDURE get_order_details_by_date
		(
				@order_id INT,
				@date_1 DATE,
				@date_2 DATE
		)

		AS
		BEGIN
				SELECT * 
				FROM Orders O
				INNER JOIN customers C ON C.customer_id =O.customer_id
				WHERE O.order_id = @order_id AND O.order_date BETWEEN @date_1 AND @date_2
		END


		EXEC get_order_details_by_date 1,'2017-01-01','2023-01-01'


-- 19.Create a stored procedure called "get_product_sales_by_date" that accepts a product ID and date range as parameters and returns the total sales volume for that product within the specified date range.

		CREATE PROCEDURE get_product_sales_by_date
		(
				@product_id INT,
				@date_1 DATE,
				@date_2 DATE
		)
		AS
		BEGIN
				SELECT SUM(O.order_quantity) AS SALES_VOLUME 
				FROM products P
				INNER JOIN Orders O ON O.product_id= P.product_id
				WHERE P.product_id = @product_id AND O.order_date BETWEEN @date_1 AND @date_2 
		END

		EXEC get_product_sales_by_date 8,'2017-01-01','2023-01-01'


-- 20.Create a stored procedure called "get_customer_balance_by_date" that accepts a customer ID and date range as parameters and returns the customer's balance within the specified date range.

		CREATE PROCEDURE get_customer_balance_by_date
		(
				@customer_id INT,
				@date_1 DATE,
				@date_2 DATE
		)
		AS
		BEGIN

				DECLARE @total_amount_payment INT = (SELECT SUM(payment_amount) 
				FROM payments 
				WHERE customer_id = @customer_id)

				SELECT sum(O.order_quantity*PD.product_price) - @total_amount_payment AS CUSTOMER_BALANCE 
				FROM Orders O
				INNER JOIN customers C ON O.customer_id =C.customer_id
				INNER JOIN products PD ON O.product_id = PD.product_id
				WHERE C.customer_id = @customer_id AND O.order_date BETWEEN @date_1 AND @date_2 
		END

		EXEC get_product_sales_by_date 8,'2017-01-01','2023-01-01'


-- 21.Create a stored procedure called "add_order" that accepts a customer ID, order date, and total amount as parameters and adds a new order to the "orders" table.

		CREATE PROCEDURE add_order
		(
			@customer_id INT,
			@product_id INT,
			@order_date DATE,
			@order_quantity INT
		)
		
		AS
		BEGIN
				INSERT INTO Orders(
					customer_id,
					product_id,
					order_date,
					order_quantity
					)
				VALUES (
					@customer_id,
					@product_id,
					@order_date,
					@order_quantity
				)
		END

		EXEC add_order 10,11 ,'2023-03-20',1
-- 22.Create a stored procedure called "update_order_total" that accepts an order ID and a new total amount as parameters and updates the total amount of the order in the "orders" table.

		CREATE PROCEDURE update_order_total
		(
				@order_id INT,
				@total_quantity int
		)
		
		AS
		BEGIN
				UPDATE Orders SET order_quantity = @total_quantity 
				WHERE order_id = @order_id
		END

		BEGIN TRAN 
		
				EXEC update_order_total 2,3
		
		COMMIT TRAN
		ROLLBACK TRAN

		
-- 23.Create a stored procedure called "delete_order" that accepts an order ID as a parameter and deletes that order from the "orders" table.

		CREATE PROCEDURE delete_order
		(
				@order_id INT
		)
		AS
		BEGIN
				DELETE FROM Orders 
				WHERE order_id = @order_id
		END


		EXEC delete_order 20
