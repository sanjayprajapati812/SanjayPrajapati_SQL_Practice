--creating new database

CREATE DATABASE SP353SanjayPrajapati

--creating table with name SPEmployee

USE SP353SanjayPrajapati

CREATE TABLE SPEmployee (
	SPEmployeeId INT PRIMARY KEY IDENTITY(1,1),
	SPEmployeeFirstName VARCHAR(250) NOT NULL,
	SPEmployeeLastName VARCHAR(250) NOT NULL,
	SPEmployeeEmailId VARCHAR(150) UNIQUE NOT NULL,
	SPEmployeeDepartmentId INT,
	SPEmployeeGender VARCHAR(20),
	SPEmployeeDOB DATE,
	SPEmployeeDOJ DATE,
	SPEmployeeMobileNumber1 VARCHAR(20),
	SPEmployeeMobileNumber2 VARCHAR(20),
	SPEmployeePhotoName VARCHAR(250),
	SPEmployeePhoto VARBINARY(MAX),
	SPEmployeePinCode VARCHAR(6),
	SPEmployeeCityCode VARCHAR(50),
	SPEmployeeStateCode INT,
	SPEmployeeCountryCode INT,
	SPEmployeeCurrentAddress NVARCHAR(MAX),
	SPEmployeePermanentAddress Nvarchar(MAX),
	SPEmployeeSalary DECIMAL(10,2),
	SPEmployeeCode INT,
	SPEmployeeBankAccountNo VARCHAR(256),
	SPEmployeeBankName VARCHAR(256),
	SPEmployeeIfscCode VARCHAR(256),
	SPEmployeePanCardNo varchar(256),
	SPEmployeeResigned VARCHAR(20),
	SPEmployeeManagerId INT,
	SPEmployeeTeamId INT,
	SPEmployeeDescription NVARCHAR(MAX),
	SPEmployeeCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NUll,
	SPEmployeeUpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
)
select * from SPEmployee
ALTER TABLE SPEmployee
ADD SPEmployeeCreatedAt DATETIME(255);
ALTER TABLE SPEmployee
ADD CONSTRAINT hj
DEFAULT CURRENT_TIMESTAMP FOR SPEmployeeUpdatedAt;







--ALTER TABLE STATEMENTS...







ALTER TABLE SPEmployee
DROP COLUMN SPEmployeeDeletedAt;

ALTER TABLE SPEmployee
ADD SPEmployeeAdharNo VARCHAR(256);

EXEC sp_RENAME 'SPEmployee.SPEmployeeResigned', 'SPEmployeeResigned', 'COLUMN'

ALTER TABLE SPEmployee
ALTER COLUMN SPEmployeeMobileNumber1 int NOT NULL;

ALTER TABLE SPEmployee
ADD CONSTRAINT UC_SPEmployee  UNIQUE (SPEmployeeAdharNo);

ALTER TABLE SPEmployee
DROP CONSTRAINT UC_SPEmployee;

--ALTER TABLE SPEmployee
--add  CONSTRAINT df_SPEmployeeUpdatedAt
--DEFAULT CURRENT_TIMESTAMP FOR SPEmployeeUpdatedAt;

CREATE TABLE SPEmployeeDepartment(
	SPEmployeeDepartmentId INT PRIMARY KEY IDENTITY(1,1),
	SPDepartmentName VARCHAR(250) NOT NULL,
	SPDepartmentManagerId INT NOT NULL,
)

drop table SPEmployeeDepartment

ALTER TABLE SPEmployee
ADD FOREIGN KEY (SPEmployeeDepartmentId) REFERENCES SPEmployeeDepartment(SPEmployeeDepartmentId);

CREATE TABLE SPEmployeeManager(
	SPEmployeeManagerId INT PRIMARY KEY IDENTITY(1,1),
	SPEmployeeManagerName VARCHAR(250) NOT NULL,
)

drop table SPEmployeeManager

ALTER TABLE SPEmployee
ADD FOREIGN KEY (SPEmployeeManagerId) REFERENCES SPEmployeeManager(SPEmployeeManagerId);

ALTER TABLE SPEmployeeDepartment
DROP COLUMN SPDepartmentManagerId;

ALTER TABLE SPEmployeeManager
ADD SPEmployeeDepartmentId INT NOT NULL;

ALTER TABLE SPEmployeeManager
ADD FOREIGN KEY (SPEmployeeDepartmentId) REFERENCES SPEmployeeDepartment(SPEmployeeDepartmentId);

CREATE TABLE SPEmployeeTeam(
	SPEmployeeTeamId INT PRIMARY KEY IDENTITY(1,1),
	SPEmployeeTeamLeaderName VARCHAR(250) NOT NULL,
)

ALTER TABLE SPEmployeeTeam
ADD SPEmployeeManagerId INT NOT NULL;

ALTER TABLE SPEmployeeTeam
ADD SPEmployeeDepartmentId INT NOT NULL;

ALTER TABLE SPEmployee
ADD CONSTRAINT FK_Emp_Team
FOREIGN KEY (SPEmployeeTeamId) REFERENCES SPEmployeeTeam(SPEmployeeTeamId);

ALTER TABLE SPEmployeeTeam
DROP CONSTRAINT FK_Emp_Team;

ALTER TABLE SPEmployeeTeam
ADD CONSTRAINT FK_Team_Manager
FOREIGN KEY (SPEmployeeManagerId) REFERENCES SPEmployeeManager(SPEmployeeManagerId);

ALTER TABLE SPEmployeeTeam
ADD CONSTRAINT FK_Team_Dept
FOREIGN KEY (SPEmployeeDepartmentId) REFERENCES SPEmployeeDepartment(SPEmployeeDepartmentId);

ALTER TABLE SPEmployee
ADD CONSTRAINT CHK_PersonAge CHECK (SPEmployeeDOB>='2003-01-01');



-- inserting records in tables...........


--creating new database

CREATE DATABASE SP353SanjayPrajapati

--creating table with name SPEmployee

USE SP353SanjayPrajapati

CREATE TABLE SPEmployee (
	SPEmployeeId INT PRIMARY KEY IDENTITY(1,1),
	SPEmployeeFirstName VARCHAR(250) NOT NULL,
	SPEmployeeLastName VARCHAR(250) NOT NULL,
	SPEmployeeEmailId VARCHAR(150) UNIQUE NOT NULL,
	SPEmployeeDepartmentId INT,
	SPEmployeeGender VARCHAR(20),
	SPEmployeeDOB DATE,
	SPEmployeeDOJ DATE,
	SPEmployeeMobileNumber1 VARCHAR(20),
	SPEmployeeMobileNumber2 VARCHAR(20),
	SPEmployeePhotoName VARCHAR(250),
	SPEmployeePhoto VARBINARY(MAX),
	SPEmployeePinCode VARCHAR(6),
	SPEmployeeCityCode VARCHAR(50),
	SPEmployeeStateCode INT,
	SPEmployeeCountryCode INT,
	SPEmployeeCurrentAddress NVARCHAR(MAX),
	SPEmployeePermanentAddress Nvarchar(MAX),
	SPEmployeeSalary DECIMAL(10,2),
	SPEmployeeCode INT,
	SPEmployeeBankAccountNo VARCHAR(256),
	SPEmployeeBankName VARCHAR(256),
	SPEmployeeIfscCode VARCHAR(256),
	SPEmployeePanCardNo varchar(256),
	SPEmployeeResigned VARCHAR(20),
	SPEmployeeManagerId INT,
	SPEmployeeTeamId INT,
	SPEmployeeDescription NVARCHAR(MAX),
	SPEmployeeCreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP NOT NUll,
	SPEmployeeUpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
)
select * from SPEmployee

--ALTER TABLE STATEMENTS...
ALTER TABLE SPEmployee
ADD SPEmployeeAdharNo VARCHAR(256);

EXEC sp_RENAME 'SPEmployee.SPEmployeeResigned', 'SPEmployeeResigned', 'COLUMN'

ALTER TABLE SPEmployee
ALTER COLUMN SPEmployeeMobileNumber1 VARCHAR(20) NOT NULL;

ALTER TABLE SPEmployee
ADD CONSTRAINT UC_SPEmployee  UNIQUE (SPEmployeeAdharNo);

ALTER TABLE SPEmployee
DROP CONSTRAINT UC_SPEmployee;

--ALTER TABLE SPEmployee
--add  CONSTRAINT df_SPEmployeeUpdatedAt
--DEFAULT CURRENT_TIMESTAMP FOR SPEmployeeUpdatedAt;

CREATE TABLE SPEmployeeDepartment(
	SPEmployeeDepartmentId INT PRIMARY KEY IDENTITY(1,1),
	SPDepartmentName VARCHAR(250) NOT NULL,
	SPDepartmentManagerId INT NOT NULL,
)

drop table SPEmployeeDepartment

ALTER TABLE SPEmployee
ADD FOREIGN KEY (SPEmployeeDepartmentId) REFERENCES SPEmployeeDepartment(SPEmployeeDepartmentId);

CREATE TABLE SPEmployeeManager(
	SPEmployeeManagerId INT PRIMARY KEY IDENTITY(1,1),
	SPEmployeeManagerName VARCHAR(250) NOT NULL,
)

drop table SPEmployeeManager

ALTER TABLE SPEmployee
ADD FOREIGN KEY (SPEmployeeManagerId) REFERENCES SPEmployeeManager(SPEmployeeManagerId);

ALTER TABLE SPEmployeeDepartment
DROP COLUMN SPDepartmentManagerId;

ALTER TABLE SPEmployeeManager
ADD SPEmployeeDepartmentId INT NOT NULL;

ALTER TABLE SPEmployeeManager
ADD FOREIGN KEY (SPEmployeeDepartmentId) REFERENCES SPEmployeeDepartment(SPEmployeeDepartmentId);

CREATE TABLE SPEmployeeTeam(
	SPEmployeeTeamId INT PRIMARY KEY IDENTITY(1,1),
	SPEmployeeTeamLeaderName VARCHAR(250) NOT NULL,
)

ALTER TABLE SPEmployeeTeam
ADD SPEmployeeManagerId INT NOT NULL;

ALTER TABLE SPEmployeeTeam
ADD SPEmployeeDepartmentId INT NOT NULL;

ALTER TABLE SPEmployee
ADD CONSTRAINT FK_Emp_Team
FOREIGN KEY (SPEmployeeTeamId) REFERENCES SPEmployeeTeam(SPEmployeeTeamId);

ALTER TABLE SPEmployeeTeam
DROP CONSTRAINT FK_Emp_Team;

ALTER TABLE SPEmployeeTeam
ADD CONSTRAINT FK_Team_Manager
FOREIGN KEY (SPEmployeeManagerId) REFERENCES SPEmployeeManager(SPEmployeeManagerId);

ALTER TABLE SPEmployeeTeam
ADD CONSTRAINT FK_Team_Dept
FOREIGN KEY (SPEmployeeDepartmentId) REFERENCES SPEmployeeDepartment(SPEmployeeDepartmentId);

ALTER TABLE SPEmployee
ADD CONSTRAINT CHK_PersonAge CHECK (SPEmployeeDOB>='2003-01-01');



-- inserting records in tables...........



INSERT INTO SPEmployeeDepartment (SPDepartmentName)
VALUES ('NETWORKAND INTERNET');

select * from SPEmployeeDepartment


INSERT INTO SPEmployeeManager (SPEmployeeManagerName,SPEmployeeDepartmentId)
VALUES ('sanjayVP',1);

select * from SPEmployeeManager


INSERT INTO SPEmployeeTeam (SPEmployeeTeamLeaderName,SPEmployeeManagerId,SPEmployeeDepartmentId)
VALUES ('vishal',1,1);

select * from SPEmployee
insert into SPEmployee (SPEmployeeFirstName, SPEmployeeLastName, SPEmployeeEmailId, SPEmployeeDepartmentId, SPEmployeeGender, SPEmployeeDOB, SPEmployeeDOJ, SPEmployeeMobileNumber1, SPEmployeeMobileNumber2, SPEmployeePinCode, SPEmployeeCityCode, SPEmployeeStateCode, SPEmployeeCountryCode, SPEmployeeCurrentAddress, SPEmployeePermanentAddress, SPEmployeeSalary, SPEmployeeCode, SPEmployeeBankAccountNo, SPEmployeeBankName, SPEmployeeIfscCode, SPEmployeePanCardNo, SPEmployeeResigned , SPEmployeeManagerId, SPEmployeeTeamId, SPEmployeeDescription, SPEmployeeAdharNo) 
values 
('Gunar', 'Pusill', 'mbrundill0@slideshare.net', 1, 'Male', '2004-04-16', '2022-08-03', '4993454387', '5488578248', '369990', 59088737, '100868', 05550392, '9908 Welch Avenue', '24 Claremont Lane', 1172510, 1, 75193641395, 'Matthieu', 45, 80359145048, 'Yes', 1, 5, 'Aneurysmal bone cyst, right ankle and foot',865975698536),
('Cristian', 'Rogister', 'rgrigoryev1@admin.ch', 1, 'Male', '2011-01-26', '2016-06-24', '3434209996', '3647482447',  '597259', 65954007, '517814', 551540697, '897 Fordem Street', '68 Toban Street', 8873279, 2, 88630680095, 'Raffaello', 19, 93558618571, 'No', 1, 5, 'Inj cutan sensory nerve at shldr/up arm, right arm, init',758695485698),
('Worthington', 'Bramont', 'nhessentaler2@cloudflare.com', 1, 'Male', '2005-01-10', '2018-01-24', '8049139938', '6348862983',  '584028', '372077', 11994427, 504366916, '85470 Pennsylvania Drive', '762 Stephen Lane', 5979426, 3, 68240517691, 'Neel', 28, 86179165348, 'No', 1, 5, 'Unsp tear of unsp meniscus, current injury, unsp knee, subs',856986597635),
('Anita', 'Meffin', 'lbridge3@wisc.edu', 1, 'Female', '2005-02-04', '2022-04-13', '9626683043', '6169192340',  '493499', 21695773, '6878102', 551188, '49 Shasta Point', '058 Mosinee Center', 7263065, 4, 43037510943, 'Larine', 11, 83559907305, 'Yes', 1, 5, 'Barton''s fx left rad, subs for opn fx type 3A/B/C w malunion',456985698659),
('Genevra', 'Risson', 'hbeidebeke4@hud.gov', 1, 'Female', '2006-10-11', '2021-02-08', '5802692778', '7132485445',  '372051', '4374030', '368066', 68405019, '0 Pond Street', '322 Marquette Terrace', 9076797, 5, 77671581237, 'Helen', 55, 82206558215, 'Yes', 1, 5, 'External constriction of vagina and vulva',697569865329);

DELETE FROM SPEmployeeManager WHERE SPEmployeeManagerid=9;
BEGIN TRAN 
UPDATE SPEmployee
SET SPEmployeeFirstName = 'Alfred Schmidt', SPEmployeeBankName= 'BANK OF INDIA'
WHERE SPEmployeeId = 7;

COMMIT TRAN
ROLLBACK TRAN



DELETE FROM SPEmployeeManager WHERE SPEmployeeManagerid=2;
BEGIN TRAN 
UPDATE SPEmployee
SET SPEmployeeFirstName = 'Alfred Schmidt', SPEmployeeBankName= 'BANK OF INDIA'
WHERE SPEmployeeId = 7;

COMMIT TRAN
ROLLBACK TRAN



select * from SPEmployeeManager