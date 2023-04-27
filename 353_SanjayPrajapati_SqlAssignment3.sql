
create table Employees(
	employee_id int primary key identity(1,1), 
	employee_name varchar(250), 
	department varchar(250),
	salary decimal, 
	hire_date date
)
	
insert into Employees (employee_name, department, salary, hire_date) 
values 
	('SANJAY', 'Automotive', 60000.90, '2022/03/29'),
	('RAHUL', 'Health', 50000.00, '2021/03/21'),
	('TILAK', 'Shoes', 59000.89, '2022/12/30'),
	('MEHUL', 'Computers', 51238.03, '2021/12/17'),
	('Far Stride', 'Computers', 30841.46, '2022/12/15'),
	('Steffen Maroney', 'Books', 33460.7, '2022/11/06'),
	('Adrien Mowling', 'Movies', 25875.45, '2022/11/09'),
	('Perle McAlees', 'Jewelry', 16658.79, '2021/09/17'),
	('Maible Geere', 'Home', 16445.43, '2022/09/12'),
	('Ursola Meehan', 'Tools', 19753.07, '2022/06/26'),
	('Clarissa Aumerle', 'Automotive', 21837.5, '2022/06/18'),
	('Joceline Haskett', 'Music', 14523.99, '2021/05/17'),
	('Andi Kilbride', 'Toys', 18944.07, '2022/01/13'),
	('Kele Kaesmakers', 'Games', 21538.22, '2022/07/17'),
	('Oran Anniwell', 'Games', 28697.28, '2022/05/28'),
	('Deloria Dyott', 'Kids', 30761.7, '2021/12/27'),
	('Rosabelle McCray', 'Home', 12244.25, '2023/03/11'),
	('Raquel Derle', 'Outdoors', 15125.31, '2022/03/04'),
	('Concettina Dumbrall', 'Beauty', 27814.97, '2022/03/11'),
	('Philippine Godfree', 'Music', 22889.07, '2021/05/29'),
	('Sindee Bowdler', 'Automotive', 19291.81, '2021/09/26'),
	('Adair Durrand', 'Garden', 26929.23, '2022/12/25'),
	('Nerte Hardesty', 'Clothing', 16749.38, '2022/04/19'),
	('Lissa Stollman', 'Beauty', 15300.1, '2021/05/05'),
	('Sutherlan Rebbeck', 'Music', 38078.42, '2022/08/15'),
	('Dasha Worg', 'Music', 28969.72, '2021/08/20'),
	('Anselma Browse', 'Games', 30681.63, '2022/06/28'),
	('Harrie Leve', 'Grocery', 14870.13, '2021/04/06'),
	('Damiano Blei', 'Sports', 38657.14, '2022/03/04'),
	('Gretchen Moffett', 'Health', 13341.32, '2022/04/16'),
	('Brana Peascod', 'Movies', 19947.84, '2022/05/25'),
	('Sidonia Treske', 'Clothing', 16318.4, '2022/12/28'),
	('Konrad Jonah', 'Books', 21513.66, '2021/08/17'),
	('Teressa Togwell', 'Beauty', 10610.26, '2021/09/04'),
	('Graeme Ghiotto', 'Baby', 14800.7, '2023/01/10'),
	('Raynard Giacomuzzi', 'Movies', 21893.42, '2021/04/13'),
	('Micheline Kubat', 'Computers', 19564.51, '2022/03/04'),
	('Ogden Inge', 'Jewelry', 17540.21, '2022/05/28'),
	('Rourke Batchelour', 'Outdoors', 31319.0, '2021/06/04'),
	('Danita Janous', 'Books', 19261.61, '2021/10/19'),
	('Charley Mousby', 'Garden', 14954.6, '2022/08/25'),
	('Malissia Hook', 'Health', 38592.15, '2021/06/23'),
	('Lorinda Blinder', 'Movies', 28743.18, '2022/04/13'),
	('Weston Gratrex', 'Home', 21918.77, '2022/03/01'),
	('Oates Pescott', 'Automotive', 37601.87, '2022/04/19'),
	('Pollyanna Pescott', 'Sports', 27511.69, '2022/08/01'),
	('Madlen Castiglione', 'Grocery', 25106.18, '2022/09/18'),
	('Nalani Kilgour', 'Toys', 39701.2, '2022/02/12'),
	('Marv Schirach', 'Electronics', 20077.16, '2021/11/27'),
	('Flory Issacson', 'Kids', 26148.73, '2022/07/19'),
	('Maureene Issatt', 'Automotive', 10530.56, '2022/03/29'),
	('Willem Muttock', 'Health', 30091.19, '2021/03/21'),
	('Leigh Washtell', 'Shoes', 35409.96, '2022/12/30'),
	('Gwenneth Bumford', 'Computers', 13377.03, '2021/12/17')
	

	--select * from employees
	--where department = 'Computers'


-- (1)How many employees are in the table?
		SELECT COUNT(*) AS TOTAL_EMP FROM Employees


-- (2)What is the highest salary in the table?
		SELECT MAX(salary) AS Max_Salary
		FROM Employees


-- (3)What is the average salary by department?
		SELECT department, AVG(salary) AS AVG_SALARY 
		FROM Employees
		GROUP BY department


-- (4)Who are the top 5 highest paid employees?
		SELECT TOP 5 *
		FROM Employees
		ORDER BY salary DESC

-- (5)How many employees were hired in the last year?

		SELECT COUNT(*) AS LAST_YEAR_HIRED_EMP
		FROM Employees 
		WHERE DATEDIFF(YEAR, hire_date, CURRENT_TIMESTAMP) = 1;

-- (6)How do you select all columns from a table named "employees"?

		SELECT * 
		FROM Employees

-- (7)How do you select only the "employee_id" and "employee_name" columns from a table named "employees"?

		SELECT employee_id, employee_name
		FROM Employees

-- (8)How do you filter records in a table named "employees" to only include those where the "salary" column is greater than or equal to 50000?

		SELECT * 
		FROM Employees 
		WHERE salary>=50000


-- (9)How do you filter records in a table named "employees" to only include those where the "department" column is "Games"?

		SELECT * 
		FROM Employees 
		WHERE department='Games'

-- (10)How do you filter records in a table named "employees" to only include those where the "hire_date" column is between January 1, 2022 and December 31, 2022?

		SELECT COUNT(*)
		FROM Employees 
		WHERE hire_date BETWEEN '2022-01-01' and '2022-12-31';

-- (11)How do you calculate the average salary of all employees in a table named "employees"?

		SELECT AVG(salary) AS AVG_SALARY 
		FROM Employees

-- (12)How do you calculate the total salary of all employees in a table named "employees"?

		SELECT SUM(salary) AS TOT_SALARY 
		FROM Employees 

-- (13)How do you calculate the highest salary in a table named "employees"?

		SELECT MAX(salary) AS MAX_SALARY 
		FROM Employees 

-- (14)How do you calculate the lowest salary in a table named "employees"?

		SELECT MIN(salary) AS MIN_SALARY 
		FROM Employees

-- (15)How do you calculate the number of employees in a table named "employees"?

		SELECT COUNT(*) 
		FROM Employees

-- (16)How do you sort the records in a table named "employees" by the "salary" column in ascending order?

		SELECT * 
		FROM Employees 
		ORDER BY salary ASC

-- (17)How do you sort the records in a table named "employees" by the "salary" column in descending order?

		SELECT * 
		FROM Employees 
		ORDER BY salary DESC

-- (18)How do you count the number of employees in each department in a table named "employees"?

		SELECT department, COUNT(*) AS TOTAL_EMPLOYEES
		FROM Employees 
		GROUP BY department

-- (19)How do you select the first 10 records in a table named "employees"?

		SELECT TOP 10 * 
		FROM Employees

-- (20)how do you select the last 10 records in a table named "employees"?

		SELECT  TOP 10 * 
		FROM Employees 
		ORDER BY employee_id DESC

-- (21)How do you select the top 5 highest paid employees from a table named "employees"?

		SELECT TOP 5 *
		FROM Employees 
		ORDER BY salary DESC

-- (22)How do you select the top 10 highest paid employees from a table named "employees"?

		SELECT TOP 10 *
		FROM Employees 
		ORDER BY salary DESC

-- (23)How do you select the bottom 5 lowest paid employees from a table named "employees"?

		SELECT TOP 5 * 
		FROM Employees 
		ORDER BY salary ASC

-- (24)How do you select the employees who have a salary that is above the average salary in a table named "employees"?

		SELECT * 
		FROM Employees
		WHERE  salary>(SELECT AVG(salary) FROM Employees)

-- (25)How do you select the employees who have a salary that is below the average salary in a table named "employees"?

		SELECT * 
		FROM Employees 
		WHERE  salary<(SELECT AVG(salary) FROM Employees)

-- (26)How do you select the employees who have a salary that is between 40000 and 60000 in a table named "employees"?

		SELECT * 
		FROM Employees 
		WHERE salary BETWEEN 40000 AND 60000


-- (27)How do you calculate the total salary of all employees in each department in a table named "employees"?

		SELECT department, SUM(salary) AS TOTAL_SALARY
		FROM Employees 
		GROUP BY department

-- (28)How do you calculate the average salary of all employees in each department in a table named "employees"?

		SELECT department, AVG(salary) AS AVG_SALARY
		FROM Employees 
		GROUP BY department

-- (29)How do you calculate the highest salary of all employees in each department in a table named "employees"?

		SELECT department, MAX(salary) AS MAX_SALARY
		FROM Employees 
		GROUP BY department

-- (30)How do you calculate the lowest salary of all employees in each department in a table named "employees"?

		SELECT department, MIN(salary)  AS MIN_SALARY
		FROM Employees 
		GROUP BY department

-- (31)How do you select the employees who have been hired in the last year from a table named "employees"?

		SELECT * 
		FROM Employees 
		WHERE DATEDIFF(YEAR, hire_date, CURRENT_TIMESTAMP) = 1;

-- (32)How do you select the employees who have been hired in the last 6 months from a table named "employees"?

		SELECT * 
		FROM Employees 
		WHERE DATEDIFF(MONTH, hire_date, CURRENT_TIMESTAMP) BETWEEN 0 AND 5;

-- (33)How do you select the employees who have been hired in the last 3 months from a table named "employees"?

		SELECT * 
		FROM Employees 
		WHERE DATEDIFF(MONTH, hire_date, CURRENT_TIMESTAMP) BETWEEN 0 AND 2;

-- (34)How do you select the employees who have been hired in the last week from a table named "employees"?

		SELECT * 
		FROM Employees 
		WHERE DATEDIFF(DAY, hire_date, CURRENT_TIMESTAMP) BETWEEN 0 AND 6;

-- (35)How do you select the employees who have a name that starts with the letter "A" in a table named "employees"?

		SELECT * 
		FROM Employees  
		WHERE employee_name LIKE 'A%'

-- (36)How do you select the employees who have a name that ends with the letter "s" in a table named "employees"?

		SELECT * 
		FROM Employees  
		WHERE employee_name LIKE '%s'

